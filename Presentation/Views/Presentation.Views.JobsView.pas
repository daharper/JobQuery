unit Presentation.Views.JobsView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, dxSkinOffice2019Black,
  cxLookAndFeelPainters, cxStyles, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Presentation.Modules.Data, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations, Presentation.Views.View;

type
  TJobsView = class(TView)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1Id: TcxGridDBColumn;
    cxGrid1DBTableView1Source: TcxGridDBColumn;
    cxGrid1DBTableView1CreatedAt: TcxGridDBColumn;
    cxGrid1DBTableView1SourceRef: TcxGridDBColumn;
    cxGrid1DBTableView1Category: TcxGridDBColumn;
    cxGrid1DBTableView1MinSalary: TcxGridDBColumn;
    cxGrid1DBTableView1MaxSalary: TcxGridDBColumn;
    cxGrid1DBTableView1SalaryPredicted: TcxGridDBColumn;
    cxGrid1DBTableView1Company: TcxGridDBColumn;
    cxGrid1DBTableView1ContractType: TcxGridDBColumn;
    cxGrid1DBTableView1ContractTime: TcxGridDBColumn;
    cxGrid1DBTableView1Area: TcxGridDBColumn;
    cxGrid1DBTableView1Location: TcxGridDBColumn;
    cxGrid1DBTableView1Longitude: TcxGridDBColumn;
    cxGrid1DBTableView1Latitude: TcxGridDBColumn;
    cxGrid1DBTableView1Title: TcxGridDBColumn;
    cxGrid1DBTableView1Url: TcxGridDBColumn;
    cxGrid1DBTableView1Description: TcxGridDBColumn;
    cxGrid1DBTableView1Applied: TcxGridDBColumn;
  private
    { Private declarations }
  public
    procedure Initialize; override;
  end;

var
  JobsView: TJobsView;

implementation

{$R *.dfm}

{ TJobsView }

procedure TJobsView.Initialize;
begin
  inherited;

  //cxGrid1DBTableView1Title.Width := Width - 10 - cxGrid1DBTableView1Location.Width - cxGrid1DBTableView1MaxResults.Width;
  DataDataModule.JobsDataSource.DataSet.Open;
end;
end.
