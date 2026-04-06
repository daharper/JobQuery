unit Domain.Jobs.JobRepository;

interface

uses
  Base.Data,
  Domain.Jobs.Job;

type
  IJobRepository = interface(IDbSet<IJob, TJob>)
    ['{9C132F99-B4FF-4C86-83B8-26268A26490F}']
  end;

implementation

end.
