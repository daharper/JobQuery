unit Domain.Jobs.Job;

interface

uses
  System.Generics.Collections,
  Base.Core,
  Base.Integrity,
  Base.Data;

type
  IJob = interface(IEntity)
    ['{40F711D9-C6A4-44BE-9430-36D0DBBDB276}']

  end;

  TJob = class(TEntity, IJob)
  private
  public
  end;

implementation

end.
