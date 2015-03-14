object Form1: TForm1
  Left = 757
  Top = 330
  BorderStyle = bsSingle
  Caption = 'Delphi Calc'
  ClientHeight = 167
  ClientWidth = 293
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 192
    Top = 144
    Width = 93
    Height = 13
    Caption = 'Delphi Cacl - v1.0.0'
  end
  object LabelUserName: TLabel
    Left = 16
    Top = 144
    Width = 3
    Height = 13
  end
  object ApplicationEvents1: TApplicationEvents
    OnActionExecute = ApplicationEvents1ActionExecute
    OnActionUpdate = ApplicationEvents1ActionUpdate
    OnActivate = ApplicationEvents1Activate
    OnDeactivate = ApplicationEvents1Deactivate
    OnException = ApplicationEvents1Exception
    OnMessage = ApplicationEvents1Message
    Left = 24
    Top = 24
  end
end
