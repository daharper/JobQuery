unit Presentation.Host.Application;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  FireDAC.Comp.Client,
  Base.Application,
  Presentation.Modules.Main,
  Presentation.Modules.Data,
  Presentation.Forms.Main;

type
  TVclApplication = class(TApplicationBase)
  protected
    procedure Run; override;
    procedure HandleException(const E: Exception); override;
  public
    constructor Create;
  end;

implementation

{----------------------------------------------------------------------------------------------------------------------}
procedure TVclApplication.Run;
begin
  inherited;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  Application.Title := 'Job Query';

  TStyleManager.TrySetStyle('Windows Modern Dark');

  Application.CreateForm(TMainDataModule, MainDataModule);
  Application.CreateForm(TDataDataModule, DataDataModule);
  Application.CreateForm(TMainForm, MainForm);

  ConfigureConnectionsFromDbContext(DataDataModule.FDConnection);

  Application.Run;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TVclApplication.HandleException(const E: Exception);
begin
//
end;

{----------------------------------------------------------------------------------------------------------------------}
constructor TVclApplication.Create;
begin
  inherited;
end;

end.

