unit Presentation.Views.SearchesView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Presentation.Views.View, Presentation.Modules.Searches, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid;

type
  TSearchesView = class(TView)
    JobsGrid: TcxGrid;
    Searches: TcxGridDBTableView;
    Level: TcxGridLevel;
    SearchesId: TcxGridDBColumn;
    SearchesTitle: TcxGridDBColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SearchesView: TSearchesView;

implementation

{$R *.dfm}

end.
