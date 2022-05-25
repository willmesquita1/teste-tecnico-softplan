unit uspQuery;

interface

uses
   System.SysUtils, System.Classes, Firedac.Comp.Client, FireDac.Dapt, FireDAC.Phys;

type
    EspQueryException = class (Exception);

    TspQuery = class(TFDQuery)
    private
       FspCondicoes: TStringList;
       FspColunas: TStringList;
       FspTabelas: TStringList;
       procedure ValidarTabelas;
       procedure ValidarColunas;
       function GerarColunas: String;
       function GerarTabelas: String;
       function GerarCondicoes: String;
       procedure SetarDelimitador(const AStringList: TStringList);
    public
       constructor Create(AOwner: TComponent); override;
       destructor Destroy; override;
       procedure GeraSQL;
    published
       property spCondicoes: TStringlist read FspCondicoes write FspCondicoes;
       property spColunas: TStringlist read FspColunas write FspColunas;
       property spTabelas: TStringlist read FspTabelas write FspTabelas;
    end;


implementation

const CSeparador = ', ';

{ TspQuery }

constructor TspQuery.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FspCondicoes := TStringList.Create;
  FspColunas := TStringList.Create;
  FspTabelas := TStringList.Create;
  Self.SetarDelimitador(FspColunas);
  Self.SetarDelimitador(FspTabelas);
end;

destructor TspQuery.Destroy;
begin
  FspCondicoes.Free;
  FspColunas.Free;
  FspTabelas.Free;
  inherited;
end;

function TspQuery.GerarColunas: String;
var
  LColuna: String;
begin
  Result := '';
  for LColuna in Self.FspColunas do
     Result := Result + LColuna + CSeparador;
  Result := Result.Remove(Length(Result)-2);
end;

function TspQuery.GerarCondicoes: String;
var
  LCondicao: String;
begin
  Result := '';
  for LCondicao in Self.FspCondicoes do
     Result := Result + LCondicao;
  Result := Result.Remove(Length(Result));
  if not Result.IsEmpty then
     Result := 'WHERE ' + Result;
end;

procedure TspQuery.GeraSQL;
var
   lsSQL: String;
begin
  Self.ValidarTabelas;
  Self.ValidarColunas;
  lsSQL := Format('SELECT %s FROM %s %s', [Self.GerarColunas, Self.GerarTabelas, Self.GerarCondicoes]).Trim;
  Self.Active := False;
  Self.SQL.Text := lsSQL;
end;

procedure TspQuery.SetarDelimitador(const AStringList: TStringList);
begin
  AStringList.Delimiter := ',';
  AStringList.StrictDelimiter := True;
end;

function TspQuery.GerarTabelas: String;
var
  LTabela: String;
begin
  Result := '';
  for LTabela in Self.FspTabelas do
     Result := Result + LTabela + CSeparador;
  Result := Result.Remove(Length(Result)-2);
end;

procedure TspQuery.ValidarColunas;
begin
  if Self.FspColunas.Count = 0 then
     raise EspQueryException.Create('Nenhuma coluna informada!');
end;

procedure TspQuery.ValidarTabelas;
begin
  if Self.FspTabelas.Count = 0 then
     raise EspQueryException.Create('Nenhuma tabela informada!');
  if Self.FspTabelas.Count > 1 then
     raise EspQueryException.Create('Somente uma tabela deve ser informada!');
end;

end.
