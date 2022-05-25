unit observer;

interface

type
  TNotification = record
    CurrentPosition: Integer;
    ComponentName: String;
  end;

  ['{33E4825F-010D-43BB-90EF-238D7274189E}']
  IObserver = interface
     procedure Refresh(const ANotification: TNotification);
  end;

implementation

end.
