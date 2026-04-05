unit Presentation.Core.Composition;

interface

uses
  Base.Application,
  Base.Integrity,
  Base.Container;

type
  /// <summary>
  ///  Registers modules with the service container.
  /// </summary>
  TApplicationModule = class(TInterfacedObject, IContainerModule)
  public
    procedure RegisterServices(const c: TContainer);
  end;

  /// <summary>
  ///  Registers core services with the application builder.
  /// </summary>
  TServiceModule = class(TInterfacedObject, IContainerModule)
  public
    procedure RegisterServices(const c: TContainer);
  end;

  /// <summary>
  ///  Registers data services with the application builder.
  /// </summary>
  TDataServiceModule = class(TInterfacedObject, IContainerModule)
  public
    procedure RegisterServices(const c: TContainer);
  end;

  /// <summary>
  ///  The purpose of this module is to register aliases to common types.
  /// </summary>
  TAliasModule = class(TInterfacedObject, IContainerModule)
  public
    procedure RegisterServices(const c: TContainer);
  end;

implementation

uses
  System.SysUtils,
  Base.Data,
  Base.Sqlite,
  Base.Files,
  Base.Settings,
  Base.Reflection,
  Domain.Jobs.Job,
  App.Core.Settings,
  Infrastructure.Data.Repositories,
  Infrastructure.Data.Migrations,
  Presentation.Core.Application,
  Presentation.Core.Settings,
  Presentation.Core.Files,
  Presentation.Core.ViewController;

{ TApplicationModule }

{----------------------------------------------------------------------------------------------------------------------}
procedure TApplicationModule.RegisterServices(const c: TContainer);
begin
  c.AddModule<TServiceModule>;
  c.AddModule<TDataServiceModule>;
end;

{ TServiceModule }

{----------------------------------------------------------------------------------------------------------------------}
procedure TServiceModule.RegisterServices(const c: TContainer);
begin
  c.Add<IApplication, TVclApplication>;
  c.Add<IMigrationRegistry, TMigrationRegistry>;

  c.Add<IApplicationFileService, TApplicationFileService>(Singleton);
  c.AddAlias<IFileService, IApplicationFileService>;

  c.Add<IApplicationSettings, TApplicationSettings>(Singleton);
  c.AddAlias<ISettings, IApplicationSettings>;
  c.AddAlias<IAppSettings, IApplicationSettings>;
end;

{ TDataServicesModule }

{----------------------------------------------------------------------------------------------------------------------}
procedure TDataServiceModule.RegisterServices(const c: TContainer);
begin
  c.Add<IJobRepository, TJobRepository>;
end;

{ TAliasModule }

{----------------------------------------------------------------------------------------------------------------------}
procedure TAliasModule.RegisterServices(const c: TContainer);
begin
  // add aliases here
end;

end.

