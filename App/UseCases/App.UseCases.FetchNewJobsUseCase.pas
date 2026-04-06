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

{ TFetchNewJobsUseCase }

{----------------------------------------------------------------------------------------------------------------------}
procedure TFetchNewJobsUseCase.Execute;
begin
  fUpdatedCount := 0;

  var jobs := fClient.FetchLatestJobs;

  if jobs = nil then exit;

  for var job in jobs do
  begin
    if fRepository.HasJob(job.Source, job.SourceRef) then continue;

    fRepository.Save(job);

    Inc(fUpdatedCount);
  end;
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
