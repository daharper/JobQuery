unit Presentation.Core.Settings;

interface

uses
  Base.Files,
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

  IApplicationFileService = interface(IFileService)
    ['{6400F264-3C53-4D2B-BC1A-89058E645070}']
  end;

  TApplicationFileService = class(TStandardFileService, IApplicationFileService)
    //
  end;

implementation

end.
