inherited JobsView: TJobsView
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 958
    Height = 775
    Align = alClient
    TabOrder = 0
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Office2019Black'
    ExplicitLeft = 216
    ExplicitTop = 296
    ExplicitWidth = 250
    ExplicitHeight = 200
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = DataDataModule.JobsDataSource
      DataController.KeyFieldNames = 'Id'
      object cxGrid1DBTableView1Id: TcxGridDBColumn
        DataBinding.FieldName = 'Id'
      end
      object cxGrid1DBTableView1Source: TcxGridDBColumn
        DataBinding.FieldName = 'Source'
      end
      object cxGrid1DBTableView1CreatedAt: TcxGridDBColumn
        DataBinding.FieldName = 'CreatedAt'
      end
      object cxGrid1DBTableView1SourceRef: TcxGridDBColumn
        DataBinding.FieldName = 'SourceRef'
      end
      object cxGrid1DBTableView1Category: TcxGridDBColumn
        DataBinding.FieldName = 'Category'
      end
      object cxGrid1DBTableView1MinSalary: TcxGridDBColumn
        DataBinding.FieldName = 'MinSalary'
      end
      object cxGrid1DBTableView1MaxSalary: TcxGridDBColumn
        DataBinding.FieldName = 'MaxSalary'
      end
      object cxGrid1DBTableView1SalaryPredicted: TcxGridDBColumn
        DataBinding.FieldName = 'SalaryPredicted'
      end
      object cxGrid1DBTableView1Company: TcxGridDBColumn
        DataBinding.FieldName = 'Company'
      end
      object cxGrid1DBTableView1ContractType: TcxGridDBColumn
        DataBinding.FieldName = 'ContractType'
      end
      object cxGrid1DBTableView1ContractTime: TcxGridDBColumn
        DataBinding.FieldName = 'ContractTime'
      end
      object cxGrid1DBTableView1Area: TcxGridDBColumn
        DataBinding.FieldName = 'Area'
      end
      object cxGrid1DBTableView1Location: TcxGridDBColumn
        DataBinding.FieldName = 'Location'
      end
      object cxGrid1DBTableView1Longitude: TcxGridDBColumn
        DataBinding.FieldName = 'Longitude'
      end
      object cxGrid1DBTableView1Latitude: TcxGridDBColumn
        DataBinding.FieldName = 'Latitude'
      end
      object cxGrid1DBTableView1Title: TcxGridDBColumn
        DataBinding.FieldName = 'Title'
      end
      object cxGrid1DBTableView1Url: TcxGridDBColumn
        DataBinding.FieldName = 'Url'
      end
      object cxGrid1DBTableView1Description: TcxGridDBColumn
        DataBinding.FieldName = 'Description'
      end
      object cxGrid1DBTableView1Applied: TcxGridDBColumn
        DataBinding.FieldName = 'Applied'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
end
