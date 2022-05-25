unit ufTarefa3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Data.DB, Datasnap.DBClient, DatasetClass, dataset;

type
  TfTarefa3 = class(TForm)
    DBGrid: TDBGrid;
    Label1: TLabel;
    buttonObterTotal: TButton;
    editTotal: TEdit;
    editTotalDivisoes: TEdit;
    buttonObterTotalDivisoes: TButton;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure buttonObterTotalClick(Sender: TObject);
    procedure DBGridDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure buttonObterTotalDivisoesClick(Sender: TObject);
  private
    { Private declarations }
    FDataSource: TDataSource;
    FDataSet: ICustomDataset;
    procedure CriarClientDataset;
    procedure CriarDataSource;
    procedure PopularClientDataset;
  public
    { Public declarations }
  end;

var
  fTarefa3: TfTarefa3;

implementation

{$R *.dfm}
const
  CIdProjeto = 'IdProjeto';
  CNomeProjeto = 'NomeProjeto';
  CValor = 'Valor';

{ TfTarefa3 }

procedure TfTarefa3.buttonObterTotalClick(Sender: TObject);
begin
  editTotal.Text := FormatFloat('#,##0.00', Self.FDataSet.ObterTotal(CValor));
end;

procedure TfTarefa3.buttonObterTotalDivisoesClick(Sender: TObject);
begin
 editTotalDivisoes.Text := FormatFloat('#,##0.00', Self.FDataSet.ObterTotalDivisoes(CValor));
end;

procedure TfTarefa3.CriarClientDataset;
begin
 FDataSet.AddDatasetField(CIdProjeto, ftInteger).
          AddDatasetField(CNomeProjeto, ftString, 30).
          AddDatasetField(CValor, ftCurrency).CreateDataSet;
end;

procedure TfTarefa3.CriarDataSource;
begin
 Self.FDataSource := TDataSource.Create(nil);
 Self.FDataSource.DataSet := FDataSet.ClientDataSet;
end;

procedure TfTarefa3.DBGridDrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
begin
  if Field.Name = CValor then
     TFloatField(Field).DisplayFormat := 'R$#,##0.00';
end;

procedure TfTarefa3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfTarefa3.FormCreate(Sender: TObject);
begin
 FDataSet := TDataset.New;
 Self.CriarClientDataset;
 Self.CriarDataSource;
 Self.PopularClientDataset;
 DBGrid.DataSource := Self.FDataSource;
end;

procedure TfTarefa3.FormDestroy(Sender: TObject);
begin
 FreeAndNil(FDataSource);
end;

procedure TfTarefa3.PopularClientDataset;
var
   i: integer;
begin
  for i := 1 to 10 do
    FDataSet.Append.
             SetInteger(CIdProjeto, i).
             SetText(CNomeProjeto, Format('Projeto %d', [i])).
             SetCurrency(CValor, (10*i)).
             Post;
  FDataSet.ClientDataSet.First;
end;

end.
