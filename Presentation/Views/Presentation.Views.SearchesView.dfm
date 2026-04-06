inherited SearchesView: TSearchesView
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 958
    Height = 775
    Align = alClient
    TabOrder = 0
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Office2019Black'
    ExplicitLeft = 416
    ExplicitTop = 232
    ExplicitWidth = 250
    ExplicitHeight = 200
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Visible = True
      DataController.DataSource = DataDataModule.SearchDataSource
      DataController.KeyFieldNames = 'Id'
      NewItemRow.Visible = True
      OptionsData.Appending = True
      OptionsData.CancelOnExit = False
      OptionsData.DeletingConfirmation = False
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1Id: TcxGridDBColumn
        DataBinding.FieldName = 'Id'
        Visible = False
      end
      object cxGrid1DBTableView1Title: TcxGridDBColumn
        DataBinding.FieldName = 'Title'
        MinWidth = 200
        Width = 500
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
end
