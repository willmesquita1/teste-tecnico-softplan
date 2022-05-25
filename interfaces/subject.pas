unit subject;

interface

uses observer;

type
  ['{F531B339-5F80-4476-A2D2-B49A2625F500}']
  ISubject = interface
     function AddObserver(const AObserver: IObserver): ISubject;
     function RemoveObserver(const AObserver: IObserver): ISubject;
     procedure Notify(const ANotification: TNotification);
  end;

implementation

end.
