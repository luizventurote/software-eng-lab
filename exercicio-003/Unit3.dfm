object Form3: TForm3
  Left = 685
  Top = 383
  BorderStyle = bsSingle
  Caption = 'IMC Calc'
  ClientHeight = 149
  ClientWidth = 440
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 34
    Height = 13
    Caption = 'Weight'
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 31
    Height = 13
    Caption = 'Height'
  end
  object Label3: TLabel
    Left = 176
    Top = 16
    Width = 30
    Height = 13
    Caption = 'Result'
  end
  object EditWeight: TEdit
    Left = 8
    Top = 24
    Width = 153
    Height = 21
    TabOrder = 0
  end
  object EditHeight: TEdit
    Left = 8
    Top = 72
    Width = 153
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 8
    Top = 104
    Width = 153
    Height = 33
    Caption = 'Enter'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 176
    Top = 40
    Width = 257
    Height = 97
    Enabled = False
    TabOrder = 3
  end
end
