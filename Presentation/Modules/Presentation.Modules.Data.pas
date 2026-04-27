unit Presentation.Modules.Data;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, Presentation.Forms.Main, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.DApt, Presentation.Modules.Main, Domain.Job, Domain.Search;

type
  TDataDataModule = class(TDataModule)
    JobsDataSource: TDataSource;
    JobsFDTable: TFDTable;
    SearchTable: TFDTable;
    SearchDataSource: TDataSource;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDConnection: TFDConnection;
    SearchTableId: TIntegerField;
    SearchTableTitle: TWideMemoField;
    SearchTableLocation: TWideMemoField;
    SearchTableMaxResults: TIntegerField;
    JobsFDTableId: TIntegerField;
    JobsFDTableSource: TWideMemoField;
    JobsFDTableCreatedAt: TWideMemoField;
    JobsFDTableSourceRef: TWideMemoField;
    JobsFDTableCategory: TWideMemoField;
    JobsFDTableMinSalary: TIntegerField;
    JobsFDTableMaxSalary: TIntegerField;
    JobsFDTableSalaryPredicted: TIntegerField;
    JobsFDTableCompany: TWideMemoField;
    JobsFDTableContractType: TWideMemoField;
    JobsFDTableContractTime: TWideMemoField;
    JobsFDTableArea: TWideMemoField;
    JobsFDTableLongitude: TFloatField;
    JobsFDTableTitle: TWideMemoField;
    JobsFDTableUrl: TWideMemoField;
    JobsFDTableDescription: TWideMemoField;
    JobsFDTableApplied: TIntegerField;
    JobsFDTableLocation: TWideMemoField;
    JobsFDTableLatitude: TFloatField;
  private
    { Private declarations }
  public
    function JobRepository: IJobRepository;
    function SearchRepository: ISearchRepository;
  end;

var
  DataDataModule: TDataDataModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  Base.Container;

{ TDataDataModule }

{----------------------------------------------------------------------------------------------------------------------}
function TDataDataModule.JobRepository: IJobRepository;
begin
  Result := Container.Resolve<IJobRepository>;
end;

{----------------------------------------------------------------------------------------------------------------------}
function TDataDataModule.SearchRepository: ISearchRepository;
begin
  Result := Container.Resolve<ISearchRepository>;
end;

end.
