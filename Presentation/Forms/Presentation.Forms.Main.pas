unit Presentation.Forms.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXCtrls, Vcl.ToolWin, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.CategoryButtons, Presentation.Modules.Main, Presentation.Core.ViewController;

type
  TMainForm = class(TForm)
    MainPanel: TPanel;
    ToolBar1: TToolBar;
    MainSplitView: TSplitView;
    tbrToggleMenu: TToolButton;
    ViewButtons: TCategoryButtons;
    ToolbarPanel: TPanel;
    procedure FormShow(Sender: TObject);
    procedure tbrToggleMenuClick(Sender: TObject);
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
procedure TMainForm.tbrToggleMenuClick(Sender: TObject);
begin
  MainSplitView.Opened := not MainSplitView.Opened;
end;

end.
