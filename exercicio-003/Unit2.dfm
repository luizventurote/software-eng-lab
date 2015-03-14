object Form2: TForm2
  Left = 678
  Top = 376
  BorderStyle = bsSingle
  Caption = 'Calc'
  ClientHeight = 284
  ClientWidth = 235
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object visor: TEdit
    Left = 8
    Top = 8
    Width = 177
    Height = 37
    TabStop = False
    AutoSelect = False
    BevelInner = bvNone
    BevelOuter = bvNone
    BiDiMode = bdRightToLeft
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 200
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 0
  end
  object BtnClear: TButton
    Left = 192
    Top = 8
    Width = 33
    Height = 33
    Caption = 'C'
    TabOrder = 1
    OnClick = BtnClearClick
  end
end
