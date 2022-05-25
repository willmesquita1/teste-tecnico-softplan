object fPrincipal: TfPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Prova Delphi APP'
  ClientHeight = 420
  ClientWidth = 810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu
  OldCreateOrder = False
  Position = poDesktopCenter
  PrintScale = poPrintToFit
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu: TMainMenu
    Left = 344
    Top = 200
    object miTarefa1: TMenuItem
      Caption = 'Tarefa 1'
      OnClick = miTarefa1Click
    end
    object miTarefa2: TMenuItem
      Caption = 'Tarefa 2'
      OnClick = miTarefa2Click
    end
    object miTarefa3: TMenuItem
      Caption = 'Tarefa 3'
      OnClick = miTarefa3Click
    end
  end
end
