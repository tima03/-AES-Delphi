object Form2: TForm2
  Left = 400
  Top = 379
  Width = 327
  Height = 289
  Caption = 'Form2'
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
  object log: TLabel
    Left = 136
    Top = 176
    Width = 22
    Height = 13
    Caption = 'login'
    OnClick = logClick
  end
  object btnREG: TButton
    Left = 104
    Top = 136
    Width = 91
    Height = 25
    Caption = 'REGESTRATION'
    TabOrder = 0
    OnClick = btnREGClick
  end
  object edtNAMEREG: TEdit
    Left = 96
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 1
    Text = #1048#1084#1103
  end
  object edtPASREG: TEdit
    Left = 96
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 2
    Text = #1055#1072#1088#1086#1083#1100
  end
  object edtMAILREG: TEdit
    Left = 96
    Top = 104
    Width = 121
    Height = 21
    TabOrder = 3
    Text = #1055#1086#1095#1090#1072
  end
end
