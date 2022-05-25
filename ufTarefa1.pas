unit ufTarefa1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uspQuery;

type
  TfTarefa1 = class(TForm)
    memoColunas: TMemo;
    memoTabelas: TMemo;
    memoCondicoes: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    buttonGeraSQL: TButton;
    memoSQLGerado: TMemo;
    Label4: TLabel;
    spQuery: TspQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure buttonGeraSQLClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTarefa1: TfTarefa1;

implementation

uses
   Queryclass;

{$R *.dfm}

procedure TfTarefa1.buttonGeraSQLClick(Sender: TObject);
begin
  memoSQLGerado.Text :=  TQuery.New.
                         SetColunas(memoColunas.Text).
                         SetTabelas(memoTabelas.text).
                         SetCondicoes(memoCondicoes.Text).
                         GeraSQL;
end;

procedure TfTarefa1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
