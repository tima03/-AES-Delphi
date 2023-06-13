object frmREG: TfrmREG
  Left = 639
  Top = 257
  BorderStyle = bsSingle
  Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103
  ClientHeight = 201
  ClientWidth = 252
  Color = clYellow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblLOG: TLabel
    Left = 110
    Top = 176
    Width = 32
    Height = 16
    Caption = 'Login'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = lblLOGClick
  end
  object lblREG: TLabel
    Left = 6
    Top = 0
    Width = 240
    Height = 48
    Caption = 'Registrtion'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Stencil'
    Font.Style = []
    ParentFont = False
  end
  object btnREG: TButton
    Left = 71
    Top = 144
    Width = 110
    Height = 24
    Caption = 'REGISTRATION'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btnREGClick
  end
  object edtNAMEREG: TEdit
    Left = 66
    Top = 48
    Width = 120
    Height = 24
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = #1048#1084#1103
  end
  object edtPASREG: TEdit
    Left = 66
    Top = 80
    Width = 120
    Height = 24
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Text = #1055#1072#1088#1086#1083#1100
  end
  object edtMAILREG: TEdit
    Left = 66
    Top = 112
    Width = 120
    Height = 24
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Text = #1055#1086#1095#1090#1072
  end
end
