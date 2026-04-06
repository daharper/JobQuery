unit Presentation.Host.Composition;

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

  TUseCaseModule = class(TInterfacedObject, IContainerModule)
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
  Domain.Job,
  Domain.Search,
  App.Common.Settings,
  App.Common.Contracts,
  App.UseCases.FetchNewJobsUseCase,
  Infrastructure.Data.Repositories,
  Infrastructure.Data.Migrations,
  Infrastructure.Http.Adzuna,
  Presentation.Host.Application;

{ TApplicationModule }

{----------------------------------------------------------------------------------------------------------------------}
procedure TApplicationModule.RegisterServices(const c: TContainer);
begin
  c.AddModule<TServiceModule>;
  c.AddModule<TDataServiceModule>;
  c.AddModule<TUseCaseModule>;
end;

{ TServiceModule }

{----------------------------------------------------------------------------------------------------------------------}
procedure TServiceModule.RegisterServices(const c: TContainer);
begin
  c.Add<IApplication, TVclApplication>;
  c.Add<IMigrationRegistry, TMigrationRegistry>;
  c.Add<IFileService, TStandardFileService>;
  c.Add<IJobFeedClient, TAdzunaJobFeedClient>;
  c.Add<IAppSettings, TAppSettings>;

  c.AddAlias<ISettings, IAppSettings>;
end;

{ TDataServicesModule }

{----------------------------------------------------------------------------------------------------------------------}
procedure TDataServiceModule.RegisterServices(const c: TContainer);
begin
  c.Add<IJobRepository, TJobRepository>;
  c.Add<ISearchRepository, TSearchRepository>;
end;

{ TUseCaseModule }

{----------------------------------------------------------------------------------------------------------------------}
procedure TUseCaseModule.RegisterServices(const c: TContainer);
begin
  c.Add<IFetchNewJobsUseCase, TFetchNewJobsUseCase>;
end;

end.

