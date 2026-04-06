unit App.Facades.Jobs;

interface

uses
  Base.Core,
  App.UseCases.FetchNewJobsUseCase;

type
  TJobsFascade = class
  private
  public
    /// <summary>
    ///  Attempts to fetch the latests jobs, returns true if there are new jobs.
    /// </summary>
    class function FetchLatestJobs: boolean;
  end;

implementation

{ TJobsFascade }

{----------------------------------------------------------------------------------------------------------------------}
class function TJobsFascade.FetchLatestJobs: boolean;
begin
  // var uc := Container.Resolve<Ifce>;
  // us.Execute;
  // Result := uc.UpdatedCount > 0;
end;

end.
