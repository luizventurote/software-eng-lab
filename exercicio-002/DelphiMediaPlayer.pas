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
    Button1: TButton;
    Button2: TButton;
    BtnRemovePlayList: TButton;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


// Play File
function PlayFile(): integer;
begin
  Form1.MediaPlayer.Play;
  Form1.Timer1.Enabled := true;

  // Enable Pause and Stop buttons
  Form1.BtnPause.Enabled  := true;
  Form1.BtnStop.Enabled   := true;

  // Disable Play button
  Form1.BtnPlay.Enabled := false;

  Result := 1;
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

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

  // Load playlist
  PlayList.Items.LoadFromFile('C:\playlist.txt');

end;

procedure TForm1.BtnPauseClick(Sender: TObject);
begin
  MediaPlayer.Pause;
  
  // Enable Play button
  BtnPlay.Enabled := true;
end;

procedure TForm1.BtnNextClick(Sender: TObject);
begin

  if PlayList.ItemIndex+1 < PlayList.Items.Count then
    begin

      // Open file
      MediaPlayer.FileName := PlayList.Items.Strings[PlayList.ItemIndex+1];
      MediaPlayer.Open;
      StatusBar.SimpleText := MediaPlayer.FileName;

      // Init progress bar status
      TimeLine.Position := 0;
      TimeLine.Min :=0 ;
      TimeLine.Max := MediaPlayer.Length;

      // Play
      PlayFile();

      PlayList.ItemIndex := PlayList.ItemIndex+1;
    end
  else
    begin

      // Open file
      MediaPlayer.FileName := PlayList.Items.Strings[0];
      MediaPlayer.Open;
      StatusBar.SimpleText := MediaPlayer.FileName;

      // Init progress bar status
      TimeLine.Position := 0;
      TimeLine.Min :=0 ;
      TimeLine.Max := MediaPlayer.Length;

      // Play
      PlayFile();

      PlayList.ItemIndex := 0;
    end;

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

end.
