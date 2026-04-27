unit Presentation.Modules.Main;

interface

uses
  System.SysUtils, System.Classes, System.ImageList, Vcl.ImgList, Vcl.Controls;

type
  TMainDataModule = class(TDataModule)
    MainImageList: TImageList;
  private
    { Private declarations }
  public
  end;

var
  MainDataModule: TMainDataModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TMainDataModule }

end.
