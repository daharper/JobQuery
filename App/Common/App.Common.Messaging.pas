unit App.Common.Messaging;

interface

uses
  Base.Messaging;

type
  TJobEvent = class(TBaseEvent);

  TJobsRetrievedEvent = class(TJobEvent)
  private
    fCount: integer;
  public
    property Count: integer read fCount;

    constructor Create(const aCount: integer);
  end;

  function JobsEventBus: TEventBus<TJobEvent>;

implementation

uses
  System.SysUtils;

var
  _JobsEventBus: TEventBus<TJobEvent>;

{----------------------------------------------------------------------------------------------------------------------}
function JobsEventBus: TEventBus<TJobEvent>;
begin
  Result := _JobsEventBus;
end;

{ TJobEvent }

{----------------------------------------------------------------------------------------------------------------------}
constructor TJobsRetrievedEvent.Create(const aCount: integer);
begin
  inherited Create;

  fCount := aCount;
end;

initialization
  _JobsEventBus := TEventBus<TJobEvent>.Create;

finalization
  FreeAndNil(_JobsEventBus);
end.
