unit App.Common.Settings;

interface

uses
  Base.Core,
  Base.Settings,
  Base.Xml;

type
  IAdzunaSettings = interface
    ['{B5FF8999-C4B8-4A3C-A4FB-6E78C39F4727}']
    function Id: string;
    function Key: string;
    function Url: string;
  end;

  IAppSettings = interface(ISettings)
    ['{4CE12183-8BEC-4379-A858-A28679EB5873}']
    function Adzuna: IAdzunaSettings;
  end;

  TAdzunaSettings = class(TTransient, IAdzunaSettings)
  private
    fId: string;
    fKey: string;
    fUrl: string;
  public
    function Id: string;
    function Key: string;
    function Url: string;

    constructor Create(const aAdzuna: IBvElement);
  end;

  TAppSettings = class(TSettings, IAppSettings)
  public
    function Adzuna: IAdzunaSettings;
  end;

implementation

{ TAppSettings }

{----------------------------------------------------------------------------------------------------------------------}
function TAppSettings.Adzuna: IAdzunaSettings;
begin
  var adzuna := Elem('Adzuna');

  Result := TAdzunaSettings.Create(adzuna);
end;

{ TAdzunaSettings }

{----------------------------------------------------------------------------------------------------------------------}
constructor TAdzunaSettings.Create(const aAdzuna: IBvElement);
begin
  var app := aAdzuna.Elem('App');
  var url := aAdzuna.Elem('Url');

  fId  := app['id'];
  fKey := app['key'];

  fUrl := url.Value;
end;

{----------------------------------------------------------------------------------------------------------------------}
function TAdzunaSettings.Id: string;
begin
  Result := fId;
end;

{----------------------------------------------------------------------------------------------------------------------}
function TAdzunaSettings.Key: string;
begin
  Result := fKey;
end;

{----------------------------------------------------------------------------------------------------------------------}
function TAdzunaSettings.Url: string;
begin
  Result := fUrl;
end;

end.
