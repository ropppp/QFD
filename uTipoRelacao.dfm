object frmTipoRelacao: TfrmTipoRelacao
  Left = 0
  Top = 0
  Caption = 'Texto'
  ClientHeight = 260
  ClientWidth = 325
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 230
    Height = 23
    Caption = 'Selecione o tipo de Rela'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 8
    Top = 215
    Width = 309
    Height = 41
    Caption = 'Confirmar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 37
    Width = 309
    Height = 172
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'N/A'
      'Positiva Forte'
      'Positiva'
      'Negativa'
      'Negativa Forte')
    TabOrder = 1
  end
end