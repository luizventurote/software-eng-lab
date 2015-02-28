unit DelphiMediaPlayer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MPlayer, ComCtrls, StdCtrls, ExtCtrls, Menus;

type
  TForm1 = class(TForm)
    Screen: TPanel;
    PlayList: TListBox;
    BtnAddFile: TButton;
    BtnPlay: TButton;
    BtnStop: TButton;
    TimeLine: TProgressBar;
    StatusBar: TStatusBar;
    MediaPlayer: TMediaPlayer;
    OpenDialogBox: TOpenDialog;
    BtnPause: TButton;
    BtnLoad: TButton;
    MainMenu1: TMainMenu;
    Menu1: TMenuItem;
    Info1: TMenuItem;
    Exit1: TMenuItem;
    Timer1: TTimer;
    BtnPrior: TButton;
    BtnNext: TButton;
    BtnUpPlaylist: TButton;
    BtnDownPlaylist: TButton;
    BtnRemovePlayList: TButton;
    RandomPlay: TCheckBox;
    FileInfoBox: TRichEdit;
    procedure BtnAddFileClick(Sender: TObject);
    procedure BtnPlayClick(Sender: TObject);
    procedure BtnStopClick(Sender: TObject);
    procedure Info1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BtnLoadClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BtnPauseClick(Sender: TObject);
    procedure BtnNextClick(Sender: TObject);
    procedure BtnPriorClick(Sender: TObject);
    procedure BtnRemovePlayListClick(Sender: TObject);
    procedure BtnUpPlaylistClick(Sender: TObject);
    procedure BtnDownPlaylistClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Math;

{$R *.dfm}


// Play File
function PlayFile(): integer;
begin
  Form1.MediaPlayer.Play;
  Form1.MediaPlayer.DisplayRect := Form1.Screen.ClientRect;
  Form1.Timer1.Enabled := true;

  // Enable Pause and Stop buttons
  Form1.BtnPause.Enabled  := true;
  Form1.BtnStop.Enabled   := true;

  // Disable Play button
  Form1.BtnPlay.Enabled := false;

  Result := 1;
end;


// Move an item up
procedure LbMoveItemUp(AListBox: TListBox);
var
  CurrIndex: Integer;
begin
  with AListBox do
    if ItemIndex > 0 then
    begin
      CurrIndex := ItemIndex;
      Items.Move(ItemIndex, (CurrIndex - 1));
      ItemIndex := CurrIndex - 1;
    end;
end;


// Move an item down
procedure LbMoveItemDown(AListBox: TListBox);
var
  CurrIndex, LastIndex: Integer;
begin
  with AListBox do
  begin
    CurrIndex := ItemIndex;
    LastIndex := Items.Count;
    if ItemIndex <> -1 then
    begin
      if CurrIndex + 1 < LastIndex then
      begin
        Items.Move(ItemIndex, (CurrIndex + 1));
        ItemIndex := CurrIndex + 1;
      end;
    end;
  end;
end;


// Next file
procedure nextFile();
begin
  if Form1.PlayList.ItemIndex+1 < Form1.PlayList.Items.Count then
    begin

      // Open file
      Form1.MediaPlayer.FileName := Form1.PlayList.Items.Strings[Form1.PlayList.ItemIndex+1];
      Form1.MediaPlayer.Open;
      Form1.StatusBar.SimpleText := Form1.MediaPlayer.FileName;

      // Init progress bar status
      Form1.TimeLine.Position := 0;
      Form1.TimeLine.Min :=0 ;
      Form1.TimeLine.Max := Form1.MediaPlayer.Length;

      // Play
      PlayFile();

      Form1.PlayList.ItemIndex := Form1.PlayList.ItemIndex+1;
    end
  else
    begin

      // Open file
      Form1.MediaPlayer.FileName := Form1.PlayList.Items.Strings[0];
      Form1.MediaPlayer.Open;
      Form1.StatusBar.SimpleText := Form1.MediaPlayer.FileName;

      // Init progress bar status
      Form1.TimeLine.Position := 0;
      Form1.TimeLine.Min :=0 ;
      Form1.TimeLine.Max := Form1.MediaPlayer.Length;

      // Play
      PlayFile();

      Form1.PlayList.ItemIndex := 0;
    end;
end;


// Next random file
procedure nextRandomFile();
var
randomindex : integer;
begin

  randomindex := Random(Form1.PlayList.Items.Count-1);

  // Open file
  Form1.MediaPlayer.FileName := Form1.PlayList.Items.Strings[randomindex];
  Form1.MediaPlayer.Open;
  Form1.StatusBar.SimpleText := Form1.MediaPlayer.FileName;

  // Init progress bar status
  Form1.TimeLine.Position := 0;
  Form1.TimeLine.Min :=0 ;
  Form1.TimeLine.Max := Form1.MediaPlayer.Length;

  // Play
  PlayFile();

  Form1.PlayList.ItemIndex := randomindex;

end;


// Continue playing
procedure ContinuePlaying(random: boolean);
begin
      if random then
      begin
        nextRandomFile();
      end
      else
      begin
        nextFile();
      end
end;


procedure TForm1.BtnAddFileClick(Sender: TObject);
begin
  // Add news items to the play list
  if OpenDialogBox.Execute then
    PlayList.Items.Add(OpenDialogBox.FileName);
end;

procedure TForm1.BtnPlayClick(Sender: TObject);
begin
  if PlayList.ItemIndex = -1 then
    begin
      ShowMessage('Please, select an item from the playlist!');
    end
  else
    begin
      // Play
      PlayFile();
    end
end;

procedure TForm1.BtnStopClick(Sender: TObject);
begin

  // Stop and close file
  MediaPlayer.Stop;
  MediaPlayer.Close;

  // Reset timeline
  TimeLine.Position := 0;

  // Enable Play button
  BtnPlay.Enabled := false;
  BtnPause.Enabled := false;
  BtnStop.Enabled := false;

  Timer1.Enabled := false;
end;

procedure TForm1.Info1Click(Sender: TObject);
begin
  ShowMessage('Delphi Media Player 1.0');
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  // Close Form
  Form1.Close;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  TimeLine.Position := MediaPlayer.Position;

  if TimeLine.Position = MediaPlayer.Length then
    begin
      Timer1.Enabled := false;
      ContinuePlaying(RandomPlay.Checked);
    end;

end;

procedure TForm1.BtnLoadClick(Sender: TObject);
begin
  if PlayList.ItemIndex = -1 then
    begin
      ShowMessage('Please, select an item from the playlist!');
    end
  else
    begin
      MediaPlayer.FileName := PlayList.Items.Strings[PlayList.ItemIndex];
      MediaPlayer.Open;
      StatusBar.SimpleText := MediaPlayer.FileName;

      // Init progress bar status
      TimeLine.Min :=0 ;
      TimeLine.Max := MediaPlayer.Length;

      // Enable play button
      BtnPlay.Enabled := true;

    end
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin

    // Save playlist
    PlayList.Items.SaveToFile('C:\playlist.txt');

    if TimeLine.Position > 0 then
    begin
      FileInfoBox.Lines.Clear;
      FileInfoBox.Lines.Add(MediaPlayer.FileName);
      FileInfoBox.Lines.Add(IntToStr(TimeLine.Position));
      FileInfoBox.Lines.SaveToFile('C:\currentfile.txt');
    end
    else
    begin
      FileInfoBox.Lines.Clear;
      FileInfoBox.Lines.SaveToFile('C:\currentfile.txt');
    end

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

  // Load playlist
  PlayList.Items.LoadFromFile('C:\playlist.txt');

  FileInfoBox.Lines.LoadFromFile('C:\currentfile.txt');


  if not (FileInfoBox.Lines.Strings[0] = '') then
  begin

    MediaPlayer.FileName := FileInfoBox.Lines.Strings[0];
    MediaPlayer.Open;
    MediaPlayer.Position := StrToInt(FileInfoBox.Lines.Strings[1]);
    StatusBar.SimpleText := MediaPlayer.FileName;

    // Init progress bar status
    TimeLine.Min :=0 ;
    TimeLine.Max := MediaPlayer.Length;
    TimeLine.Position := StrToInt(FileInfoBox.Lines.Strings[1]);

    // Play
    PlayFile();
  end;

end;

procedure TForm1.BtnPauseClick(Sender: TObject);
begin
  MediaPlayer.Pause;
  
  // Enable Play button
  BtnPlay.Enabled := true;
end;

procedure TForm1.BtnNextClick(Sender: TObject);
begin

  nextFile();

end;

procedure TForm1.BtnPriorClick(Sender: TObject);
begin
  if PlayList.ItemIndex > 0 then
    begin

      // Open file
      MediaPlayer.FileName := PlayList.Items.Strings[PlayList.ItemIndex-1];
      MediaPlayer.Open;
      StatusBar.SimpleText := MediaPlayer.FileName;

      // Init progress bar status
      TimeLine.Position := 0;
      TimeLine.Min :=0 ;
      TimeLine.Max := MediaPlayer.Length;

      // Play
      PlayFile();

      PlayList.ItemIndex := PlayList.ItemIndex-1;
    end
  else
    begin

      // Open file
      MediaPlayer.FileName := PlayList.Items.Strings[PlayList.Items.Count-1];
      MediaPlayer.Open;
      StatusBar.SimpleText := MediaPlayer.FileName;

      // Init progress bar status
      TimeLine.Position := 0;
      TimeLine.Min :=0 ;
      TimeLine.Max := MediaPlayer.Length;

      // Play
      PlayFile();

      PlayList.ItemIndex := PlayList.Items.Count-1;
    end;
end;

procedure TForm1.BtnRemovePlayListClick(Sender: TObject);
begin
  PlayList.Items.Delete(PlayList.ItemIndex);
end;

procedure TForm1.BtnUpPlaylistClick(Sender: TObject);
begin
  LbMoveItemUp(PlayList);
end;

procedure TForm1.BtnDownPlaylistClick(Sender: TObject);
begin
  LbMoveItemDown(PlayList);
end;

end.
