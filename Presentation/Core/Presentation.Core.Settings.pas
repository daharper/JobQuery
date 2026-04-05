unit Presentation.Core.Settings;

interface

uses
  Base.Settings,
  App.Core.Settings;

type
  IApplicationSettings = interface(IAppSettings)
    ['{B8BA5D6D-7E49-4165-B16A-0F93AB1E3B45}']
  end;

  TApplicationSettings = class(TAppSettings, IApplicationSettings)
  public
    //
  end;

implementation

end.
