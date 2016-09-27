object Form1: TForm1
  Left = 192
  Top = 124
  Width = 450
  Height = 366
  Caption = 'Server'
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
    Top = 8
    Width = 417
    Height = 313
    TabOrder = 0
    OnChange = logChange
  end
  object ss: TServerSocket
    Active = True
    Port = 4321
    ServerType = stNonBlocking
    OnClientConnect = ssClientConnect
    OnClientDisconnect = ssClientDisconnect
    OnClientRead = ssClientRead
    OnClientWrite = ssClientWrite
    Left = 8
    Top = 8
  end
end
