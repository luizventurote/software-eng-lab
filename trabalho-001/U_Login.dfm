object FormLogin: TFormLogin
  Left = 798
  Top = 467
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Login'
  ClientHeight = 236
  ClientWidth = 278
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Username: TLabel
    Left = 40
    Top = 40
    Width = 48
    Height = 13
    Caption = 'Username'
  end
  object Password: TLabel
    Left = 40
    Top = 104
    Width = 46
    Height = 13
    Caption = 'Password'
  end
  object EditUserName: TEdit
    Left = 40
    Top = 64
    Width = 201
    Height = 21
    TabOrder = 0
  end
  object EditPassword: TEdit
    Left = 40
    Top = 128
    Width = 201
    Height = 21
    TabOrder = 1
  end
  object Login: TButton
    Left = 40
    Top = 168
    Width = 201
    Height = 25
    Caption = 'Login'
    TabOrder = 2
  end
end
