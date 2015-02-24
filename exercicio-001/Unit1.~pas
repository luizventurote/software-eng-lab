unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    EditName: TEdit;
    Label1: TLabel;
    Fechar: TButton;
    Button1: TButton;
    EditAddress: TEdit;
    Label2: TLabel;
    EditPhone: TEdit;
    Label3: TLabel;
    EditBirthday: TEdit;
    Label4: TLabel;
    Memo1: TMemo;
    procedure FecharClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure ChangeFocus(Sender: TObject);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FecharClick(Sender: TObject);
begin
  // Close Form
  Form1.Close;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Memo1.Lines.Add(Form1.EditName.Text + ' - ' + Form1.EditAddress.Text + ' - ' + Form1.EditPhone.Text + ' - ' + Form1.EditBirthday.Text);

  // Clean form edits
  Form1.EditName.Text := '';
  Form1.EditAddress.Text := '';
  Form1.EditPhone.Text := '';
  Form1.EditBirthday.Text := '';

  // Set form focus to edit name
  Form1.EditName.SetFocus;

end;

// Altera a cor do foco do edit
procedure TForm1.ChangeFocus(Sender: TObject);
var
  index: integer;
  edit: TEdit;
begin
  for index := 0 to ComponentCount - 1 do
    // Verifica se é do tipo TEdit
    if Components[index] is TEdit then
    begin
      // Faz um type-casting (Conversão de tipos) pata o tipo TEdit
      edit := Components[index] as TEdit;

      // Verifica se o Edit está com foco
      if edit.Focused then
        edit.Color := $DCF8FF
      else
        edit.Color := clWindow;
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  index: integer;
begin

  // Faz referência de uma procedure em um evento
  for index := 0 to ComponentCount - 1 do
    if Components[index] is TEdit then
      begin
      (Components[index] as TEdit).OnEnter := ChangeFocus;
      end;
end;

end.
