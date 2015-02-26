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
    procedure BtnAddFileClick(Sender: TObject);
    procedure BtnPlayClick(Sender: TObject);
    procedure BtnStopClick(Sender: TObject);
    procedure Info1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BtnLoadClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

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
      MediaPlayer.Play;
      Timer1.Enabled := true;

      // Enable Pause and Stop buttons
      BtnPause.Enabled  := true;
      BtnStop.Enabled   := true;

      // Disable Play button
      BtnPlay.Enabled := false;

    end
end;

procedure TForm1.BtnStopClick(Sender: TObject);
begin
  MediaPlayer.Stop;
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

end.
