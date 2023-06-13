object frmCHAT: TfrmCHAT
  Left = 920
  Top = 293
  BorderStyle = bsSingle
  Caption = #1063#1072#1090
  ClientHeight = 355
  ClientWidth = 496
  Color = clYellow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object mainCHAT: TMemo
    Left = 16
    Top = 16
    Width = 257
    Height = 265
    Color = cl3DLight
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object btnSENDMSG: TButton
    Left = 16
    Top = 320
    Width = 257
    Height = 25
    Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnSENDMSGClick
  end
  object cbbFRIENDS: TComboBox
    Left = 288
    Top = 16
    Width = 193
    Height = 23
    Style = csDropDownList
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ItemHeight = 15
    ParentFont = False
    Sorted = True
    TabOrder = 2
  end
  object edtSEARCH: TEdit
    Left = 288
    Top = 48
    Width = 193
    Height = 23
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object btnSEARCH: TButton
    Left = 288
    Top = 80
    Width = 193
    Height = 25
    Caption = #1053#1072#1081#1090#1080' '#1076#1088#1091#1075#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btnSEARCHClick
  end
  object edtENRMSG: TEdit
    Left = 16
    Top = 288
    Width = 257
    Height = 23
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    Text = #1042#1072#1096#1077' '#1089#1086#1086#1073#1097#1077#1085#1080#1077
    OnKeyPress = edtENRMSGKeyPress
  end
end
