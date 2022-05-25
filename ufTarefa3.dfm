object fTarefa3: TfTarefa3
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Tarefa 3'
  ClientHeight = 315
  ClientWidth = 509
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 96
    Height = 13
    Caption = 'Valores por projeto:'
  end
  object Label2: TLabel
    Left = 400
    Top = 237
    Width = 44
    Height = 13
    Caption = 'Total R$:'
  end
  object Label3: TLabel
    Left = 400
    Top = 276
    Width = 85
    Height = 13
    Caption = 'Total divis'#245'es R$:'
  end
  object DBGrid: TDBGrid
    Left = 8
    Top = 23
    Width = 489
    Height = 207
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawDataCell = DBGridDrawDataCell
  end
  object buttonObterTotal: TButton
    Left = 279
    Top = 248
    Width = 115
    Height = 25
    Caption = '&Obter total'
    TabOrder = 1
    OnClick = buttonObterTotalClick
  end
  object editTotal: TEdit
    Left = 400
    Top = 250
    Width = 97
    Height = 21
    TabOrder = 2
  end
  object editTotalDivisoes: TEdit
    Left = 400
    Top = 289
    Width = 97
    Height = 21
    TabOrder = 3
  end
  object buttonObterTotalDivisoes: TButton
    Left = 279
    Top = 287
    Width = 115
    Height = 25
    Caption = 'Obter &total divis'#245'es'
    TabOrder = 4
    OnClick = buttonObterTotalDivisoesClick
  end
end
