unit Presentation.Core.Files;

interface

uses
  Base.Files;

type
  IApplicationFileService = interface(IFileService)
    ['{6400F264-3C53-4D2B-BC1A-89058E645070}']
  end;

  TApplicationFileService = class(TStandardFileService, IApplicationFileService)
    //
  end;

implementation

end.
