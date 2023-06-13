object frmSERV: TfrmSERV
  Left = 950
  Top = 232
  BorderStyle = bsSingle
  Caption = #1057#1077#1088#1074#1077#1088
  ClientHeight = 520
  ClientWidth = 793
  Color = clSilver
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
    Left = 27
    Top = 8
    Width = 740
    Height = 340
    DataSource = DataSource
    FixedColor = clMenu
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object mmoLOG: TMemo
    Left = 27
    Top = 360
    Width = 200
    Height = 150
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object SERVstart: TButton
    Left = 240
    Top = 360
    Width = 72
    Height = 24
    Caption = #1057#1090#1072#1088#1090
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = SERVstartClick
  end
  object SERVstop: TButton
    Left = 320
    Top = 360
    Width = 72
    Height = 24
    Caption = #1057#1090#1086#1087
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = SERVstopClick
  end
  object btnCLR: TButton
    Left = 400
    Top = 360
    Width = 112
    Height = 24
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1079#1072#1087#1080#1089#1080
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btnCLRClick
  end
  object ServerSocket: TServerSocket
    Active = False
    Port = 0
    ServerType = stNonBlocking
    OnClientConnect = ServerSocketClientConnect
    OnClientDisconnect = ServerSocketClientDisconnect
    OnClientRead = ServerSocketClientRead
    Left = 240
    Top = 400
  end
  object DataSource: TDataSource
    DataSet = DataSet
    Left = 280
    Top = 400
  end
  object DataSet: TClientDataSet
    Aggregates = <>
    FileName = 'C:\Users\tima03\Desktop\PR2\server\db.xml'
    Params = <>
    Left = 320
    Top = 400
  end
end
