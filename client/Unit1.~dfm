object Form1: TForm1
  Left = 192
  Top = 124
  Width = 544
  Height = 447
  Caption = #1050#1083#1080#1077#1085#1090
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object log: TMemo
    Left = 8
    Top = 0
    Width = 513
    Height = 401
    TabOrder = 0
  end
  object cs: TClientSocket
    Active = False
    Address = '127.0.0.1'
    ClientType = ctNonBlocking
    Port = 4321
    OnConnect = csConnect
    OnDisconnect = csDisconnect
    OnRead = csRead
    OnError = csError
    Left = 56
    Top = 8
  end
  object te: TTimer
    Interval = 5000
    OnTimer = teTimer
    Left = 88
    Top = 8
  end
end
