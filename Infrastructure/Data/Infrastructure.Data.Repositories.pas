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

    function HasJob(const aSource: string; const aSourceRef: string): boolean;
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

{----------------------------------------------------------------------------------------------------------------------}
function TJobRepository.HasJob(const aSource, aSourceRef: string): boolean;
const
  SQL = 'SELECT 1 FROM MyTable WHERE Source = :Src AND SourceRef = :Ref LIMIT 1';
var
  scope: TScope;
begin
  var query := scope.Owns(NewQuery);

  query.SQL.Text := SQL;

  query.ParamByName('Src').AsString := aSource;
  query.ParamByName('Ref').AsString := aSourceRef;
  query.Open;

  Result := query.IsEmpty;

  query.Close;
end;

{ TSearchRepository }

{----------------------------------------------------------------------------------------------------------------------}
constructor TSearchRepository.Create(const aDb: IDbSessionManager);
begin
  inherited Create(aDb);
end;

end.
