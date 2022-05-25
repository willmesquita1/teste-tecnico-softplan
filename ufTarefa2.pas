unit ufTarefa2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Samples.Spin, observer, subject, ThreadProgresso;

type
  TfTarefa2 = class(TForm, IObserver)
    Button1: TButton;
    ProgressBar1: TProgressBar;
    ProgressBar2: TProgressBar;
    SpinEdit2: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    SpinEdit1: TSpinEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FThreadProgresso1: TThreadProgresso;
    FThreadProgresso2: TThreadProgresso;
    procedure Refresh(const ANotification: TNotification);
  public
    { Public declarations }
  end;

var
  fTarefa2: TfTarefa2;

implementation

{$R *.dfm}

{ TfTarefa2 }

procedure TfTarefa2.Button1Click(Sender: TObject);
begin
  if not Assigned(FThreadProgresso1) then
     FThreadProgresso1 := TThreadProgresso.Create(SpinEdit1.Value, ProgressBar1.Name, Self);
  if not Assigned(FThreadProgresso2) then
     FThreadProgresso2 := TThreadProgresso.Create(SpinEdit2.Value, ProgressBar2.Name, Self);
end;

procedure TfTarefa2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (Assigned(FThreadProgresso1)) then
  begin
    FThreadProgresso1.Terminate;
    FThreadProgresso1.WaitFor;
  end;
  if (Assigned(FThreadProgresso2)) then
  begin
    FThreadProgresso2.Terminate;
    FThreadProgresso2.WaitFor;
  end;
  Action := caFree;
end;

procedure TfTarefa2.FormCreate(Sender: TObject);
begin
  FThreadProgresso1 := nil;
  FThreadProgresso2 := nil;
end;

procedure TfTarefa2.Refresh(const ANotification: TNotification);
begin
  if ANotification.ComponentName = ProgressBar1.Name then
  begin
    ProgressBar1.Position := ANotification.CurrentPosition;
    if Assigned(FThreadProgresso1) and (ProgressBar1.Position = ProgressBar1.Max) then
       FreeAndNil(FThreadProgresso1);
  end;
  if ANotification.ComponentName = ProgressBar2.Name then
  begin
    ProgressBar2.Position := ANotification.CurrentPosition;
    if Assigned(FThreadProgresso2) and (ProgressBar2.Position = ProgressBar2.Max) then
       FreeAndNil(FThreadProgresso2);
  end;
end;

end.
