unit Presentation.Controllers.Views;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  Vcl.Controls,
  Base.Core,
  Presentation.Views.View;

type
  TViewType = (vNone = 0, vJobs, vApplications, vSearches);

  IViewItem = interface
    ['{9CEF6251-1A23-415D-8689-7D7872FD1FA3}']
    procedure Initialize;
    procedure Enter;
    procedure Exit;
    procedure Finalize;
  end;

  TViewItem = class(TTransient, IViewItem)
  private
    fParent: TWinControl;
    fType:   TViewType;
    fClass:  TViewClass;
    fView:   TView;

    function IsCreated: boolean; inline;
  public
    procedure Initialize;
    procedure Enter;
    procedure Exit;
    procedure Finalize;

    constructor Create(const aParent: TWinControl; const aType: TViewType; const aClass: TViewClass);
    destructor Destroy; override;
  end;

  IViewController = interface
    ['{5FBE04F3-DFC4-4ECE-AC48-254190F740CF}']
    function ActiveView: TViewType;
    procedure Enter(const aView: TViewType);
  end;

  TViewController = class(TTransient, IViewController)
  private
    fHost: TWinControl;
    fActiveView: TViewType;
    fViews: TDictionary<TViewType, IViewItem>;

    procedure Add(const aType: TViewType; const aViewClass: TViewClass);
  public
    function ActiveView: TViewType;

    procedure Enter(const aView: TViewType);

    constructor Create(const aHost: TWinControl);
    destructor Destroy; override;
  end;

implementation

uses
  Presentation.Views.JobsView,
  Presentation.Views.SearchesView,
  Base.Integrity;

{ TViewController }

{----------------------------------------------------------------------------------------------------------------------}
procedure TViewController.Enter(const aView: TViewType);
begin
  Ensure.IsTrue(fViews.ContainsKey(aView), 'View has not been registered');

  if fActiveView <> vNone then
    fViews[fActiveView].Exit;

  fViews[aView].Enter;

  fActiveView := aView;
end;

{----------------------------------------------------------------------------------------------------------------------}
function TViewController.ActiveView: TViewType;
begin
  Result := fActiveView;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TViewController.Add(const aType: TViewType; const aViewClass: TViewClass);
begin
  var item : IViewItem := TViewItem.Create(fHost, aType, aViewClass);
  fViews.Add(aType, item);
end;

{----------------------------------------------------------------------------------------------------------------------}
constructor TViewController.Create(const aHost: TWinControl);
begin
  inherited Create;

  fHost  := aHost;
  fViews := TDictionary<TViewType, IViewItem>.Create;

  fActiveView := vNone;

  Add(vJobs, TJobsView);
  Add(vSearches, TSearchesView);
end;

{----------------------------------------------------------------------------------------------------------------------}
destructor TViewController.Destroy;
begin
  if fActiveView <> vNone then
    fViews[fActiveView].Exit;

  fViews.Clear;
  fViews.Free;

  inherited;
end;

{ TViewItem }

{----------------------------------------------------------------------------------------------------------------------}
procedure TViewItem.Initialize;
begin
  if not IsCreated then
  begin
    fView := fClass.Create(nil);
    fView.Parent := fParent;
    fView.Align  := alClient;
  end;

  if fView.State <> vsIntialized then
    fView.Initialize;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TViewItem.Enter;
begin
  Initialize;

  fView.Visible := true;
  fView.Enter;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TViewItem.Exit;
begin
  if (IsCreated) and (fView.State = vsIntialized) then
  begin
    fView.Exit;
    fView.Visible := false;
  end;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TViewItem.Finalize;
begin
  if (IsCreated) and (fView.State = vsIntialized) then
    fView.Finalize;
end;

{----------------------------------------------------------------------------------------------------------------------}
function TViewItem.IsCreated: boolean;
begin
  Result := fView <> nil;
end;

{----------------------------------------------------------------------------------------------------------------------}
constructor TViewItem.Create(const aParent: TWinControl; const aType: TViewType; const aClass: TViewClass);
begin
  inherited Create;

  fParent := aParent;
  fType   := aType;
  fClass  := aClass;
end;

{----------------------------------------------------------------------------------------------------------------------}
destructor TViewItem.Destroy;
begin
  if fView <> nil then
    Finalize;

  inherited;
end;

end.
