object fTarefa2: TfTarefa2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Tarefa 2'
  ClientHeight = 124
  ClientWidth = 554
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 26
    Width = 43
    Height = 13
    Caption = 'Thread 1'
  end
  object Label2: TLabel
    Left = 288
    Top = 26
    Width = 43
    Height = 13
    Caption = 'Thread 2'
  end
  object Button1: TButton
    Left = 433
    Top = 83
    Width = 113
    Height = 33
    Caption = 'Iniciar'
    TabOrder = 3
    OnClick = Button1Click
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 48
    Width = 257
    Height = 17
    TabOrder = 2
  end
  object ProgressBar2: TProgressBar
    Left = 288
    Top = 48
    Width = 257
    Height = 17
    TabOrder = 4
  end
  object SpinEdit2: TSpinEdit
    Left = 489
    Top = 23
    Width = 57
    Height = 22
    Increment = 100
    MaxValue = 0
    MinValue = 0
    TabOrder = 1
    Value = 0
  end
  object SpinEdit1: TSpinEdit
    Left = 208
    Top = 23
    Width = 57
    Height = 22
    Increment = 100
    MaxValue = 0
    MinValue = 0
    TabOrder = 0
    Value = 0
  end
end
