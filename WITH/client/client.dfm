object Form1: TForm1
  Left = 994
  Top = 324
  Width = 354
  Height = 233
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object registr: TLabel
    Left = 128
    Top = 160
    Width = 55
    Height = 13
    Caption = 'registration'
    OnClick = registrClick
  end
  object btnLOG: TButton
    Left = 112
    Top = 128
    Width = 75
    Height = 25
    Caption = 'LOGIN'
    TabOrder = 0
    OnClick = btnLOGClick
  end
  object edtNAMELOG: TEdit
    Left = 112
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 1
    Text = #1048#1084#1103
  end
  object edtPASLOG: TEdit
    Left = 112
    Top = 88
    Width = 121
    Height = 21
    TabOrder = 2
    Text = #1055#1072#1088#1086#1083#1100
  end
  object ClientSocket: TClientSocket
    Active = False
    Address = '94.45.180.87'
    ClientType = ctNonBlocking
    Port = 6000
    OnRead = ClientSocketRead
    Left = 24
    Top = 16
  end
  object SENDTMR: TTimer
    OnTimer = SENDTMRTimer
    Left = 24
    Top = 64
  end
end
