unit App.Common.Messaging;

interface

uses
  Base.Messaging;

type
  TJobEvent = class(TBaseEvent);

  /// <summary>notification of new jobs received.</summary>
  TJobsRetrievedEvent = class(TJobEvent)
  private
    fCount: integer;
  public
    property Count: integer read fCount;

    constructor Create(const aCount: integer);
  end;

  /// <summary>notification of an updated job.</summary>
  TJobUpdatedEvent = class(TJobEvent)
  private
    fId: integer;
  public
    property Id: integer read fId;

    constructor Create(const aId: integer);
  end;

  /// <summary>gateway to the job event bus</summary>
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

{ TJobUpdatedEvent }

{----------------------------------------------------------------------------------------------------------------------}
constructor TJobUpdatedEvent.Create(const aId: integer);
begin
  inherited Create;

  fId := aId;
end;

{----------------------------------------------------------------------------------------------------------------------}
initialization
  _JobsEventBus := TEventBus<TJobEvent>.Create;

{----------------------------------------------------------------------------------------------------------------------}
finalization
  FreeAndNil(_JobsEventBus);
end.
