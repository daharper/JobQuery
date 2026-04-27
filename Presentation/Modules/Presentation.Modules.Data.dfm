object DataDataModule: TDataDataModule
  Height = 480
  Width = 640
  object JobsDataSource: TDataSource
    DataSet = JobsFDTable
    Left = 448
    Top = 72
  end
  object JobsFDTable: TFDTable
    IndexFieldNames = 'Id'
    Connection = FDConnection
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'Jobs'
    Left = 312
    Top = 72
    object JobsFDTableId: TIntegerField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object JobsFDTableSource: TWideMemoField
      FieldName = 'Source'
      Origin = 'Source'
      Required = True
      BlobType = ftWideMemo
    end
    object JobsFDTableCreatedAt: TWideMemoField
      FieldName = 'CreatedAt'
      Origin = 'CreatedAt'
      Required = True
      BlobType = ftWideMemo
    end
    object JobsFDTableSourceRef: TWideMemoField
      FieldName = 'SourceRef'
      Origin = 'SourceRef'
      Required = True
      BlobType = ftWideMemo
    end
    object JobsFDTableCategory: TWideMemoField
      FieldName = 'Category'
      Origin = 'Category'
      Required = True
      BlobType = ftWideMemo
    end
    object JobsFDTableMinSalary: TIntegerField
      FieldName = 'MinSalary'
      Origin = 'MinSalary'
      Required = True
    end
    object JobsFDTableMaxSalary: TIntegerField
      FieldName = 'MaxSalary'
      Origin = 'MaxSalary'
      Required = True
    end
    object JobsFDTableSalaryPredicted: TIntegerField
      FieldName = 'SalaryPredicted'
      Origin = 'SalaryPredicted'
      Required = True
    end
    object JobsFDTableCompany: TWideMemoField
      FieldName = 'Company'
      Origin = 'Company'
      Required = True
      BlobType = ftWideMemo
    end
    object JobsFDTableContractType: TWideMemoField
      FieldName = 'ContractType'
      Origin = 'ContractType'
      Required = True
      BlobType = ftWideMemo
    end
    object JobsFDTableContractTime: TWideMemoField
      FieldName = 'ContractTime'
      Origin = 'ContractTime'
      Required = True
      BlobType = ftWideMemo
    end
    object JobsFDTableArea: TWideMemoField
      FieldName = 'Area'
      Origin = 'Area'
      Required = True
      BlobType = ftWideMemo
    end
    object JobsFDTableLongitude: TFloatField
      FieldName = 'Longitude'
      Origin = 'Longitude'
      Required = True
    end
    object JobsFDTableTitle: TWideMemoField
      FieldName = 'Title'
      Origin = 'Title'
      Required = True
      BlobType = ftWideMemo
    end
    object JobsFDTableUrl: TWideMemoField
      FieldName = 'Url'
      Origin = 'Url'
      Required = True
      BlobType = ftWideMemo
    end
    object JobsFDTableDescription: TWideMemoField
      FieldName = 'Description'
      Origin = 'Description'
      Required = True
      BlobType = ftWideMemo
    end
    object JobsFDTableApplied: TIntegerField
      FieldName = 'Applied'
      Origin = 'Applied'
      Required = True
    end
    object JobsFDTableLocation: TWideMemoField
      FieldName = 'Location'
      Origin = 'Location'
      Required = True
      BlobType = ftWideMemo
    end
    object JobsFDTableLatitude: TFloatField
      FieldName = 'Latitude'
      Origin = 'Latitude'
      Required = True
    end
  end
  object SearchTable: TFDTable
    IndexFieldNames = 'Id'
    Connection = FDConnection
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    UpdateOptions.KeyFields = 'Id'
    TableName = 'Searches'
    Left = 312
    Top = 184
    object SearchTableId: TIntegerField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object SearchTableTitle: TWideMemoField
      FieldName = 'Title'
      Origin = 'Title'
      Required = True
      BlobType = ftWideMemo
    end
    object SearchTableLocation: TWideMemoField
      FieldName = 'Location'
      Origin = 'Location'
      Required = True
      BlobType = ftWideMemo
    end
    object SearchTableMaxResults: TIntegerField
      FieldName = 'MaxResults'
      Origin = 'MaxResults'
      Required = True
    end
  end
  object SearchDataSource: TDataSource
    DataSet = SearchTable
    Left = 448
    Top = 176
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    DriverID = 'SQLite'
    VendorLib = 'sqlite3.dll'
    Left = 256
    Top = 296
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=D:\Source\JobQuery\Resources\jobs.db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 216
    Top = 160
  end
end
