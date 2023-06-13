object Form1: TForm1
  Left = 578
  Top = 273
  Width = 721
  Height = 547
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
  object DBGrid: TDBGrid
    Left = 8
    Top = 8
    Width = 689
    Height = 337
    DataSource = DataSource
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object log: TMemo
    Left = 8
    Top = 352
    Width = 201
    Height = 145
    TabOrder = 1
  end
  object SERVstart: TButton
    Left = 216
    Top = 360
    Width = 75
    Height = 25
    Caption = #1057#1090#1072#1088#1090
    TabOrder = 2
    OnClick = SERVstartClick
  end
  object SERVstop: TButton
    Left = 296
    Top = 360
    Width = 75
    Height = 25
    Caption = #1057#1090#1086#1087
    TabOrder = 3
    OnClick = SERVstopClick
  end
  object clr: TButton
    Left = 376
    Top = 360
    Width = 97
    Height = 25
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1079#1072#1087#1080#1089#1080
    TabOrder = 4
    OnClick = clrClick
  end
  object ServerSocket: TServerSocket
    Active = False
    Port = 0
    ServerType = stNonBlocking
    OnClientConnect = ServerSocketClientConnect
    OnClientDisconnect = ServerSocketClientDisconnect
    OnClientRead = ServerSocketClientRead
    Left = 216
    Top = 392
  end
  object DataSource: TDataSource
    DataSet = DataSet
    Left = 256
    Top = 392
  end
  object DataSet: TClientDataSet
    Aggregates = <>
    FileName = 'C:\Users\tima03\Desktop\PR2\server\db.xml'
    Params = <>
    Left = 296
    Top = 392
  end
end
