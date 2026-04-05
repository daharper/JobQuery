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
  Domain.Jobs.Job in 'Domain\Domain.Jobs\Domain.Jobs.Job.pas',
  Infrastructure.Data.Migrations in 'Infrastructure\Data\Infrastructure.Data.Migrations.pas',
  Presentation.Core.Application in 'Presentation\Core\Presentation.Core.Application.pas',
  Presentation.Core.Composition in 'Presentation\Core\Presentation.Core.Composition.pas',
  Presentation.Modules.Main in 'Presentation\Modules\Presentation.Modules.Main.pas' {MainDataModule: TDataModule},
  Presentation.Core.Settings in 'Presentation\Core\Presentation.Core.Settings.pas',
  App.Core.Settings in 'App\Core\App.Core.Settings.pas';

{$R *.res}

begin
{ Delphi looks for the following code to enable the "Appearance" and "Forms" project settings in Options.
  Uncomment when changing appearance, remove when appearance is finalized.}

//  Application.Initialize;
//  Application.MainFormOnTaskbar := True;
//  Application.Title := 'Job Query';
//  TStyleManager.TrySetStyle('Windows Modern Blue');
//  Application.CreateForm(TMainDataModule, MainDataModule);
//  Application.CreateForm(TMainForm, MainForm);
//  Application.Run;


  ReportMemoryLeaksOnShutdown := true;

  var app := ApplicationBuilder
                  .AddModule<TApplicationModule>
                  .LoadSettings<IApplicationSettings>
                  .ConfigureDatabase
                  .PerformMigrations
                  .AddAliases<TAliasModule>
                  .Build;

  app.Execute;

end.
