unit Presentation.Core.Application;

interface

uses
  System.SysUtils,
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  Base.Application,
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

  TStyleManager.TrySetStyle('Windows Modern Blue');

  Application.CreateForm(TMainForm, MainForm);
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
  //
end;

end.
