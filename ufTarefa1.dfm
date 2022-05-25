object fTarefa1: TfTarefa1
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Tarefa 1'
  ClientHeight = 381
  ClientWidth = 690
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 23
    Top = 5
    Width = 38
    Height = 13
    Caption = 'Colunas'
  end
  object Label2: TLabel
    Left = 214
    Top = 5
    Width = 37
    Height = 13
    Caption = 'Tabelas'
  end
  object Label3: TLabel
    Left = 407
    Top = 5
    Width = 49
    Height = 13
    Caption = 'Condi'#231#245'es'
  end
  object Label4: TLabel
    Left = 23
    Top = 175
    Width = 57
    Height = 13
    Caption = 'SQL Gerado'
  end
  object memoColunas: TMemo
    Left = 23
    Top = 24
    Width = 185
    Height = 113
    TabOrder = 0
  end
  object memoTabelas: TMemo
    Left = 214
    Top = 24
    Width = 185
    Height = 113
    TabOrder = 1
  end
  object memoCondicoes: TMemo
    Left = 407
    Top = 24
    Width = 185
    Height = 113
    TabOrder = 2
  end
  object buttonGeraSQL: TButton
    Left = 608
    Top = 64
    Width = 75
    Height = 25
    Caption = 'GeraSQL'
    TabOrder = 3
    OnClick = buttonGeraSQLClick
  end
  object memoSQLGerado: TMemo
    Left = 23
    Top = 194
    Width = 569
    Height = 169
    ReadOnly = True
    TabOrder = 4
  end
  object spQuery: TspQuery
    Left = 616
    Top = 144
  end
end
