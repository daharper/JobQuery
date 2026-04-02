unit Presentation.Core.Application;

interface

uses
  System.SysUtils,
  Vcl.Forms,
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
