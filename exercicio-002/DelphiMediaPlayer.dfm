object Form1: TForm1
  Left = 415
  Top = 211
  AutoScroll = False
  Caption = 'Delphi Media Player'
  ClientHeight = 440
  ClientWidth = 636
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PlayList: TListBox
    Left = 480
    Top = 8
    Width = 145
    Height = 281
    ItemHeight = 13
    TabOrder = 0
  end
  object BtnAdd: TButton
    Left = 480
    Top = 296
    Width = 49
    Height = 33
    Caption = 'Add'
    TabOrder = 1
    OnClick = BtnAddClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 421
    Width = 636
    Height = 19
    Panels = <>
  end
  object MediaPlayer: TMediaPlayer
    Left = 8
    Top = 360
    Width = 622
    Height = 57
    ColoredButtons = [btPlay, btPause, btStop, btNext, btPrev, btStep, btBack]
    TabOrder = 3
  end
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 465
    Height = 321
    BevelOuter = bvNone
    Color = clCaptionText
    TabOrder = 4
    object Image1: TImage
      Left = 48
      Top = 64
      Width = 105
      Height = 105
    end
  end
  object TimeLine: TProgressBar
    Left = 8
    Top = 336
    Width = 617
    Height = 17
    TabOrder = 5
  end
  object BtnLoad: TButton
    Left = 536
    Top = 296
    Width = 89
    Height = 33
    Caption = 'Load'
    TabOrder = 6
    OnClick = BtnLoadClick
  end
  object OpenDialogBox: TOpenDialog
    Filter = 'Select a song or video|*.mp3;*.avi;*.mp4'
    Left = 440
    Top = 16
  end
  object Timer1: TTimer
    Left = 408
    Top = 16
  end
end
