inherited JobsView: TJobsView
  Width = 983
  Height = 777
  ExplicitWidth = 983
  ExplicitHeight = 777
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 983
    Height = 777
    Align = alClient
    TabOrder = 0
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Office2019Black'
    ExplicitLeft = 216
    ExplicitTop = 296
    ExplicitWidth = 250
    ExplicitHeight = 200
    object cxGrid1DBTableView1: TcxGridDBTableView
      FindPanel.DisplayMode = fpdmAlways
      OnCellClick = cxGrid1DBTableView1CellClick
      DataController.DataSource = DataDataModule.JobsDataSource
      DataController.KeyFieldNames = 'Id'
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      object cxGrid1DBTableView1Id: TcxGridDBColumn
        DataBinding.FieldName = 'Id'
        Visible = False
      end
      object cxGrid1DBTableView1Source: TcxGridDBColumn
        DataBinding.FieldName = 'Source'
        Visible = False
      end
      object cxGrid1DBTableView1CreatedAt: TcxGridDBColumn
        Caption = 'Created'
        DataBinding.FieldName = 'CreatedAt'
        Width = 64
      end
      object cxGrid1DBTableView1Applied: TcxGridDBColumn
        Caption = 'Action'
        DataBinding.FieldName = 'Applied'
        OnGetDisplayText = cxGrid1DBTableView1AppliedGetDisplayText
        Width = 64
      end
      object cxGrid1DBTableView1SourceRef: TcxGridDBColumn
        DataBinding.FieldName = 'SourceRef'
        Visible = False
      end
      object cxGrid1DBTableView1Category: TcxGridDBColumn
        DataBinding.FieldName = 'Category'
        Visible = False
      end
      object cxGrid1DBTableView1MinSalary: TcxGridDBColumn
        Caption = 'Min $'
        DataBinding.FieldName = 'MinSalary'
        Width = 64
      end
      object cxGrid1DBTableView1MaxSalary: TcxGridDBColumn
        Caption = 'Max $'
        DataBinding.FieldName = 'MaxSalary'
      end
      object cxGrid1DBTableView1SalaryPredicted: TcxGridDBColumn
        DataBinding.FieldName = 'SalaryPredicted'
        Visible = False
      end
      object cxGrid1DBTableView1Company: TcxGridDBColumn
        DataBinding.FieldName = 'Company'
        Width = 204
      end
      object cxGrid1DBTableView1ContractType: TcxGridDBColumn
        DataBinding.FieldName = 'ContractType'
        Visible = False
      end
      object cxGrid1DBTableView1ContractTime: TcxGridDBColumn
        DataBinding.FieldName = 'ContractTime'
        Visible = False
      end
      object cxGrid1DBTableView1Area: TcxGridDBColumn
        DataBinding.FieldName = 'Area'
        Visible = False
      end
      object cxGrid1DBTableView1Location: TcxGridDBColumn
        DataBinding.FieldName = 'Location'
        Width = 250
      end
      object cxGrid1DBTableView1Longitude: TcxGridDBColumn
        DataBinding.FieldName = 'Longitude'
        Visible = False
      end
      object cxGrid1DBTableView1Latitude: TcxGridDBColumn
        DataBinding.FieldName = 'Latitude'
        Visible = False
      end
      object cxGrid1DBTableView1Title: TcxGridDBColumn
        DataBinding.FieldName = 'Title'
        Width = 250
      end
      object cxGrid1DBTableView1Url: TcxGridDBColumn
        DataBinding.FieldName = 'Url'
        Visible = False
      end
      object cxGrid1DBTableView1Description: TcxGridDBColumn
        DataBinding.FieldName = 'Description'
        Visible = False
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
end
