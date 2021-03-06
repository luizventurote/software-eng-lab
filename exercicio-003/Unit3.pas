unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit1;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    EditWeight: TEdit;
    Label2: TLabel;
    EditHeight: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    username: string;
    VAR_GLOBAL: TGlobalVar;
  end;

var
  Form3: TForm3;

implementation

uses calc;

{$R *.dfm}

Function CalculoIMC(Peso : real; Altura : Real) : string;
  var
  imc : real;

  begin

  try

    altura := sqr(altura);
    imc := peso/altura;

  if (imc > 0) and (imc < 18.5)
    then begin
      result := 'Abaixo do Peso';
    end else
      if (imc >= 18.5) and (imc <= 24.9)
      then begin
      result := 'Peso Normal';
    end else

    if (imc >= 25) and (imc <= 29.9)
    then begin
      result := 'Sobrepeso';
    end else

    if (imc >= 30) and (imc <= 34.9)
    then begin
      result := 'Obesidade Grau I';
    end else

  if (imc >= 35) and (imc <= 39.9)
  then begin
  result := 'Obesidade Grau II';
  end else
  if (imc > 40)
  then begin
  result := 'Obesidade Grau III';
  end;
  except
  result := 'Indefinido';
  messagedlg('Ocorreu um erro durante o c�lculo do IMC!' + #13 +
  'Verifique se o peso e a altura da pessoa' + #13 +
  'foram informados corretamente!' , MTERROR, [MBOK],0);
  abort;
  end;

end;

procedure TForm3.Button1Click(Sender: TObject);
var
  result_calc: string;
begin

    // Calc IMC
    result_calc := CalculoIMC(StrToFloat(EditWeight.Text), StrToFloat(EditHeight.Text));

    Memo1.Lines.Clear;
    Memo1.Lines.Add( 'Ol� '+VAR_GLOBAL.getUserName+' - ' + result_calc );

    // Log
    VAR_GLOBAL.addLog( VAR_GLOBAL.getUserName + ' calculou o IMC com peso de ' + EditWeight.Text + ' e altura de ' + EditHeight.Text + ' - resultado: ' + result_calc );

end;

end.
