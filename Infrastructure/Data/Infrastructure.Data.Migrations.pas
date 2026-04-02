unit Infrastructure.Data.Migrations;

interface

uses
  System.Generics.Collections,
  Base.Core,
  Base.Data,
  Base.Integrity;

type
  TMigrationRegistrar = class(TTransient, IMigrationRegistrar)
  public
    procedure Configure(const m: IMigrationManager);
  end;

  { version 1 migrations }

  TCreateDatabaseMigration = class(TMigration)
  public
    procedure Execute(const aDb: IDbSessionManager); override;
  end;

implementation

{----------------------------------------------------------------------------------------------------------------------}
procedure TMigrationRegistrar.Configure(const m: IMigrationManager);
begin
  m.Add(1, 1, TCreateDatabaseMigration, 'Create the initial schema');
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TCreateDatabaseMigration.Execute(const aDb: IDbSessionManager);
const
  SQL = '''
        CREATE TABLE Jobs (
            Id                INTEGER PRIMARY KEY,
            Source            TEXT    NOT NULL DEFAULT '',
            CreatedAt         TEXT    NOT NULL DEFAULT '',    -- ISO 8601 UTC, e.g. 2026-03-14T09:10:00Z
            SourceRef         TEXT    NOT NULL DEFAULT '',
            Category          TEXT    NOT NULL DEFAULT '',
            MinSalary         INTEGER NOT NULL DEFAULT 0,
            MaxSalary         INTEGER NOT NULL DEFAULT 0,
            SalaryPredicted   INTEGER NOT NULL DEFAULT 0,
            Company           TEXT    NOT NULL DEFAULT '',
            ContractType      TEXT    NOT NULL DEFAULT '',
            ContractTime      TEXT    NOT NULL DEFAULT '',
            Area              TEXT    NOT NULL DEFAULT '',
            Location          TEXT    NOT NULL DEFAULT '',
            Longitude         TEXT    NOT NULL DEFAULT '',
            Latitude          TEXT    NOT NULL DEFAULT '',
            Title             TEXT    NOT NULL DEFAULT '',
            Url               TEXT    NOT NULL DEFAULT '',
            Description       TEXT    NOT NULL DEFAULT ''
        );
        ''';
begin
  inherited;

  aDb.CurrentSession.Connection.ExecSQL(SQL);
end;

end.
