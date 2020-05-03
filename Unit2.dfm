object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 762
  ClientWidth = 1165
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 32
    Top = 8
    Width = 1100
    Height = 700
  end
  object MediaPlayer1: TMediaPlayer
    Left = 152
    Top = 724
    Width = 253
    Height = 30
    AutoOpen = True
    DoubleBuffered = True
    FileName = 'D:\'#1091#1095#1077#1073#1072'\'#1054#1040#1048#1055'\2sem\5lab\Win32\Debug\Sound_05815.mp3'
    Visible = False
    ParentDoubleBuffered = False
    TabOrder = 0
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 104
    Top = 720
  end
end
