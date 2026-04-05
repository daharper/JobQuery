unit Presentation.Views.JobsView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Presentation.Modules.Jobs, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations, Presentation.Views.View;

type
  TJobsView = class(TView)
    JobsGrid: TcxGrid;
    Jobs: TcxGridDBTableView;
    Level: TcxGridLevel;
    JobsId: TcxGridDBColumn;
    JobsSource: TcxGridDBColumn;
    JobsCreatedAt: TcxGridDBColumn;
    JobsSourceRef: TcxGridDBColumn;
    JobsCategory: TcxGridDBColumn;
    JobsMinSalary: TcxGridDBColumn;
    JobsMaxSalary: TcxGridDBColumn;
    JobsSalaryPredicted: TcxGridDBColumn;
    JobsCompany: TcxGridDBColumn;
    JobsContractType: TcxGridDBColumn;
    JobsContractTime: TcxGridDBColumn;
    JobsArea: TcxGridDBColumn;
    JobsLocation: TcxGridDBColumn;
    JobsLongitude: TcxGridDBColumn;
    JobsLatitude: TcxGridDBColumn;
    JobsTitle: TcxGridDBColumn;
    JobsUrl: TcxGridDBColumn;
    JobsDescription: TcxGridDBColumn;
    JobsApplied: TcxGridDBColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  JobsView: TJobsView;

implementation

{$R *.dfm}

end.
