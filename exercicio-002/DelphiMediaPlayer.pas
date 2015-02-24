unit DelphiMediaPlayer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, MPlayer, ComCtrls, ExtCtrls, jpeg;

type
  TForm1 = class(TForm)
    PlayList: TListBox;
    BtnAdd: TButton;
    OpenDialogBox: TOpenDialog;
    StatusBar1: TStatusBar;
    MediaPlayer: TMediaPlayer;
    Panel1: TPanel;
    TimeLine: TProgressBar;
    Timer1: TTimer;
    Image1: TImage;
    BtnLoad: TButton;
    procedure BtnAddClick(Sender: TObject);
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

procedure TForm1.BtnAddClick(Sender: TObject);
begin

  // Add news items to the play list
  if OpenDialogBox.Execute then
    PlayList.Items.Add(OpenDialogBox.FileName);

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
    end
    
end;

end.
