program JobQuery;

uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  Vcl.Dialogs,
  Presentation.Forms.Main in 'Presentation\Forms\Presentation.Forms.Main.pas' {MainForm},
  Base.Application in 'Base\Base.Application.pas',
  Base.Collect in 'Base\Base.Collect.pas',
  Base.Collections in 'Base\Base.Collections.pas',
  Base.Container in 'Base\Base.Container.pas',
  Base.Conversions in 'Base\Base.Conversions.pas',
  Base.Core in 'Base\Base.Core.pas',
  Base.Data in 'Base\Base.Data.pas',
  Base.Dynamic in 'Base\Base.Dynamic.pas',
  Base.Files in 'Base\Base.Files.pas',
  Base.Formatting in 'Base\Base.Formatting.pas',
  Base.Integrity in 'Base\Base.Integrity.pas',
  Base.Json in 'Base\Base.Json.pas',
  Base.Messaging in 'Base\Base.Messaging.pas',
  Base.Reflection in 'Base\Base.Reflection.pas',
  Base.Settings in 'Base\Base.Settings.pas',
  Base.Sqlite in 'Base\Base.Sqlite.pas',
  Base.Xml in 'Base\Base.Xml.pas',
  Infrastructure.Data.Repositories in 'Infrastructure\Data\Infrastructure.Data.Repositories.pas',
  Domain.Job in 'Domain\Domain.Job.pas',
  Infrastructure.Data.Migrations in 'Infrastructure\Data\Infrastructure.Data.Migrations.pas',
  Presentation.Host.Application in 'Presentation\Host\Presentation.Host.Application.pas',
  Presentation.Host.Composition in 'Presentation\Host\Presentation.Host.Composition.pas',
  App.Common.Settings in 'App\Common\App.Common.Settings.pas',
  Presentation.Modules.Data in 'Presentation\Modules\Presentation.Modules.Data.pas' {DataDataModule: TDataModule},
  Presentation.Modules.Main in 'Presentation\Modules\Presentation.Modules.Main.pas' {MainDataModule: TDataModule},
  Presentation.Views.View in 'Presentation\Views\Presentation.Views.View.pas' {View: TFrame},
  Presentation.Views.JobsView in 'Presentation\Views\Presentation.Views.JobsView.pas' {JobsView: TFrame},
  Presentation.Controllers.Views in 'Presentation\Controllers\Presentation.Controllers.Views.pas',
  Presentation.Views.SearchesView in 'Presentation\Views\Presentation.Views.SearchesView.pas' {SearchesView: TFrame},
  App.Common.Contracts in 'App\Common\App.Common.Contracts.pas',
  App.UseCases.FetchNewJobsUseCase in 'App\UseCases\App.UseCases.FetchNewJobsUseCase.pas',
  Infrastructure.Http.Adzuna in 'Infrastructure\Http\Infrastructure.Http.Adzuna.pas',
  App.Facades.Jobs in 'App\Facades\App.Facades.Jobs.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := true;

  var app := ApplicationBuilder
                  .AddModule<TApplicationModule>
                  .LoadSettings<IAppSettings>
                  .ConfigureDatabase
                  .PerformMigrations
                  .Build;

  app.Execute;

end.
