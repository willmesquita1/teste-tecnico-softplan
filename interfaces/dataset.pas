unit dataset;

interface
 uses Data.DB, Datasnap.DBClient;
type
  ['{DB584AF5-5E57-46CC-A3B4-76624F8A95C4}']
  ICustomDataset = interface
     function AddDatasetField(const AField: String; AFieldType: TFieldType; const ASize: integer = 0): ICustomDataset;
     function CreateDataSet: ICustomDataset;
     function Append: ICustomDataset;
     function SetText(const AField: String; const AValue: String): ICustomDataset;
     function SetInteger(const AField: String; const AValue: Integer): ICustomDataset;
     function SetCurrency(const AField: String; const AValue: Currency): ICustomDataset;
     function Post: ICustomDataset;
     function ObterTotal(const AField: String): Currency;
     function ObterTotalDivisoes(const AField: String): Currency;
     function GetClientDataSet: TClientDataSet;
     property ClientDataSet: TClientDataSet read GetClientDataSet;
  end;

implementation

end.
