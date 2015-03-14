unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit1;

type
  TForm4 = class(TForm)
    Memo1: TMemo;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    VAR_GLOBAL: TGlobalVar;
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.FormShow(Sender: TObject);
begin
    Memo1.Lines := VAR_GLOBAL.getSystemLog;
end;

end.
