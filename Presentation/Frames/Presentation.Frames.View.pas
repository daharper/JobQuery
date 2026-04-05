unit Presentation.Frames.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TViewState = (vsNone, vsIntialized, vsFinalized);

  TView = class(TFrame)
  private
    fState: TViewState;
  public
    property State: TViewState read fState write fState;

    procedure Initialize; virtual;
    procedure Enter; virtual;
    procedure Exit; virtual;
    procedure Finalize; virtual;
  end;

implementation

{$R *.dfm}

{ TView }

{----------------------------------------------------------------------------------------------------------------------}
procedure TView.Initialize;
begin
  fState := vsIntialized;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TView.Enter;
begin
  // future hook
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TView.Exit;
begin
  // future hook
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TView.Finalize;
begin
  fState := vsFinalized;
end;

end.
