unit App.Core.Settings;

interface

uses
  Base.Settings;

type
  IAppSettings = interface(ISettings)
    ['{4CE12183-8BEC-4379-A858-A28679EB5873}']
  end;

  TAppSettings = class(TSettings, IAppSettings, ISettings)
    //
  end;

implementation

end.
