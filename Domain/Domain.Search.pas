unit Domain.Search;

interface

uses
  System.Generics.Collections,
  Base.Core,
  Base.Integrity,
  Base.Data;

type
  ISearch = interface(IEntity)
    ['{27B723DB-6D40-40F6-8B7D-95AAB3B0218B}']
    function GetTitle: string;
    function GetLocation: string;
    function GetMaxResults: integer;

    procedure SetTitle(const aTitle: string);
    procedure SetLocation(const aLocation: string);
    procedure SetMaxResults(const aMax: integer);

    property Title: string read GetTitle write SetTitle;
    property Location: string read GetLocation write SetLocation;
    property MaxResults: integer read GetMaxResults write SetMaxResults;
  end;

  [TTable('Searches')]
  TSearch = class(TEntity, ISearch)
  private
    fMax: integer;
    fTitle: string;
    fLocation: string;
  public
    function GetTitle: string;
    function GetLocation: string;
    function GetMaxResults: integer;

    procedure SetTitle(const aTitle: string);
    procedure SetLocation(const aLocation: string);
    procedure SetMaxResults(const aMax: integer);

    property Title: string read GetTitle write SetTitle;
    property Location: string read GetLocation write SetLocation;
    property MaxResults: integer read GetMaxResults write SetMaxResults;
  end;

  ISearchRepository = interface(IDbSet<ISearch, TSearch>)
    ['{9C132F99-B4FF-4C86-83B8-26268A26490F}']
  end;

implementation

{ TSearch }

{----------------------------------------------------------------------------------------------------------------------}
function TSearch.GetTitle: string;
begin
  Result := fTitle;
end;

{----------------------------------------------------------------------------------------------------------------------}
function TSearch.GetLocation: string;
begin
  Result := fLocation
end;

{----------------------------------------------------------------------------------------------------------------------}
function TSearch.GetMaxResults: integer;
begin
  Result := fMax;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TSearch.SetTitle(const aTitle: string);
begin
  fTitle := aTitle;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TSearch.SetLocation(const aLocation: string);
begin
  fLocation := aLocation;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TSearch.SetMaxResults(const aMax: integer);
begin
  fMax := aMax;
end;

end.
