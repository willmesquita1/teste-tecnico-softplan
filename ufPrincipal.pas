unit ufPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus;
type
  TfPrincipal = class(TForm)
    MainMenu: TMainMenu;
    miTarefa1: TMenuItem;
    miTarefa2: TMenuItem;
    miTarefa3: TMenuItem;
    procedure miTarefa1Click(Sender: TObject);
    procedure miTarefa2Click(Sender: TObject);
    procedure miTarefa3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrincipal: TfPrincipal;

implementation

uses ufTarefa1, ufTarefa2, ufTarefa3;

{$R *.dfm}

procedure TfPrincipal.miTarefa1Click(Sender: TObject);
begin
  fTarefa1 := TfTarefa1.Create(Self);
  fTarefa1.Show;
end;

procedure TfPrincipal.miTarefa2Click(Sender: TObject);
begin
  fTarefa2 := TfTarefa2.Create(Self);
  fTarefa2.Show;
end;

procedure TfPrincipal.miTarefa3Click(Sender: TObject);
begin
  fTarefa3 := TfTarefa3.Create(Self);
  fTarefa3.Show;
end;

end.
