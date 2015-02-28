object Form1: TForm1
  Left = 445
  Top = 206
  Width = 856
  Height = 564
  Caption = 'Delphi Media Player'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Screen: TPanel
    Left = 8
    Top = 8
    Width = 633
    Height = 393
    BevelOuter = bvNone
    Caption = 'Screen'
    Color = clBackground
    TabOrder = 0
  end
  object PlayList: TListBox
    Left = 648
    Top = 8
    Width = 185
    Height = 313
    ItemHeight = 13
    TabOrder = 1
  end
  object BtnAddFile: TButton
    Left = 648
    Top = 368
    Width = 185
    Height = 33
    Caption = 'Add new file'
    TabOrder = 2
    OnClick = BtnAddFileClick
  end
  object BtnPlay: TButton
    Left = 88
    Top = 432
    Width = 75
    Height = 49
    Caption = 'Play'
    Enabled = False
    TabOrder = 3
    OnClick = BtnPlayClick
  end
  object BtnStop: TButton
    Left = 248
    Top = 432
    Width = 75
    Height = 49
    Caption = 'Stop'
    Enabled = False
    TabOrder = 4
    OnClick = BtnStopClick
  end
  object TimeLine: TProgressBar
    Left = 8
    Top = 408
    Width = 817
    Height = 17
    TabOrder = 5
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 487
    Width = 840
    Height = 19
    Panels = <>
  end
  object MediaPlayer: TMediaPlayer
    Left = 376
    Top = 360
    Width = 253
    Height = 30
    Display = Screen
    Visible = False
    TabOrder = 7
  end
  object BtnPause: TButton
    Left = 168
    Top = 432
    Width = 75
    Height = 49
    Caption = 'Pause'
    Enabled = False
    TabOrder = 8
    OnClick = BtnPauseClick
  end
  object BtnLoad: TButton
    Left = 8
    Top = 432
    Width = 75
    Height = 49
    Caption = 'Load'
    TabOrder = 9
    OnClick = BtnLoadClick
  end
  object BtnPrior: TButton
    Left = 328
    Top = 432
    Width = 75
    Height = 49
    Caption = '< Prior'
    TabOrder = 10
    OnClick = BtnPriorClick
  end
  object BtnNext: TButton
    Left = 408
    Top = 432
    Width = 75
    Height = 49
    Caption = 'Next >'
    TabOrder = 11
    OnClick = BtnNextClick
  end
  object Button1: TButton
    Left = 648
    Top = 328
    Width = 57
    Height = 33
    Caption = 'Up'
    TabOrder = 12
  end
  object Button2: TButton
    Left = 712
    Top = 328
    Width = 57
    Height = 33
    Caption = 'Down'
    TabOrder = 13
  end
  object BtnRemovePlayList: TButton
    Left = 776
    Top = 328
    Width = 57
    Height = 33
    Caption = 'X'
    TabOrder = 14
    OnClick = BtnRemovePlayListClick
  end
  object OpenDialogBox: TOpenDialog
    Filter = 'Music file|*.mp3|VIdeo file|*.avi;*mp4'
    Left = 608
    Top = 16
  end
  object MainMenu1: TMainMenu
    Left = 576
    Top = 16
    object Menu1: TMenuItem
      Caption = 'File'
      object Exit1: TMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Info1: TMenuItem
      Caption = 'Info'
      OnClick = Info1Click
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 544
    Top = 16
  end
end
