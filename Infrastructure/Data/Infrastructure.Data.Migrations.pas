unit Infrastructure.Data.Migrations;

interface

uses
  System.Generics.Collections,
  Base.Core,
  Base.Data,
  Base.Integrity;

type
  TMigrationRegistry = class(TTransient, IMigrationRegistry)
  public
    procedure Configure(const m: IMigrationManager);
  end;

  { version 1 migrations }

  TCreateDatabaseMigration = class(TMigration)
  public
    procedure Execute(const aDb: IDbSessionManager); override;
  end;

  TSeedDatabaseMigration = class(TMigration)
  public
    procedure Execute(const aDb: IDbSessionManager); override;
  end;

implementation

{----------------------------------------------------------------------------------------------------------------------}
procedure TMigrationRegistry.Configure(const m: IMigrationManager);
begin
  m.Add(1, 1, TCreateDatabaseMigration, 'Create the initial schema');
  m.Add(1, 2, TSeedDatabaseMigration, 'Seed the database');
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
            Location          REAL    NOT NULL DEFAULT '',
            Longitude         REAL    NOT NULL DEFAULT '',
            Latitude          TEXT    NOT NULL DEFAULT '',
            Title             TEXT    NOT NULL DEFAULT '',
            Url               TEXT    NOT NULL DEFAULT '',
            Description       TEXT    NOT NULL DEFAULT '',
            Applied           INTEGER NOT NULL DEFAULT 0
        );

        CREATE TABLE Searches (
            Id                INTEGER PRIMARY KEY,
            Title             TEXT    NOT NULL DEFAULT '',
            Location          TEXT    NOT NULL DEFAULT 'UK',
            MaxResults        INTEGER NOT NULL DEFAULT 10
        );
        ''';
begin
  inherited;

  aDb.CurrentSession.Connection.ExecSQL(SQL);
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TSeedDatabaseMigration.Execute(const aDb: IDbSessionManager);
const
  SQL = '''
        INSERT INTO Searches (Id, Title, Location, MaxResults) VALUES
        (1, 'Delphi Developer', 'UK', 25),
        (2, 'C# Developer', 'UK', 50);
        ''';
begin
  inherited;

  aDb.CurrentSession.Connection.ExecSQL(SQL);
end;
end.
