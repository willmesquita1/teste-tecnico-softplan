unit ThreadProgresso;

interface

uses
   System.Classes, observer, subject, System.Generics.Collections, System.SysUtils, System.Threading;

type
   EInvalidInterval = class (Exception);
   TSubject = class (TInterfacedObject, ISubject)
   private
      FThread: TThread;
      FObservers: TList<IObserver>;
      FSleepInterval: Integer;
      FCurrentPosition: Integer;
      FComponentName: String;
      procedure Notify(const ANotification: TNotification);
   public
      class function New: ISubject;
      constructor Create;
      destructor Destroy; override;
      function AddObserver(const AObserver: IObserver): ISubject;
      function RemoveObserver(const AObserver: IObserver): ISubject;
   end;

   TThreadProgresso = class (TThread)
   private
    FSubject: ISubject;
    FNotification: TNotification;
    FSleepInterval: integer;
   public
     constructor Create(const ASleepInterval: Integer; const AComponentName: String; const AObserver: IObserver);
     destructor Destroy; Override;
     procedure Execute;Override;
   end;



implementation

{ TSubject }

function TSubject.AddObserver(const AObserver: IObserver): ISubject;
begin
  Self.FObservers.Add(AObserver);
  Result := Self;
end;

constructor TSubject.Create;
begin
  Self.FObservers := TList<IObserver>.Create;
end;

destructor TSubject.Destroy;
begin
  FreeAndNil(Self.FObservers);
  inherited;
end;

class function TSubject.New: ISubject;
begin
  Result := TSubject.Create;
end;

procedure TSubject.Notify(const ANotification: TNotification);
var
  Observer: IObserver;
begin
  for Observer in FObservers do
      Observer.Refresh(ANotification);
end;

function TSubject.RemoveObserver(const AObserver: IObserver): ISubject;
begin
  Self.FObservers.Delete(FObservers.IndexOf(AObserver));
  Result := Self;
end;

{ TThreadProgresso }

constructor TThreadProgresso.Create(const ASleepInterval: Integer; const AComponentName: String; const AObserver: IObserver);
begin
  if ASleepInterval < 0 then
   Raise EInvalidInterval.Create('Intervalo inválido!');
  inherited Create(False);
  FSubject := TSubject.New.AddObserver(AObserver);
  Self.FNotification.CurrentPosition := 0;
  Self.FNotification.ComponentName := AComponentName;
  Self.FSleepInterval := ASleepInterval;
end;

destructor TThreadProgresso.Destroy;
begin
  inherited;
end;

procedure TThreadProgresso.Execute;
var
 i: Integer;
begin
  inherited;
  for i := 0 to 100 do
  begin
     if Self.Terminated then Break;
     Self.FNotification.CurrentPosition := i;
     Self.FSubject.Notify(Self.FNotification);
     Self.Sleep(Self.FSleepInterval);
  end;
end;

end.
