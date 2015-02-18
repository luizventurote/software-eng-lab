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
    procedure ChangeColor(Sender: TObject);
    procedure EditExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
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

procedure TForm1.ChangeColor(Sender: TObject);
begin
  TEdit(Sender).Color := $DCF8FF;
end;

procedure TForm1.EditExit(Sender: TObject);
begin
  TEdit(Sender).Color := clWindow;
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

end.
