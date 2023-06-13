object frmMAIN: TfrmMAIN
  Left = 970
  Top = 101
  BorderStyle = bsSingle
  Caption = #1042#1086#1081#1090#1080
  ClientHeight = 177
  ClientWidth = 334
  Color = clYellow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblSIGN: TLabel
    Left = 27
    Top = 0
    Width = 277
    Height = 57
    Caption = #169'RUSTMESS'
    Color = clYellow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -48
    Font.Name = 'Stencil'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    OnClick = lblSIGNClick
  end
  object lblREG: TLabel
    Left = 132
    Top = 152
    Width = 70
    Height = 17
    Caption = 'Registration'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = lblREGClick
  end
  object edtPASLOG: TEdit
    Left = 107
    Top = 88
    Width = 120
    Height = 23
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Text = #1055#1072#1088#1086#1083#1100
  end
  object edtNAMELOG: TEdit
    Left = 107
    Top = 56
    Width = 120
    Height = 23
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = #1048#1084#1103
  end
  object btnLOG: TButton
    Left = 127
    Top = 120
    Width = 80
    Height = 24
    BiDiMode = bdLeftToRight
    Caption = 'LOGIN'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 0
    OnClick = btnLOGClick
  end
  object ClientSocket: TClientSocket
    Active = False
    Address = '94.45.180.87'
    ClientType = ctNonBlocking
    Port = 6000
    OnRead = ClientSocketRead
    Left = 16
    Top = 16
  end
  object SENDTMR: TTimer
    OnTimer = SENDTMRTimer
    Left = 48
    Top = 16
  end
end
