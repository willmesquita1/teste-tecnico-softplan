unit DatasetTest;

interface

uses
  DUnitX.TestFramework, Data.DB, DatasetClass, Dataset, System.Generics.Collections;

type
  [TestFixture]
  TDatasetTest = class
  public
    // Test with TestCase Attribute to supply parameters.
    [Test]
    [TestCase('Testa totais do clientdataset', '10,50,80')]
    [TestCase('Testa totais do clientdataset', '500,40,20')]
    [TestCase('Testa totais do clientdataset', '-10,20,30')]
    procedure TestaObterTotal(const AValor1, AValor2, AValor3: integer);
    [TestCase('Testa totais de divisoes do clientdataset', '10,50,80')]
    [TestCase('Testa totais do divisoes do clientdataset', '500,40,20')]
    [TestCase('Testa totais do divisoes do clientdataset', '-10,20,30')]
    procedure TestaObterTotalDivisoes(const AValor1, AValor2, AValor3: integer);
  end;

implementation

{ TDatasetTest }

procedure TDatasetTest.TestaObterTotal(const AValor1, AValor2, AValor3: integer);
const
  FIELD = 'VALOR';
var
  LDataset: ICustomDataset;
begin
  LDataset := TDataset.New.AddDatasetField(FIELD, ftCurrency).CreateDataSet;
  LDataset.Append.SetCurrency(FIELD, AValor1).Post.
           Append.SetCurrency(FIELD, AValor2).Post.
           Append.SetCurrency(FIELD, AValor3).Post;
  Assert.IsTrue(LDataset.ObterTotal(FIELD) = (AValor1+AValor2+AValor3));
end;

procedure TDatasetTest.TestaObterTotalDivisoes(const AValor1, AValor2,
  AValor3: integer);
const
  FIELD = 'VALOR';
var
  LDataset: ICustomDataset;
  LValorDivisoes: Currency;
begin
  LDataset := TDataset.New.AddDatasetField(FIELD, ftCurrency).CreateDataSet;
  LDataset.Append.SetCurrency(FIELD, AValor1).Post.
           Append.SetCurrency(FIELD, AValor2).Post.
           Append.SetCurrency(FIELD, AValor3).Post;
  LValorDivisoes := (AValor2/AValor1) + (AValor3/AValor2);
  Assert.IsTrue(LDataset.ObterTotalDivisoes(FIELD) = LValorDivisoes);
end;

initialization
  TDUnitX.RegisterTestFixture(TDatasetTest);

end.
