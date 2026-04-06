unit App.Common.Contracts;

interface

uses
  Domain.Job;

type
  IJobFeedClient = interface
    ['{E96B87BD-7DDB-432A-9C7A-6CFB95E21D1E}']

    function FetchLatestJobs: TArray<IJob>;
  end;


implementation

end.
