unit Presentation.Core.Configuration;

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
  ///  Registers core data services with the application builder.
  /// </summary>
  TCoreDataServicesModule = class(TInterfacedObject, IContainerModule)
  public
    procedure RegisterServices(const c: TContainer);
  end;

  /// <summary>
  ///  Registers data services with the application builder.
  /// </summary>
  TDataServicesModule = class(TInterfacedObject, IContainerModule)
  public
    procedure RegisterServices(const c: TContainer);
  end;

implementation

uses
  System.SysUtils,
  Base.Data,
  Base.Sqlite,
  Base.Files,
  Domain.Jobs.Job,
  Infrastructure.Data.Repositories,
  Infrastructure.Data.Migrations,
  Presentation.Core.Application;

{ TApplicationModule }

{----------------------------------------------------------------------------------------------------------------------}
procedure TApplicationModule.RegisterServices(const c: TContainer);
begin
  c.AddModule<TServiceModule>;
  c.AddModule<TCoreDataServicesModule>;
end;

{ TServiceModule }

{----------------------------------------------------------------------------------------------------------------------}
procedure TServiceModule.RegisterServices(const c: TContainer);
begin
  c.Add<IFileService, TApplicationFileService>;
  c.Add<IApplication, TVclApplication>;
end;

{ TDataServicesModule }

{----------------------------------------------------------------------------------------------------------------------}
procedure TCoreDataServicesModule.RegisterServices(const c: TContainer);
begin
  c.Add<IDbContextProvider, TSqliteContextProvider>('sqlite');
  c.Add<IDbSessionFactory, TSqliteSessionFactory>;
  c.Add<IDbStartupHook, TSqliteStartup>('sqlite');
  c.Add<IMigrationRegistrar, TMigrationRegistrar>;
end;

{ TDataServicesModule }

{----------------------------------------------------------------------------------------------------------------------}
procedure TDataServicesModule.RegisterServices(const c: TContainer);
begin
  c.Add<IJobRepository, TJobRepository>;
end;

end.
