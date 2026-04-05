inherited JobsView: TJobsView
  object JobsGrid: TcxGrid
    Left = 0
    Top = 0
    Width = 958
    Height = 775
    Align = alClient
    TabOrder = 0
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Office2019Black'
    object Jobs: TcxGridDBTableView
      FindPanel.DisplayMode = fpdmAlways
      FindPanel.FocusViewOnApplyFilter = True
      DataController.DataModeController.GridMode = True
      DataController.DataSource = JobsDataModule.JobsDataSource
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      Styles.UseOddEvenStyles = bFalse
      object JobsId: TcxGridDBColumn
        DataBinding.FieldName = 'Id'
        Visible = False
      end
      object JobsSource: TcxGridDBColumn
        DataBinding.FieldName = 'Source'
        Visible = False
      end
      object JobsApplied: TcxGridDBColumn
        DataBinding.FieldName = 'Applied'
        Visible = False
        GroupIndex = 0
        Width = 55
      end
      object JobsCreatedAt: TcxGridDBColumn
        Caption = 'Date'
        DataBinding.FieldName = 'CreatedAt'
      end
      object JobsTitle: TcxGridDBColumn
        DataBinding.FieldName = 'Title'
        Width = 250
      end
      object JobsSourceRef: TcxGridDBColumn
        DataBinding.FieldName = 'SourceRef'
        Visible = False
      end
      object JobsCategory: TcxGridDBColumn
        DataBinding.FieldName = 'Category'
        Visible = False
      end
      object JobsMinSalary: TcxGridDBColumn
        Caption = 'Minimum'
        DataBinding.FieldName = 'MinSalary'
        Width = 70
      end
      object JobsMaxSalary: TcxGridDBColumn
        Caption = 'Maximum'
        DataBinding.FieldName = 'MaxSalary'
        Width = 70
      end
      object JobsSalaryPredicted: TcxGridDBColumn
        DataBinding.FieldName = 'SalaryPredicted'
        Visible = False
      end
      object JobsCompany: TcxGridDBColumn
        DataBinding.FieldName = 'Company'
        Width = 200
      end
      object JobsContractType: TcxGridDBColumn
        DataBinding.FieldName = 'ContractType'
        Visible = False
      end
      object JobsContractTime: TcxGridDBColumn
        DataBinding.FieldName = 'ContractTime'
        Visible = False
      end
      object JobsArea: TcxGridDBColumn
        DataBinding.FieldName = 'Area'
        Visible = False
      end
      object JobsLocation: TcxGridDBColumn
        DataBinding.FieldName = 'Location'
        Width = 200
      end
      object JobsLongitude: TcxGridDBColumn
        DataBinding.FieldName = 'Longitude'
        Visible = False
      end
      object JobsLatitude: TcxGridDBColumn
        DataBinding.FieldName = 'Latitude'
        Visible = False
      end
      object JobsUrl: TcxGridDBColumn
        DataBinding.FieldName = 'Url'
        Visible = False
      end
      object JobsDescription: TcxGridDBColumn
        DataBinding.FieldName = 'Description'
        Visible = False
      end
    end
    object Level: TcxGridLevel
      GridView = Jobs
    end
  end
end
