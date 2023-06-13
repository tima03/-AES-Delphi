object Form1: TForm1
  Left = 276
  Top = 161
  Width = 283
  Height = 201
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
  object btn1: TButton
    Left = 8
    Top = 32
    Width = 75
    Height = 25
    Caption = 'btn1'
    TabOrder = 0
    OnClick = btn1Click
  end
  object edt1: TEdit
    Left = 8
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'edt1'
  end
  object edt2: TEdit
    Left = 136
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'edt2'
  end
  object mmo1: TMemo
    Left = 88
    Top = 32
    Width = 169
    Height = 121
    Lines.Strings = (
      'mmo1')
    TabOrder = 3
  end
end
