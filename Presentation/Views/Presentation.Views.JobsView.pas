unit Presentation.Views.JobsView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, dxSkinOffice2019Black,
  cxLookAndFeelPainters, cxStyles, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Presentation.Modules.Data, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations, Presentation.Views.View, App.Common.Messaging;

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

    procedure cxGrid1DBTableView1AppliedGetDisplayText(
        Sender:TcxCustomGridTableItem;
        ARecord: TcxCustomGridRecord;
        var AText: string);

    procedure cxGrid1DBTableView1CellClick(
        Sender: TcxCustomGridTableView;
        ACellViewInfo: TcxGridTableDataCellViewInfo;
        AButton: TMouseButton;
        AShift: TShiftState;
        var AHandled: Boolean);

  private
    procedure RefreshView;
    procedure OnJobsRetrieved(const aEvent: TJobsRetrievedEvent);
    procedure OnJobUpdated(const aEvent: TJobUpdatedEvent);
  public
    procedure Initialize; override;
  end;

var
  JobsView: TJobsView;

implementation

{$R *.dfm}

uses
  Presentation.Forms.Job;

{ TJobsView }

{----------------------------------------------------------------------------------------------------------------------}
procedure TJobsView.Initialize;
begin
  inherited;

  DataDataModule.JobsDataSource.DataSet.Open;

  JobsEventBus.Subscribe<TJobsRetrievedEvent>(OnJobsRetrieved);
  JobsEventBus.Subscribe<TJobUpdatedEvent>(OnJobUpdated);
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TJobsView.cxGrid1DBTableView1AppliedGetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
var
  V: Variant;
begin
  inherited;

  V := ARecord.Values[Sender.Index];

  AText := VarToStr(V);

  if AText = '1' then
    AText := 'Applied'
  else if AText = '0' then
    AText := 'None';
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TJobsView.cxGrid1DBTableView1CellClick(
    Sender: TcxCustomGridTableView;
    ACellViewInfo: TcxGridTableDataCellViewInfo;
    AButton: TMouseButton;
    AShift: TShiftState;
    var AHandled: Boolean);
begin
  inherited;

  var value := ACellViewInfo.GridRecord.Values[cxGrid1DBTableView1Id.Index];

  if not VarIsNull(value) then
    TJobForm.Execute(VarAsType(value, varInteger));

  AHandled := true;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TJobsView.OnJobsRetrieved(const aEvent: TJobsRetrievedEvent);
begin
  RefreshView;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TJobsView.OnJobUpdated(const aEvent: TJobUpdatedEvent);
begin
  RefreshView;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TJobsView.RefreshView;
begin
  DataDataModule.JobsDataSource.DataSet.Close;
  DataDataModule.JobsDataSource.DataSet.Open;
end;

end.
