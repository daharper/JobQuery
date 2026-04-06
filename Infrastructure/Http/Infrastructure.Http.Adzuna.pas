unit Infrastructure.Http.Adzuna;

interface

uses
  Base.Core,
  Domain.Job,
  App.Common.Settings,
  App.Common.Contracts;

type
  TAdzunaJobFeedClient = class(TTransient, IJobFeedClient)
  private
    fSettings: IAdzunaSettings;
  public
    constructor Create(const appSettings: IAppSettings);

    function FetchLatestJobs: TArray<IJob>;
  end;

implementation

{ TAdzunaJobFeedClient }

{----------------------------------------------------------------------------------------------------------------------}
constructor TAdzunaJobFeedClient.Create(const appSettings: IAppSettings);
begin
  fSettings := appSettings.Adzuna;
end;

{----------------------------------------------------------------------------------------------------------------------}
function TAdzunaJobFeedClient.FetchLatestJobs: TArray<IJob>;
begin

end;

end.
