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
    fFeedClient: IJobFeedClient;
    fRepository: IJobRepository;
    fUpdatedCount: integer;
  public
    property UpdatedCount: integer read fUpdatedCount;

    procedure Execute;
    constructor Create(const aFeedClient: IJobFeedClient; const aRepository: IJobRepository);
  end;

implementation

{ TFetchNewJobsUseCase }

{----------------------------------------------------------------------------------------------------------------------}
constructor TFetchNewJobsUseCase.Create(const aFeedClient: IJobFeedClient; const aRepository: IJobRepository);
begin
  //
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TFetchNewJobsUseCase.Execute;
begin
  //
end;

end.
