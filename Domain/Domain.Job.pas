unit Domain.Job;

interface

uses
  System.Generics.Collections,
  Base.Core,
  Base.Integrity,
  Base.Data;

type
  IJob = interface(IEntity)
    ['{40F711D9-C6A4-44BE-9430-36D0DBBDB276}']
    function GetArea: string;
    function GetCategory: string;
    function GetCompany: string;
    function GetContractTime: string;
    function GetContractType: string;
    function GetCreatedAt: TDateTime;
    function GetLatitude: double;
    function GetLongitude: double;
    function GetLocation: string;
    function GetMaxSalary: integer;
    function GetMinSalary: integer;
    function GetSourceRef: string;
    function GetSalaryPredicted: boolean;
    function GetSource: string;
    function GetTitle: string;
    function GetUrl: string;
    function GetDescription: string;
    function GetApplied: boolean;

    procedure SetArea(const aValue: string);
    procedure SetCategory(const aValue: string);
    procedure SetCompany(const aValue: string);
    procedure SetContractTime(const aValue: string);
    procedure SetContractType(const aValue: string);
    procedure SetCreatedAt(const aValue: TDateTime);
    procedure SetLatitude(const aValue: double);
    procedure SetLongitude(const aValue: double);
    procedure SetLocation(const aValue: string);
    procedure SetMaxSalary(const aValue: integer);
    procedure SetMinSalary(const aValue: integer);
    procedure SetSourceRef(const aValue: string);
    procedure SetSalaryPredicted(const aValue: boolean);
    procedure SetSource(const aValue: string);
    procedure SetTitle(const aValue: string);
    procedure SetUrl(const aValue: string);
    procedure SetDescription(const aValue: string);
    procedure SetApplied(const aValue: boolean);

    property Source:string read GetSource write SetSource;
    property SourceRef:string read GetSourceRef write SetSourceRef;
    property CreatedAt: TDateTime read GetCreatedAt write SetCreatedAt;
    property Category:string read GetCategory write SetCategory;
    property MinSalary:integer read GetMinSalary write SetMinSalary;
    property MaxSalary:integer read GetMaxSalary write SetMaxSalary;
    property SalaryPredicted:boolean read GetSalaryPredicted write SetSalaryPredicted;
    property Company:string read GetCompany write SetCompany;
    property ContractType:string read GetContractType write SetContractType;
    property ContractTime:string read GetContractTime write SetContractTime;
    property Area:string read GetArea write SetArea;
    property Location:string read GetLocation write SetLocation;
    property Longitude:double read GetLongitude write SetLongitude;
    property Latitude:double read GetLatitude write SetLatitude;
    property Title:string read GetTitle write SetTitle;
    property Url:string read GetUrl write SetUrl;
    property Description:string read GetDescription write SetDescription;
    property Applied: boolean read GetApplied write SetApplied;
  end;

  TJob = class(TEntity, IJob)
  private
    fSource:          string;    // Adzuna
    fCreatedAt:       TDateTime; // created
    fSourceRef:       string;    // id (5673228454)
    fCategory:        string;    // category -> label (IT Jobs)
    fMinSalary:       integer;   // salary_min
    fMaxSalary:       integer;   // salary_max
    fSalaryPredicted: boolean;   // salary_is_predicted (0 or 1)
    fCompany:         string;    // company -> display_name
    fContractType:    string;    // contract_type (permenant)
    fContractTime:    string;    // contract_time (full_time)
    fArea:            string;    // location -> display_name (Wickford, Essex)
    fLocation:        string;    // location -> area         ([UK, Eastern England, Essex, Wickford])
    fLongitude:       double;    // longitude
    fLatitude:        double;    // latitude
    fTitle:           string;    // title
    fUrl:             string;    // redirect_url
    fDescription:     string;
    fApplied:         boolean;

  public
    function GetArea: string;
    function GetCategory: string;
    function GetCompany: string;
    function GetContractTime: string;
    function GetContractType: string;
    function GetCreatedAt: TDateTime;
    function GetLatitude: double;
    function GetLongitude: double;
    function GetLocation: string;
    function GetMaxSalary: integer;
    function GetMinSalary: integer;
    function GetSourceRef: string;
    function GetSalaryPredicted: boolean;
    function GetSource: string;
    function GetTitle: string;
    function GetUrl: string;
    function GetDescription: string;
    function GetApplied: boolean;

    procedure SetArea(const aValue: string);
    procedure SetCategory(const aValue: string);
    procedure SetCompany(const aValue: string);
    procedure SetContractTime(const aValue: string);
    procedure SetContractType(const aValue: string);
    procedure SetCreatedAt(const aValue: TDateTime);
    procedure SetLatitude(const aValue: double);
    procedure SetLongitude(const aValue: double);
    procedure SetLocation(const aValue: string);
    procedure SetMaxSalary(const aValue: integer);
    procedure SetMinSalary(const aValue: integer);
    procedure SetSourceRef(const aValue: string);
    procedure SetSalaryPredicted(const aValue: boolean);
    procedure SetSource(const aValue: string);
    procedure SetTitle(const aValue: string);
    procedure SetUrl(const aValue: string);
    procedure SetDescription(const aValue: string);
    procedure SetApplied(const aValue: boolean);

    property Source:string read GetSource write SetSource;
    property SourceRef:string read GetSourceRef write SetSourceRef;
    property CreatedAt: TDateTime read GetCreatedAt write SetCreatedAt;
    property Category:string read GetCategory write SetCategory;
    property MinSalary:integer read GetMinSalary write SetMinSalary;
    property MaxSalary:integer read GetMaxSalary write SetMaxSalary;
    property SalaryPredicted:boolean read GetSalaryPredicted write SetSalaryPredicted;
    property Company:string read GetCompany write SetCompany;
    property ContractType:string read GetContractType write SetContractType;
    property ContractTime:string read GetContractTime write SetContractTime;
    property Area:string read GetArea write SetArea;
    property Location:string read GetLocation write SetLocation;
    property Longitude:double read GetLongitude write SetLongitude;
    property Latitude:double read GetLatitude write SetLatitude;
    property Title:string read GetTitle write SetTitle;
    property Url:string read GetUrl write SetUrl;
    property Description:string read GetDescription write SetDescription;
    property Applied: boolean read GetApplied write SetApplied;
  end;

  IJobRepository = interface(IDbSet<IJob, TJob>)
    ['{9C132F99-B4FF-4C86-83B8-26268A26490F}']

    function HasJob(const aSource, aSourceRef: string): boolean;
  end;

implementation

{ TJob }

{----------------------------------------------------------------------------------------------------------------------}
function TJob.GetApplied: boolean;
begin
  Result := fApplied;
end;

{----------------------------------------------------------------------------------------------------------------------}
function TJob.GetArea: string;
begin
  Result := fArea;
end;

{----------------------------------------------------------------------------------------------------------------------}
function TJob.GetCategory: string;
begin
  Result := fCategory;
end;

{----------------------------------------------------------------------------------------------------------------------}
function TJob.GetCompany: string;
begin
  Result := fCompany;
end;

{----------------------------------------------------------------------------------------------------------------------}
function TJob.GetContractTime: string;
begin
  Result := fContractTime;
end;

{----------------------------------------------------------------------------------------------------------------------}
function TJob.GetContractType: string;
begin
  Result := fContractType;
end;

{----------------------------------------------------------------------------------------------------------------------}
function TJob.GetCreatedAt: TDateTime;
begin
  Result := fCreatedAt;
end;

{----------------------------------------------------------------------------------------------------------------------}
function TJob.GetDescription: string;
begin
  Result := fDescription;
end;

{----------------------------------------------------------------------------------------------------------------------}
function TJob.GetLatitude: double;
begin
  Result := fLatitude;
end;

{----------------------------------------------------------------------------------------------------------------------}
function TJob.GetLocation: string;
begin
  Result := fLocation;
end;

{----------------------------------------------------------------------------------------------------------------------}
function TJob.GetLongitude: double;
begin
  Result := fLongitude;
end;

{----------------------------------------------------------------------------------------------------------------------}
function TJob.GetMaxSalary: integer;
begin
  Result := fMaxSalary;
end;

{----------------------------------------------------------------------------------------------------------------------}
function TJob.GetMinSalary: integer;
begin
  Result := fMinSalary;
end;

{----------------------------------------------------------------------------------------------------------------------}
function TJob.GetSourceRef: string;
begin
  Result := fSourceRef;
end;

{----------------------------------------------------------------------------------------------------------------------}
function TJob.GetSalaryPredicted: boolean;
begin
  Result := fSalaryPredicted;
end;

{----------------------------------------------------------------------------------------------------------------------}
function TJob.GetSource: string;
begin
  Result := fSource;
end;

{----------------------------------------------------------------------------------------------------------------------}
function TJob.GetTitle: string;
begin
  Result := fTitle;
end;

{----------------------------------------------------------------------------------------------------------------------}
function TJob.GetUrl: string;
begin
  Result := fUrl;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TJob.SetApplied(const aValue: boolean);
begin
  fApplied := aValue;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TJob.SetArea(const aValue: string);
begin
  fArea := aValue;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TJob.SetCategory(const aValue: string);
begin
  fCategory := aValue;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TJob.SetCompany(const aValue: string);
begin
  fCompany := aValue;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TJob.SetContractTime(const aValue: string);
begin
  fContractTime := aValue
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TJob.SetContractType(const aValue: string);
begin
  fContractType := aValue;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TJob.SetCreatedAt(const aValue: TDateTime);
begin
  fCreatedAt := aValue;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TJob.SetDescription(const aValue: string);
begin
  fDescription := aValue;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TJob.SetLatitude(const aValue: double);
begin
  fLatitude := aValue;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TJob.SetLocation(const aValue: string);
begin
  fLocation := aValue;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TJob.SetLongitude(const aValue: double);
begin
  fLongitude := aValue;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TJob.SetMaxSalary(const aValue: integer);
begin
  fMaxSalary := aValue;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TJob.SetMinSalary(const aValue: integer);
begin
  fMinSalary := aValue;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TJob.SetSourceRef(const aValue: string);
begin
  fSourceRef := aValue;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TJob.SetSalaryPredicted(const aValue: boolean);
begin
  fSalaryPredicted := aValue;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TJob.SetSource(const aValue: string);
begin
  fSource := aValue;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TJob.SetTitle(const aValue: string);
begin
  fTitle := aValue;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TJob.SetUrl(const aValue: string);
begin
  fUrl := aValue;
end;

end.
