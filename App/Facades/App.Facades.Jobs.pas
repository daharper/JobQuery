unit App.Facades.Jobs;

interface

uses
  Base.Core,
  App.UseCases.FetchNewJobsUseCase;

type
  TJobsFacade = class
  private
  public
    /// <summary>
    ///  Attempts to fetch the latests jobs, returns the count of new jobs.
    /// </summary>
    class function FetchLatestJobs: integer;
  end;

implementation

uses
  Base.Container;

{ TJobsFascade }

{----------------------------------------------------------------------------------------------------------------------}
class function TJobsFacade.FetchLatestJobs: integer;
begin
  var uc := Container.Resolve<IFetchNewJobsUseCase>;

  uc.Execute;

  Result := uc.UpdatedCount;
end;

end.
