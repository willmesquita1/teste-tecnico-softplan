unit QueryTest;

interface

uses
  DUnitX.TestFramework, QueryClass, Query, uspQuery;

type
  [TestFixture]
  TQueryTest = class
  private
    FQuery: IQuery;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    // Sample Methods
    // Simple single Test
    [Test]
    [TestCase('Coluna vazia', '')]
    procedure TestaColunaVazia(const AColunas: string);
    [Test]
    [TestCase('Quantidade de colunas', 'teste1,teste2,teste3',';')]
    procedure TestaQuantidadeColunas(const AColunas: string);
    [Test]
    [TestCase('Conteudo das colunas', 'teste1,teste2',';')]
    procedure TestaColunaConteudo(const AColunas: string);
    [Test]
    [TestCase('Testa mais de uma tabela', 'teste1,teste2',';')]
    procedure TestaTabela(const ATabelas: string);
    [Test]
    [TestCase('Testa geração do SQL', 'ITEM,VALOR,VALOR > 3')]
    procedure TestaGeracaoSQL(const ATabela, AColuna, ACondicao: string);

  end;

implementation

uses System.SysUtils;

procedure TQueryTest.Setup;
begin
   FQuery := TQuery.New;
end;

procedure TQueryTest.TearDown;
begin
//
end;

procedure TQueryTest.TestaColunaVazia(const AColunas: string);
begin
 Assert.WillRaise(procedure
                  begin
                  FQuery.SetColunas(AColunas).SetTabelas('teste').GeraSQL
                  end, EspQueryException, '');
end;

procedure TQueryTest.TestaQuantidadeColunas(const AColunas: string);
begin
 Assert.IsTrue(FQuery.SetColunas(AColunas).GetColunas.Count = 3);
end;

procedure TQueryTest.TestaGeracaoSQL(const ATabela, AColuna,
  ACondicao: string);
const
  lineBreak = #13#10;
var
  LExpected: String;
begin
  LExpected := Format('SELECT %s FROM %s WHERE %s%s', [AColuna, ATabela, ACondicao,lineBreak]);
  Assert.AreEqual(LExpected, FQuery.SetColunas(AColuna).SetTabelas(ATabela).SetCondicoes(ACondicao).GeraSQL);
end;

procedure TQueryTest.TestaTabela(const ATabelas: string);
begin
 Assert.WillRaise(procedure
                  begin
                    FQuery.SetColunas('teste').SetTabelas(ATabelas).GeraSQL
                  end, EspQueryException, '');
end;

procedure TQueryTest.TestaColunaConteudo(const AColunas: string);
begin
 Assert.IsTrue(FQuery.SetColunas(AColunas).GetColunas.DelimitedText = 'teste1,teste2');
end;

initialization
  TDUnitX.RegisterTestFixture(TQueryTest);

end.
