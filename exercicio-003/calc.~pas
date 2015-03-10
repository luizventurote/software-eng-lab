unit calc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    LabelUserName: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure CreateCalcForm(Sender: TObject);
    procedure CreateIMCCalcForm(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  username: string;

implementation

{$R *.dfm}

// Open query box to get user name
function getUserNameBox() : string;
var
  name: string;
begin

  // Keep asking the user for their name
  repeat
    if not InputQuery('Test program', 'Please type your name', name)
    then ShowMessage('User cancelled the dialog');
  until name <> '';

  Result := name;
end;

// Create Calc Form
procedure TForm1.CreateCalcForm(Sender: TObject);
begin
     ShowMessage('Calc active!');
end;

// Create IMC Calc Form
procedure TForm1.CreateIMCCalcForm(Sender: TObject);
begin
     ShowMessage('IMC Calc active!');
end;

// Main form create
procedure TForm1.FormCreate(Sender: TObject);
var
  btn: TButton;
begin

  // Get user name
  username := getUserNameBox();

  // Show their name
  Self.LabelUserName.Caption := 'Hello '+username+'!';

  // Create calc button
  btn := TButton.Create(Self);
  btn.Parent := Self;
  btn.top := 10;
  btn.Left := 10;
  btn.Width := 273;
  btn.Height := 35;
  btn.Caption := 'Calculadora';
  btn.OnClick := Form1.CreateCalcForm;

  // Create IMC Button
  btn := TButton.Create(Self);
  btn.Parent := Self;
  btn.top := btn.Height + 25;
  btn.Left := 10;
  btn.Width := 273;
  btn.Height := 35;
  btn.Caption := 'Calculadora IMC';
  btn.OnClick := Form1.CreateIMCCalcForm;

end;

end.
 