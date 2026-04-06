unit Infrastructure.Data.Repositories;

interface

uses
  System.Generics.Collections,
  Base.Core,
  Base.Integrity,
  Base.Data,
  Base.Sqlite,
  Domain.Job;

type
  TJobRepository = class(TDbSet<IJob, TJob>, IJobRepository)
  public
    constructor Create(const aDb: IDbSessionManager);
  end;

implementation

{ TJobRepository }

{----------------------------------------------------------------------------------------------------------------------}
constructor TJobRepository.Create(const aDb: IDbSessionManager);
begin
  inherited Create(aDb);
end;

end.
