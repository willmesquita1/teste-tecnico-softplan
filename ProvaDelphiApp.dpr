program ProvaDelphiApp;

uses
  Vcl.Forms,
  ufPrincipal in 'ufPrincipal.pas' {fPrincipal},
  ufTarefa1 in 'ufTarefa1.pas' {fTarefa1},
  ufTarefa2 in 'ufTarefa2.pas' {fTarefa2},
  observer in 'interfaces\observer.pas',
  subject in 'interfaces\subject.pas',
  ThreadProgresso in 'classes\ThreadProgresso.pas',
  ufTarefa3 in 'ufTarefa3.pas' {fTarefa3},
  query in 'interfaces\query.pas',
  QueryClass in 'classes\QueryClass.pas' {$R *.res},
  dataset in 'interfaces\dataset.pas',
  DatasetClass in 'classes\DatasetClass.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfPrincipal, fPrincipal);
  Application.Run;
end.
