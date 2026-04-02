program JobQuery;

uses
  Vcl.Forms,
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
  Domain.Jobs.Job in 'Domain\Domain.Jobs\Domain.Jobs.Job.pas',
  Infrastructure.Data.Migrations in 'Infrastructure\Data\Infrastructure.Data.Migrations.pas',
  Presentation.Core.Application in 'Presentation\Core\Presentation.Core.Application.pas',
  Presentation.Core.Configuration in 'Presentation\Core\Presentation.Core.Configuration.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := true;

  ApplicationBuilder.Services.AddModule<TApplicationModule>;
  ApplicationBuilder.LoadSettings;

  ApplicationBuilder.ConfigureDatabase;
  ApplicationBuilder.PerformMigrations;

  var app := ApplicationBuilder.Build;
  app.Execute;
end.
