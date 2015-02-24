object Form1: TForm1
  Left = 594
  Top = 151
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Cadastro de cliente'
  ClientHeight = 525
  ClientWidth = 264
  Color = clGradientInactiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 37
    Height = 16
    Caption = 'Name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 80
    Width = 51
    Height = 16
    Caption = 'Address'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 144
    Width = 39
    Height = 16
    Caption = 'Phone'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 208
    Width = 49
    Height = 16
    Caption = 'Birthday'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object EditName: TEdit
    Left = 8
    Top = 40
    Width = 249
    Height = 21
    TabOrder = 0
  end
  object Fechar: TButton
    Left = 8
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 2
    TabStop = False
    OnClick = FecharClick
  end
  object Button1: TButton
    Left = 136
    Top = 272
    Width = 121
    Height = 25
    Caption = 'Sing Up'
    TabOrder = 5
    OnClick = Button1Click
  end
  object EditAddress: TEdit
    Left = 8
    Top = 104
    Width = 249
    Height = 21
    TabOrder = 1
  end
  object EditPhone: TEdit
    Left = 8
    Top = 168
    Width = 249
    Height = 21
    TabOrder = 3
  end
  object EditBirthday: TEdit
    Left = 8
    Top = 232
    Width = 145
    Height = 21
    TabOrder = 4
  end
  object Memo1: TMemo
    Left = 8
    Top = 312
    Width = 249
    Height = 201
    TabStop = False
    TabOrder = 6
  end
end
