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
  end;

  TFetchNewJobsUseCase = class(TTransient, IFetchNewJobsUseCase)
  private
    fClient: IJobFeedClient;
    fJobs: IJobRepository;
    fUpdatedCount: integer;
  public
    property UpdatedCount: integer read fUpdatedCount;

    procedure Execute;
    constructor Create(const aFeedClient: IJobFeedClient; const aJobRepository: IJobRepository);
  end;

implementation

{ TFetchNewJobsUseCase }

{----------------------------------------------------------------------------------------------------------------------}
constructor TFetchNewJobsUseCase.Create(const aFeedClient: IJobFeedClient; const aJobRepository: IJobRepository);
begin
  fClient := aFeedClient;
  fJobs   := aJobRepository;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TFetchNewJobsUseCase.Execute;
begin
  //
end;

end.
