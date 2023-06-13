object Form3: TForm3
  Left = 772
  Top = 359
  Width = 608
  Height = 423
  Caption = 'Form3'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object mainCHAT: TMemo
    Left = 72
    Top = 16
    Width = 257
    Height = 265
    TabOrder = 0
  end
  object btnSENDMSG: TButton
    Left = 72
    Top = 320
    Width = 257
    Height = 25
    Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
    TabOrder = 1
    OnClick = btnSENDMSGClick
  end
  object cbbFRIENDS: TComboBox
    Left = 344
    Top = 24
    Width = 145
    Height = 21
    ItemHeight = 13
    Sorted = True
    TabOrder = 2
    Text = 'cbbFRIENDS'
  end
  object edtSEARCH: TEdit
    Left = 344
    Top = 88
    Width = 193
    Height = 21
    TabOrder = 3
  end
  object btnSEARCH: TButton
    Left = 344
    Top = 120
    Width = 193
    Height = 25
    Caption = #1053#1072#1081#1090#1080' '#1076#1088#1091#1075#1072
    TabOrder = 4
    OnClick = btnSEARCHClick
  end
  object edtENRMSG: TEdit
    Left = 72
    Top = 288
    Width = 257
    Height = 21
    TabOrder = 5
  end
end
