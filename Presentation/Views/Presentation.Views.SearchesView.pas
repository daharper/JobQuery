unit Presentation.Views.SearchesView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Presentation.Views.View, Presentation.Modules.Data, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid;

type
  TSearchesView = class(TView)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1Id: TcxGridDBColumn;
    cxGrid1DBTableView1Title: TcxGridDBColumn;
  private
    { Private declarations }
  public
    procedure Initialize; override;
  end;

var
  SearchesView: TSearchesView;

implementation

{$R *.dfm}

{ TSearchesView }

{----------------------------------------------------------------------------------------------------------------------}
procedure TSearchesView.Initialize;
begin
  inherited;

  cxGrid1DBTableView1Title.Width := Width - 10;
  DataDataModule.SearchDataSource.DataSet.Open;
end;

end.
