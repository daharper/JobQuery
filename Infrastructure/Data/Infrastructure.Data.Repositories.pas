unit Infrastructure.Data.Repositories;

interface

uses
  System.Generics.Collections,
  Base.Core,
  Base.Integrity,
  Base.Data,
  Base.Sqlite,
  Domain.Job,
  Domain.Search;

type
  TJobRepository = class(TDbSet<IJob, TJob>, IJobRepository)
  public
    constructor Create(const aDb: IDbSessionManager);
  end;

  TSearchRepository = class(TDbSet<ISearch, TSearch>, ISearchRepository)
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

{ TSearchRepository }

{----------------------------------------------------------------------------------------------------------------------}
constructor TSearchRepository.Create(const aDb: IDbSessionManager);
begin
  inherited Create(aDb);
end;

end.
