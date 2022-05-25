unit DatasetClass;

interface

uses
  System.Classes, Data.DB, Datasnap.DBClient, System.SysUtils, Dataset;

type
    EDataSetException = class (Exception);
    TDataset = class (TInterfacedObject, ICustomDataset)
    private
     FClientDataSet: TClientDataSet;
     function GetClientDataSet: TClientDataSet;
    public
     constructor create;
     destructor destroy; override;
     class function New: ICustomDataset;
     function AddDatasetField(const AField: String; AFieldType: TFieldType; const ASize: integer = 0): ICustomDataset;
     function CreateDataSet: ICustomDataset;
     function Append: ICustomDataset;
     function SetText(const AField: String; const AValue: String): ICustomDataset;
     function SetInteger(const AField: String; const AValue: Integer): ICustomDataset;
     function SetCurrency(const AField: String; const AValue: Currency): ICustomDataset;
     function Post: ICustomDataset;
     function ObterTotal(const AField: String): Currency;
     function ObterTotalDivisoes(const AField: String): Currency;
     property ClientDataSet: TClientDataSet read GetClientDataSet;
    end;

implementation

{ TDataset }

function TDataset.AddDatasetField(const AField: String; AFieldType: TFieldType; const ASize: integer): ICustomDataset;
begin
 Self.FClientDataSet.FieldDefs.Add(AField, AFieldType, ASize);
 Result := Self;
end;

function TDataset.Append: ICustomDataset;
begin
  Self.FClientDataSet.Append;
  Result := Self;
end;

constructor TDataset.create;
begin
  FClientDataSet := TClientDataSet.Create(nil);
end;

function TDataset.CreateDataSet: ICustomDataset;
begin
  FClientDataSet.CreateDataSet;
  Result := Self;
end;

destructor TDataset.destroy;
begin
  FClientDataSet.Free;
  inherited;
end;

function TDataset.GetClientDataSet: TClientDataSet;
begin
  Result := Self.FClientDataSet;
end;

class function TDataset.New: ICustomDataset;
begin
  Result := TDataset.create;
end;

function TDataset.ObterTotal(const AField: String): Currency;
var
  LValor: Currency;
begin
  if AField.IsEmpty then
     Raise EDataSetException.Create('Nenhum campo informado');
  LValor := 0;
  Self.FClientDataSet.DisableControls;
  try
    Self.FClientDataSet.First;
    while not Self.FClientDataSet.Eof do
    begin
      LValor := LValor + Self.FClientDataSet.FieldByName(AField).AsCurrency;
      Self.FClientDataSet.Next;
    end;
    Result := LValor;
  finally
    Self.FClientDataSet.First;
    Self.FClientDataSet.EnableControls;
  end;
end;

function TDataset.ObterTotalDivisoes(const AField: String): Currency;
var
  LValorAnterior: Currency;
  LValorTotalDivisoes: Currency;
begin
  if AField.IsEmpty then
     Raise EDataSetException.Create('Nenhum campo informado');
  LValorTotalDivisoes := 0;
  LValorAnterior := 0;
  Self.FClientDataSet.DisableControls;
  try
    Self.FClientDataSet.First;
    LValorAnterior := Self.FClientDataSet.FieldByName(AField).AsCurrency;
    while not Self.FClientDataSet.Eof do
    begin
      if Self.FClientDataSet.RecNo > 1 then
      begin
        LValorTotalDivisoes := LValorTotalDivisoes + (Self.FClientDataSet.FieldByName(AField).AsCurrency / LValorAnterior);
        LValorAnterior := Self.FClientDataSet.FieldByName(AField).AsCurrency;
      end;
      Self.FClientDataSet.Next;
    end;
    Result := LValorTotalDivisoes;
  finally
    Self.FClientDataSet.First;
    Self.FClientDataSet.EnableControls;
  end;
end;

function TDataset.Post: ICustomDataset;
begin
  Self.FClientDataSet.Post;
  Result := Self;
end;

function TDataset.SetCurrency(const AField: String;
  const AValue: Currency): ICustomDataset;
begin
  Result := Self;
  try
    FClientDataSet.FieldByName(AField).AsCurrency := AValue;
  except on E: Exception do
    Raise EDataSetException.Create(Format('Erro ao setar valor %s', [E.Message]));
  end;
end;

function TDataset.SetInteger(const AField: String;
  const AValue: Integer): ICustomDataset;
begin
  Result := Self;
  try
    FClientDataSet.FieldByName(AField).AsInteger := AValue;
  except on E: Exception do
    Raise EDataSetException.Create(Format('Erro ao setar inteiro %s', [E.Message]));
  end;
end;

function TDataset.SetText(const AField, AValue: String): ICustomDataset;
begin
  Result := Self;
  try
    FClientDataSet.FieldByName(AField).AsString := AValue;
  except on E: Exception do
    Raise EDataSetException.Create(Format('Erro ao setar texto %s', [E.Message]));
  end;
end;

end.
