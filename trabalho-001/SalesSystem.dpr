program SalesSystem;

uses
  Forms,
  U_Main in 'U_Main.pas' {FormMain},
  U_Login in 'U_Login.pas' {FormLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormLogin, FormLogin);
  Application.Run;
end.
