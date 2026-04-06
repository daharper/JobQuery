unit Infrastructure.Http.Adzuna;

interface

uses
  System.Generics.Collections,
  Base.Core,
  Domain.Job,
  Domain.Search,
  App.Common.Settings,
  App.Common.Contracts;

type
  TAdzunaJobFeedClient = class(TTransient, IJobFeedClient)
  private
    fSettings: IAdzunaSettings;
    fSearches: ISearchRepository;
  public
    constructor Create(const appSettings: IAppSettings; const aSearchRepository: ISearchRepository);

    function FetchLatestJobs: TArray<IJob>;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  System.Net.HttpClient,
  System.NetEncoding,
  System.JSON,
  Base.Integrity,
  Base.Json,
  Base.Conversions;

{ TAdzunaJobFeedClient }

{----------------------------------------------------------------------------------------------------------------------}
constructor TAdzunaJobFeedClient.Create(const appSettings: IAppSettings; const aSearchRepository: ISearchRepository);
begin
  fSettings := appSettings.Adzuna;
  fSearches := aSearchRepository
end;

{----------------------------------------------------------------------------------------------------------------------}
function TAdzunaJobFeedClient.FetchLatestJobs: TArray<IJob>;
const
  BASE_URL = '%s?app_id=%s&app_key=%s&what=%s&where=%s&results_per_page=%d';
  REQ_ERR  = 'Error fetching results for %s:%s%s';
var
  scope: TScope;
begin
  var jobs   := scope.Owns(TList<IJob>.Create);
  var client := scope.Owns(THTTPClient.Create);

  for var search in fSearches.GetAll do
  begin
    var url := Format(BASE_URL,
      [
        fSettings.Url,
        TNetEncoding.URL.Encode(fSettings.Id),
        TNetEncoding.URL.Encode(fSettings.Key),
        TNetEncoding.URL.Encode(search.Title),
        TNetEncoding.URL.Encode(search.Location),
        search.MaxResults
      ]);

    var response := client.Get(url);
    var content  := response.ContentAsString(TEncoding.UTF8);

    Ensure.IsEqual(200, response.StatusCode, Format(REQ_ERR, [url, sLineBreak, content]));

    var jsonObject := TJSONObject.ParseJSONValue(content);

    Ensure.IsTrue(jsonObject is TJSONObject, 'Unexpected JSON root.');

    var root    := TJSONObject(jsonObject);
    var results := Root.Values['results'] as TJSONArray;

    Ensure.IsTrue(results <> nil, 'Unexpected JSON root.');

    for var i := 0 to Pred(results.Count) do
    begin
      var obj := Results.Items[i] as TJSONObject;
      var job: IJob := TJob.Create;

      job.Source          := 'Adzuna';
      job.SourceRef       := Json.AsStr(obj, 'id');
      job.Title           := Json.AsStr(obj, 'title');
      job.Category        := Json.AsNestedStr(obj, 'category', 'label');
      job.Company         := Json.AsNestedStr(obj, 'company', 'display_name');
//      job.Area            := Json.NestedArrayAsStr(obj, 'location', 'area');
      job.Location        := Json.AsNestedStr(obj, 'location', 'display_name');
      job.CreatedAt       := TConvert.ToDateTimeISO8601UtcOr(Json.AsStr(obj, 'created'), TConvert.UtcNow);
      job.MinSalary       := Trunc(TConvert.ToDoubleOr(Json.AsStr(obj, 'salary_min'), 0));
      job.MaxSalary       := Trunc(TConvert.ToDoubleOr(Json.AsStr(obj, 'salary_max'), 0));
      job.SalaryPredicted := Json.AsStr(obj, 'salary_is_predicted').ToBoolean;
      job.ContractType    := Json.AsStr(obj, 'contract_type');
      job.ContractTime    := Json.AsStr(obj, 'contract_time');
      job.Description     := Json.AsStr(obj, 'description');
      job.Latitude        := Json.AsDoubleOr(obj, 'Latitude');
      job.Longitude       := Json.AsDoubleOr(obj, 'Longitude');
      job.Url             := json.AsStr(obj, 'redirect_url');

      jobs.Add(job);
    end;
  end;

  Result := jobs.ToArray;
end;

end.
