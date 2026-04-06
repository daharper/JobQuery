unit Presentation.Forms.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXCtrls, Vcl.ToolWin, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.CategoryButtons, Presentation.Modules.Main, Presentation.Controllers.Views, Vcl.Buttons;

type
  TMainForm = class(TForm)
    MainPanel: TPanel;
    MainSplitView: TSplitView;
    ViewButtons: TCategoryButtons;
    ToolbarPanel: TPanel;
    btnToggle: TSpeedButton;
    btnFetchJobs: TSpeedButton;
    procedure btnFetchJobsClick(Sender: TObject);
    procedure btnToggleClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ShowApplicationsOnClick(Sender: TObject);
    procedure ShowJobsOnClick(Sender: TObject);
    procedure ShowSearchesOnClick(Sender: TObject);
  private
    fController: IViewController;
    fBusy: boolean;
    function GetBusy: boolean;
    procedure SetBusy(const aValue: boolean);


  public
    property Busy: boolean read GetBusy write SetBusy;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  Base.Container,
  App.Facades.Jobs;

{----------------------------------------------------------------------------------------------------------------------}
procedure TMainForm.FormShow(Sender: TObject);
begin
  fController := TViewController.Create(MainPanel);

  fController.Enter(vJobs);
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TMainForm.btnFetchJobsClick(Sender: TObject);
const
  MSG_OK = 'There are %d new jobs.';
  MSG_FAIL = 'There are no new jobs.';
begin
  Busy := true;

  try
    var count := TJobsFacade.FetchLatestJobs;

    if count > 0 then
      ShowMessage(Format(MSG_OK, [count]))
    else
      ShowMessage(MSG_FAIL);
  finally
    Busy := false;
  end;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TMainForm.btnToggleClick(Sender: TObject);
begin
  MainSplitView.Opened := not MainSplitView.Opened;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TMainForm.ShowJobsOnClick(Sender: TObject);
begin
  fController.Enter(vJobs);
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TMainForm.ShowApplicationsOnClick(Sender: TObject);
begin
  fController.Enter(vApplications);
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TMainForm.ShowSearchesOnClick(Sender: TObject);
begin
  fController.Enter(vSearches)
end;

{----------------------------------------------------------------------------------------------------------------------}
function TMainForm.GetBusy: boolean;
begin
  Result := fBusy;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TMainForm.SetBusy(const aValue: boolean);
begin
  if aValue = fBusy then exit;

  fBusy := aValue;

  Screen.Cursor := if fBusy then crHourGlass else crDefault;
end;

end.
