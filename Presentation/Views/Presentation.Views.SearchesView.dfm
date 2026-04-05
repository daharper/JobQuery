inherited SearchesView: TSearchesView
  object JobsGrid: TcxGrid
    Left = 0
    Top = 0
    Width = 958
    Height = 775
    Align = alClient
    TabOrder = 0
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Office2019Black'
    object Searches: TcxGridDBTableView
      FindPanel.DisplayMode = fpdmAlways
      FindPanel.FocusViewOnApplyFilter = True
      DataController.DataModeController.GridMode = True
      DataController.DataSource = SearchesDataModule.SearchesDataSource
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      Styles.UseOddEvenStyles = bFalse
      object SearchesId: TcxGridDBColumn
        DataBinding.FieldName = 'Id'
        Visible = False
      end
      object SearchesTitle: TcxGridDBColumn
        DataBinding.FieldName = 'Title'
        Width = 400
      end
    end
    object Level: TcxGridLevel
      GridView = Searches
    end
  end
end
