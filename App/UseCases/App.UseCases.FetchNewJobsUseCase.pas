unit App.UseCases.FetchNewJobsUseCase;

interface

uses
  Base.Core,
  Domain.Job,
  App.Common.Contracts;

type
  IFetchNewJobsUseCase = interface
    ['{0757663B-7DA8-47F7-8E50-C055F61F55D5}']
    procedure Execute;

    function UpdatedCount: integer;
  end;

  TFetchNewJobsUseCase = class(TTransient, IFetchNewJobsUseCase)
  private
    fClient: IJobFeedClient;
    fRepository: IJobRepository;
    fUpdatedCount: integer;
  public
    function UpdatedCount: integer;

    procedure Execute;

    constructor Create(const aFeedClient: IJobFeedClient; const aJobRepository: IJobRepository);
  end;

implementation

uses
  App.Common.Messaging;

{ TFetchNewJobsUseCase }

{----------------------------------------------------------------------------------------------------------------------}
procedure TFetchNewJobsUseCase.Execute;
begin
  fUpdatedCount := 0;

  var jobs := fClient.FetchLatestJobs;

  if jobs = nil then exit;

  for var job in jobs do
    if fRepository.IsUnknownJob(job.Source, job.SourceRef) then
    begin
      fRepository.Save(job);
      Inc(fUpdatedCount);
    end;

  if fUpdatedCount = 0 then exit;

  var e := TJobsRetrievedEvent.Create(fUpdatedCount);
  var group := TJobEvent.Create;

  JobsEventBus.Publish<TJobsRetrievedEvent, TJobEvent>(e, group);
end;

{----------------------------------------------------------------------------------------------------------------------}
function TFetchNewJobsUseCase.UpdatedCount: integer;
begin
  Result := fUpdatedCount;
end;

{----------------------------------------------------------------------------------------------------------------------}
constructor TFetchNewJobsUseCase.Create(const aFeedClient: IJobFeedClient; const aJobRepository: IJobRepository);
begin
  fClient := aFeedClient;
  fRepository := aJobRepository;
end;

end.
