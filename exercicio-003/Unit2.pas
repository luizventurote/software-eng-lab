unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit1;

type
  TForm2 = class(TForm)
    visor: TEdit;
    BtnClear: TButton;
    procedure FormCreate(Sender: TObject);
    procedure addOnScreen(Sender: TObject);
    procedure BtnClearClick(Sender: TObject);
    procedure BtnEnterClick(Sender: TObject);
    procedure BtnDivClick(Sender: TObject);
    procedure BtnSubClick(Sender: TObject);
    procedure BtnMulClick(Sender: TObject);
    procedure BtnSomClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    VAR_GLOBAL: TGlobalVar;
  end;

var
  Form2: TForm2;
  valor1 : real;
  valor2 : real;
  funcao : integer;

implementation

{$R *.dfm}

// Add on screeen
procedure TForm2.addOnScreen(Sender: TObject);
var
  caption_btn: string;
begin

  // Send to calc visor
  caption_btn := (Sender as TButton).Caption;
  Form2.visor.Text := Form2.visor.Text + caption_btn;
  VAR_GLOBAL.addLog('Bot�o '+caption_btn+' da calculadora click');

end;

// Clear visor
function clearCalcVIsor : integer;
begin
  Form2.visor.Text := '';
  result := 1;
end;

// On create form
procedure TForm2.FormCreate(Sender: TObject);
var
  btn: TButton;
  index: integer;
  top_btn: integer;
  left_btn: integer;
begin

  top_btn := 55;
  left_btn := 10;

  // Create calc number buttons
  for index := 0 to 9 do begin

    btn := TButton.Create(Self);
    btn.Parent := Self;
    btn.Width := 50;
    btn.Height := 50;
    btn.Caption := IntToStr(index);
    btn.top := top_btn;
    btn.OnClick := Form2.addOnScreen;

    // Mult 3
    if ((index mod 3)=0) and (not(index=0)) then begin
      left_btn := 60 * 2;
      top_btn := 55 + top_btn;
      btn.Left := left_btn;
      left_btn := 10;
    end
    else begin

      // BTN 0
      if index = 0 then begin
        btn.Width := 50;
        btn.top := 222;
       btn.Left := 10;
       left_btn := 10;
      end else begin
        btn.Left := left_btn;
         left_btn := 55 + left_btn;
      end;

    end;

  end;  // end for

  // Create ENTER button
  btn := TButton.Create(Self);
  btn.Parent := Self;
  btn.Width := 50;
  btn.Height := 50;
  btn.Caption := 'Enter';
  btn.top := 222;
  btn.Left := 65;
  btn.Width := 105;
  btn.OnClick := Form2.BtnEnterClick;

  // Create SUB button
  top_btn:= 55;
  btn := TButton.Create(Self);
  btn.Parent := Self;
  btn.Width := 50;
  btn.Height := 50;
  btn.Caption := '-';
  btn.top := top_btn;
  btn.Left := 175;
  btn.Width := 50; 
  btn.OnClick := Form2.BtnSubClick;

  // Create SOM button 
  top_btn:= 55 + top_btn;
  btn := TButton.Create(Self);
  btn.Parent := Self;
  btn.Width := 50;
  btn.Height := 50;
  btn.Caption := '+';
  btn.top := top_btn;
  btn.Left := 175;
  btn.Width := 50;
  btn.OnClick := Form2.BtnSomClick;

  // Create DIV button
  top_btn:= 55 + top_btn;
  btn := TButton.Create(Self);
  btn.Parent := Self;
  btn.Width := 50;
  btn.Height := 50;
  btn.Caption := '/';
  btn.top := top_btn;
  btn.Left := 175;
  btn.Width := 50;
  btn.OnClick := Form2.BtnDivClick;

  // Create MUL button
  top_btn:= 55 + top_btn;
  btn := TButton.Create(Self);
  btn.Parent := Self;
  btn.Width := 50;
  btn.Height := 50;
  btn.Caption := '*';
  btn.top := top_btn;
  btn.Left := 175;
  btn.Width := 50;
  btn.OnClick := Form2.BtnMulClick;

end;

// BTN Reset visor
procedure TForm2.BtnClearClick(Sender: TObject);
begin
  clearCalcVIsor();
  VAR_GLOBAL.addLog('Calculator display reset');
end;

// BTN Enter
procedure TForm2.BtnEnterClick(Sender: TObject);
var
  soma: real;
begin

  valor2 := StrToFloat(visor.Text);

  case (funcao) of

    1:
    begin
      soma := valor1+valor2;
      visor.text := FloatToStr(soma);
      VAR_GLOBAL.addLog('Calculator som: ' + FloatToStr(valor1) + ' + ' + FloatToStr(valor2) + ' = ' + visor.text);
    end;

    2:
    begin
      soma := valor1-valor2;
      visor.text := FloatToStr(soma);  
      VAR_GLOBAL.addLog('Calculator div: ' + FloatToStr(valor1) + ' - ' + FloatToStr(valor2) + ' = ' + visor.text);
    end;

    3:
    begin
      soma := valor1 * valor2;
      visor.text := FloatToStr(soma);
      VAR_GLOBAL.addLog('Calculator mul: ' + FloatToStr(valor1) + ' * ' + FloatToStr(valor2) + ' = ' + visor.text);
    end;

    4:
    begin
      soma := valor1/valor2;
      visor.text := FloatToStr(soma); 
      VAR_GLOBAL.addLog('Calculator div: ' + FloatToStr(valor1) + ' / ' + FloatToStr(valor2) + ' = ' + visor.text);
    end

  end; //finaliza o case

  VAR_GLOBAL.addLog('Calculator enter click');
end;

// BTN MUL
procedure TForm2.BtnMulClick(Sender: TObject);
begin

  valor1 := StrToFloat(visor.Text);
  clearCalcVIsor();
  funcao := 3;

  VAR_GLOBAL.addLog('Calculator multiplication click');
end;

// BTN DIV
procedure TForm2.BtnDivClick(Sender: TObject);
begin

  valor1 := StrToFloat(visor.Text);
  clearCalcVIsor();
  funcao := 4;

  VAR_GLOBAL.addLog('Calculator valor do visor: ' + FloatToStr(valor1));
  VAR_GLOBAL.addLog('Calculator division click');
end;

// BTN SOM
procedure TForm2.BtnSomClick(Sender: TObject);
begin

  valor1 := StrToFloat(visor.Text);
  clearCalcVIsor();
  funcao := 1;

  VAR_GLOBAL.addLog('Calculator soma click');
end;

// BTN Sub
procedure TForm2.BtnSubClick(Sender: TObject);
begin

  valor1 := StrToFloat(visor.Text);
  clearCalcVIsor();
  funcao := 2;

  VAR_GLOBAL.addLog('Calculator valor do visor: ' + FloatToStr(valor1));
  VAR_GLOBAL.addLog('Calculator subtra��o click');
end;

procedure TForm2.FormShow(Sender: TObject);
begin
    valor1 := 0;
    valor2 := 0;
end;

end.
