unit QueryClass;

interface

uses System.Classes, query, uspQuery;

type
     TQuery = class(TInterfacedObject, IQuery)
       FspQuery : TspQuery;
     public
       class function New: IQuery;
       constructor create;
       destructor destroy; override;
       function GetColunas: TStringList;
       function GetTabelas: TStringList;
       function GetCondicoes: TStringList;
       function SetColunas(const AColunas: String): IQuery;
       function SetTabelas(const ATabelas: String): IQuery;
       function SetCondicoes(const ACondicoes: String): IQuery;
       function GeraSQL: String;
     end;

implementation

{ TQuery }

constructor TQuery.create;
begin
   Self.FspQuery := TspQuery.Create(nil);
end;

destructor TQuery.destroy;
begin
  Self.FspQuery.Free;;
  inherited;
end;

function TQuery.GeraSQL: String;
begin
  Self.FspQuery.GeraSQL;
  Result := Self.FspQuery.SQL.Text;
end;

function TQuery.GetColunas: TStringList;
begin
  Result := Self.FspQuery.spColunas;
end;

function TQuery.GetCondicoes: TStringList;
begin
  Result := Self.FspQuery.spCondicoes;
end;

function TQuery.GetTabelas: TStringList;
begin
  Result := Self.FspQuery.spTabelas;
end;

class function TQuery.New: IQuery;
begin
  Result := TQuery.Create;
end;

function TQuery.SetColunas(const AColunas: String): IQuery;
begin
  Self.FspQuery.spColunas.DelimitedText := AColunas;
  Result := Self;
end;

function TQuery.SetCondicoes(const ACondicoes: String): IQuery;
begin
  Self.FspQuery.spCondicoes.Text := ACondicoes;
  Result := Self;
end;

function TQuery.SetTabelas(const ATabelas: String): IQuery;
begin
  Self.FspQuery.spTabelas.DelimitedText := ATabelas;
  Result := Self;
end;

end.
