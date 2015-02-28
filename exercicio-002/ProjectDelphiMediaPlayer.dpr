program ProjectDelphiMediaPlayer;

uses
  Forms,
  DelphiMediaPlayer in 'DelphiMediaPlayer.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Delphi Media Player';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
