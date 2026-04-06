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
    procedure btnToggleClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ShowApplicationsOnClick(Sender: TObject);
    procedure ShowJobsOnClick(Sender: TObject);
    procedure ShowSearchesOnClick(Sender: TObject);
  private
    fController: IViewController;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  Base.Container;

{----------------------------------------------------------------------------------------------------------------------}
procedure TMainForm.FormShow(Sender: TObject);
begin
  fController := TViewController.Create(MainPanel);

  fController.Enter(vJobs);
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

end.
