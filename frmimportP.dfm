object frimportp: Tfrimportp
  Left = 0
  Top = 0
  Caption = 'IMPORT PANDAAN'
  ClientHeight = 536
  ClientWidth = 1036
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 0
    Width = 1036
    Height = 536
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = cxTabSheet1
    Properties.CustomButtons.Buttons = <>
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'LiquidSky'
    ClientRectBottom = 532
    ClientRectLeft = 4
    ClientRectRight = 1032
    ClientRectTop = 27
    object cxTabSheet1: TcxTabSheet
      Caption = 'PROSES DATA'
      ImageIndex = 0
      object Label1: TLabel
        Left = 30
        Top = 27
        Width = 36
        Height = 13
        Caption = 'No PO  '
        Color = clBtnHighlight
        ParentColor = False
      end
      object Label3: TLabel
        Left = 30
        Top = 54
        Width = 38
        Height = 13
        Caption = 'Supplier'
        Color = clBtnHighlight
        ParentColor = False
      end
      object Label2: TLabel
        Left = 30
        Top = 78
        Width = 28
        Height = 13
        Caption = 'Brand'
        Color = clBtnHighlight
        ParentColor = False
      end
      object RadioButton1: TRadioButton
        Left = 88
        Top = 4
        Width = 57
        Height = 17
        Caption = 'Pandaan'
        Checked = True
        Color = clBtnHighlight
        ParentColor = False
        TabOrder = 0
        TabStop = True
      end
      object RadioButton2: TRadioButton
        Left = 175
        Top = 4
        Width = 58
        Height = 17
        Caption = 'Retail'
        Color = clBtnHighlight
        ParentColor = False
        TabOrder = 1
      end
      object txtpo: TcxTextEdit
        Left = 88
        Top = 24
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = 'LiquidSky'
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = 'LiquidSky'
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = 'LiquidSky'
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = 'LiquidSky'
        TabOrder = 2
        Width = 177
      end
      object txtkode: TcxTextEdit
        Left = 88
        Top = 51
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = 'LiquidSky'
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = 'LiquidSky'
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = 'LiquidSky'
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = 'LiquidSky'
        TabOrder = 3
        OnExit = txtkodeExit
        Width = 121
      end
      object txtnama: TcxTextEdit
        Left = 215
        Top = 51
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = 'LiquidSky'
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = 'LiquidSky'
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = 'LiquidSky'
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = 'LiquidSky'
        TabOrder = 4
        Width = 250
      end
      object cbmerk: TcxLookupComboBox
        Left = 88
        Top = 78
        Properties.DropDownAutoSize = True
        Properties.KeyFieldNames = 'KODE'
        Properties.ListColumns = <
          item
            Caption = 'Kode'
            FieldName = 'KODE'
          end
          item
            FieldName = 'nama'
          end>
        Properties.ListSource = DataSource2
        Properties.MaxLength = 0
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = 'LiquidSky'
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = 'LiquidSky'
        StyleFocused.Color = 16769023
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = 'LiquidSky'
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = 'LiquidSky'
        TabOrder = 5
        Width = 121
      end
      object Button3: TcxButton
        Left = 480
        Top = 67
        Width = 80
        Height = 30
        Caption = 'TAMPIL'
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'iMaginary'
        TabOrder = 6
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = Button3Click
      end
      object Button1: TcxButton
        Left = 566
        Top = 67
        Width = 80
        Height = 30
        Caption = 'PROSES'
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'iMaginary'
        TabOrder = 7
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = Button1Click
      end
      object cxGrid1: TcxGrid
        Left = -8
        Top = 98
        Width = 1036
        Height = 407
        TabOrder = 8
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'LiquidSky'
        object cxGrid1DBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = DataSource1
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          object cxGrid1DBTableView1Column7: TcxGridDBColumn
            Caption = 'Pilih'
            DataBinding.FieldName = 'CEK'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.ValueChecked = 1
            Properties.ValueUnchecked = 0
            Properties.OnEditValueChanged = cxGrid1DBTableView1Column7PropertiesEditValueChanged
          end
          object cxGrid1DBTableView1NO_BUKTI: TcxGridDBColumn
            Caption = 'No Bukti'
            DataBinding.FieldName = 'NO_BUKTI'
            Options.Editing = False
            Width = 126
          end
          object cxGrid1DBTableView1TGL: TcxGridDBColumn
            Caption = 'Tanggal'
            DataBinding.FieldName = 'TGL'
            Options.Editing = False
            Width = 91
          end
          object cxGrid1DBTableView1STATUS: TcxGridDBColumn
            Caption = 'Status'
            DataBinding.FieldName = 'STATUS'
            Options.Editing = False
            Width = 52
          end
          object cxGrid1DBTableView1Column1: TcxGridDBColumn
            Caption = 'Dari'
            DataBinding.FieldName = 'DARI'
            Options.Editing = False
            Width = 142
          end
          object cxGrid1DBTableView1Column2: TcxGridDBColumn
            Caption = 'Brand'
            DataBinding.FieldName = 'KODEM'
            Options.Editing = False
            Width = 45
          end
          object cxGrid1DBTableView1Column3: TcxGridDBColumn
            Caption = 'Kode'
            DataBinding.FieldName = 'KODES'
            Options.Editing = False
            Width = 78
          end
          object cxGrid1DBTableView1Column4: TcxGridDBColumn
            Caption = 'Nama '
            DataBinding.FieldName = 'NAMAS'
            Options.Editing = False
            Width = 210
          end
          object cxGrid1DBTableView1Column5: TcxGridDBColumn
            Caption = 'Kode Asli'
            DataBinding.FieldName = 'KODESR'
            Options.Editing = False
            Width = 73
          end
          object cxGrid1DBTableView1Column6: TcxGridDBColumn
            Caption = 'Nama Asli'
            DataBinding.FieldName = 'NAMASR'
            Options.Editing = False
            Width = 195
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
      object RadioButton3: TRadioButton
        Left = 255
        Top = 3
        Width = 98
        Height = 17
        Caption = 'Pembelian Retail'
        Color = clBtnHighlight
        ParentColor = False
        TabOrder = 9
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'HASIL'
      ImageIndex = 1
      object Label4: TLabel
        Left = 20
        Top = 11
        Width = 31
        Height = 13
        Caption = 'Tgl PO'
        Color = clBtnHighlight
        ParentColor = False
      end
      object cxGrid2: TcxGrid
        Left = 0
        Top = 39
        Width = 1025
        Height = 466
        Align = alCustom
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'LiquidSky'
        object cxGridDBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.Edit.Enabled = False
          Navigator.Buttons.Edit.Visible = False
          FindPanel.DisplayMode = fpdmAlways
          DataController.DataSource = DataSource3
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = '#.###,#'
              Kind = skSum
              Position = spFooter
            end
            item
              Format = '#.###,#'
              Kind = skSum
            end
            item
              Format = '#.###,#'
              Kind = skSum
              Position = spFooter
            end
            item
              Format = '#.###,#'
              Kind = skSum
            end
            item
              Format = '#.###,#'
              Kind = skSum
              Position = spFooter
            end
            item
              Format = '#.###,#'
              Kind = skSum
            end
            item
              Format = '#.###,#'
              Kind = skSum
              Position = spFooter
            end
            item
              Format = '#.###,#'
              Kind = skSum
            end
            item
              Format = '#.###,#'
              Kind = skSum
              Position = spFooter
            end
            item
              Format = '#.###,#'
              Kind = skSum
            end
            item
              Kind = skSum
              Position = spFooter
            end
            item
              Kind = skSum
            end
            item
              Format = '#,##0.00'
              Kind = skSum
              Position = spFooter
            end
            item
              Format = '#,##0.00'
              Kind = skSum
            end
            item
              Format = '#,##0.00'
              Kind = skSum
              Position = spFooter
            end
            item
              Format = '#,##0.00'
              Kind = skSum
            end
            item
              Format = '#,##0.00'
              Kind = skSum
              Position = spFooter
            end
            item
              Format = '#,##0.00'
              Kind = skSum
            end
            item
              Format = '#,##0.00'
              Kind = skSum
              Position = spFooter
            end
            item
              Format = '#,##0.00'
              Kind = skSum
            end
            item
              Format = '#,##0.00'
              Kind = skSum
              Position = spFooter
            end
            item
              Format = '#,##0.00'
              Kind = skSum
            end
            item
              Format = '#,##0.00'
              Kind = skSum
              Position = spFooter
            end
            item
              Format = '#,##0.00'
              Kind = skSum
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = '#.###,#'
              Kind = skSum
            end
            item
              Format = '#.###,#'
              Kind = skSum
            end
            item
              Format = '#.###,#'
              Kind = skSum
            end
            item
              Format = '#.###,#'
              Kind = skSum
            end
            item
              Format = '#.###,#'
              Kind = skSum
            end
            item
              Kind = skSum
            end
            item
              Format = '#,##0.00'
              Kind = skSum
            end
            item
              Format = '#,##0.00'
              Kind = skSum
            end
            item
              Format = '#,##0.00'
              Kind = skSum
            end
            item
              Format = '#,##0.00'
              Kind = skSum
            end
            item
              Format = '#,##0.00'
              Kind = skSum
            end
            item
              Format = '#,##0.00'
              Kind = skSum
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          object cxGridDBTableView1Column1: TcxGridDBColumn
            Caption = 'No Bukti'
            DataBinding.FieldName = 'NO_BUKTI'
          end
          object cxGridDBTableView1Column2: TcxGridDBColumn
            Caption = 'Tanggal'
            DataBinding.FieldName = 'TGL'
          end
          object cxGridDBTableView1Column3: TcxGridDBColumn
            Caption = 'Status'
            DataBinding.FieldName = 'STATUS'
          end
          object cxGridDBTableView1Column10: TcxGridDBColumn
            Caption = 'PO'
            DataBinding.FieldName = 'POZ'
          end
          object cxGridDBTableView1Column11: TcxGridDBColumn
            Caption = 'BTB'
            DataBinding.FieldName = 'BELIZ'
          end
          object cxGridDBTableView1Column4: TcxGridDBColumn
            Caption = 'Dari'
            DataBinding.FieldName = 'DARI'
          end
          object cxGridDBTableView1Column5: TcxGridDBColumn
            Caption = 'Brand'
            DataBinding.FieldName = 'KODEM'
          end
          object cxGridDBTableView1Column6: TcxGridDBColumn
            Caption = 'Kode'
            DataBinding.FieldName = 'KODES'
          end
          object cxGridDBTableView1Column7: TcxGridDBColumn
            Caption = 'Nama'
            DataBinding.FieldName = 'NAMAS'
          end
          object cxGridDBTableView1Column8: TcxGridDBColumn
            Caption = 'Kode Asli'
            DataBinding.FieldName = 'KODESR'
          end
          object cxGridDBTableView1Column9: TcxGridDBColumn
            Caption = 'Nama Asli'
            DataBinding.FieldName = 'NAMASR'
          end
          object cxGridDBTableView1Column12: TcxGridDBColumn
            Caption = 'TYPE'
            DataBinding.FieldName = 'KODEM'
          end
        end
        object cxGrid1DBTableView3: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridDBTableView1
        end
      end
      object TGL1: TcxDateEdit
        Left = 57
        Top = 8
        Properties.DisplayFormat = 'yyyy-mm-dd'
        Properties.EditFormat = 'yyyy-mm-dd'
        Properties.ShowTime = False
        Properties.View = cavModern
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = 'LiquidSky'
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = 'LiquidSky'
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = 'LiquidSky'
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = 'LiquidSky'
        TabOrder = 1
        Width = 198
      end
      object cxButton1: TcxButton
        Left = 272
        Top = 3
        Width = 80
        Height = 30
        Caption = 'TAMPIL'
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'iMaginary'
        TabOrder = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = cxButton1Click
      end
    end
    object cxTabSheet3: TcxTabSheet
      Caption = 'PO - ULANG'
      ImageIndex = 2
      object Label5: TLabel
        Left = 6
        Top = 14
        Width = 38
        Height = 13
        Caption = 'Supplier'
        Color = clBtnHighlight
        ParentColor = False
      end
      object Label6: TLabel
        Left = 446
        Top = 14
        Width = 31
        Height = 13
        Caption = 'Tgl PO'
        Color = clBtnHighlight
        ParentColor = False
      end
      object Label7: TLabel
        Left = 615
        Top = 14
        Width = 4
        Height = 13
        Caption = '-'
        Color = clBtnHighlight
        ParentColor = False
      end
      object cxGrid3: TcxGrid
        Left = 0
        Top = 48
        Width = 1028
        Height = 457
        Align = alCustom
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'LiquidSky'
        object cxGridDBTableView2: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.Edit.Enabled = False
          Navigator.Buttons.Edit.Visible = False
          FindPanel.DisplayMode = fpdmAlways
          OnCellDblClick = cxGridDBTableView2CellDblClick
          DataController.DataSource = DataSource4
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = '#.###,#'
              Kind = skSum
              Position = spFooter
            end
            item
              Format = '#.###,#'
              Kind = skSum
            end
            item
              Format = '#.###,#'
              Kind = skSum
              Position = spFooter
            end
            item
              Format = '#.###,#'
              Kind = skSum
            end
            item
              Format = '#.###,#'
              Kind = skSum
              Position = spFooter
            end
            item
              Format = '#.###,#'
              Kind = skSum
            end
            item
              Format = '#.###,#'
              Kind = skSum
              Position = spFooter
            end
            item
              Format = '#.###,#'
              Kind = skSum
            end
            item
              Format = '#.###,#'
              Kind = skSum
              Position = spFooter
            end
            item
              Format = '#.###,#'
              Kind = skSum
            end
            item
              Kind = skSum
              Position = spFooter
            end
            item
              Kind = skSum
            end
            item
              Format = '#,##0.00'
              Kind = skSum
              Position = spFooter
            end
            item
              Format = '#,##0.00'
              Kind = skSum
            end
            item
              Format = '#,##0.00'
              Kind = skSum
              Position = spFooter
            end
            item
              Format = '#,##0.00'
              Kind = skSum
            end
            item
              Format = '#,##0.00'
              Kind = skSum
              Position = spFooter
            end
            item
              Format = '#,##0.00'
              Kind = skSum
            end
            item
              Format = '#,##0.00'
              Kind = skSum
              Position = spFooter
            end
            item
              Format = '#,##0.00'
              Kind = skSum
            end
            item
              Format = '#,##0.00'
              Kind = skSum
              Position = spFooter
            end
            item
              Format = '#,##0.00'
              Kind = skSum
            end
            item
              Format = '#,##0.00'
              Kind = skSum
              Position = spFooter
            end
            item
              Format = '#,##0.00'
              Kind = skSum
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = '#.###,#'
              Kind = skSum
            end
            item
              Format = '#.###,#'
              Kind = skSum
            end
            item
              Format = '#.###,#'
              Kind = skSum
            end
            item
              Format = '#.###,#'
              Kind = skSum
            end
            item
              Format = '#.###,#'
              Kind = skSum
            end
            item
              Kind = skSum
            end
            item
              Format = '#,##0.00'
              Kind = skSum
            end
            item
              Format = '#,##0.00'
              Kind = skSum
            end
            item
              Format = '#,##0.00'
              Kind = skSum
            end
            item
              Format = '#,##0.00'
              Kind = skSum
            end
            item
              Format = '#,##0.00'
              Kind = skSum
            end
            item
              Format = '#,##0.00'
              Kind = skSum
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          object cxGridDBColumn1: TcxGridDBColumn
            Caption = 'No Bukti'
            DataBinding.FieldName = 'NO_BUKTI'
          end
          object cxGridDBColumn2: TcxGridDBColumn
            Caption = 'Tanggal'
            DataBinding.FieldName = 'TGL'
          end
          object cxGridDBColumn3: TcxGridDBColumn
            Caption = 'Status'
            DataBinding.FieldName = 'STATUS'
          end
          object cxGridDBColumn4: TcxGridDBColumn
            Caption = 'PO'
            DataBinding.FieldName = 'POZ'
          end
          object cxGridDBColumn5: TcxGridDBColumn
            Caption = 'BTB'
            DataBinding.FieldName = 'BELIZ'
          end
          object cxGridDBColumn6: TcxGridDBColumn
            Caption = 'Dari'
            DataBinding.FieldName = 'DARI'
          end
          object cxGridDBColumn7: TcxGridDBColumn
            Caption = 'Brand'
            DataBinding.FieldName = 'KODEM'
          end
          object cxGridDBColumn8: TcxGridDBColumn
            Caption = 'Kode'
            DataBinding.FieldName = 'KODES'
          end
          object cxGridDBColumn9: TcxGridDBColumn
            Caption = 'Nama'
            DataBinding.FieldName = 'NAMAS'
          end
          object cxGridDBColumn10: TcxGridDBColumn
            Caption = 'Kode Asli'
            DataBinding.FieldName = 'KODESR'
          end
          object cxGridDBColumn11: TcxGridDBColumn
            Caption = 'Nama Asli'
            DataBinding.FieldName = 'NAMASR'
          end
        end
        object cxGridDBTableView3: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
        end
        object cxGridLevel2: TcxGridLevel
          GridView = cxGridDBTableView2
        end
      end
      object kode: TcxTextEdit
        Left = 64
        Top = 11
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = 'LiquidSky'
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = 'LiquidSky'
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = 'LiquidSky'
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = 'LiquidSky'
        TabOrder = 1
        OnExit = kodeExit
        Width = 121
      end
      object nama: TcxTextEdit
        Left = 191
        Top = 11
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = 'LiquidSky'
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = 'LiquidSky'
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = 'LiquidSky'
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = 'LiquidSky'
        TabOrder = 2
        Width = 250
      end
      object utgl1: TcxDateEdit
        Left = 483
        Top = 11
        Properties.DisplayFormat = 'yyyy-mm-dd'
        Properties.EditFormat = 'yyyy-mm-dd'
        Properties.ShowTime = False
        Properties.View = cavModern
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = 'LiquidSky'
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = 'LiquidSky'
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = 'LiquidSky'
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = 'LiquidSky'
        TabOrder = 3
        Width = 126
      end
      object utgl2: TcxDateEdit
        Left = 627
        Top = 11
        Properties.DisplayFormat = 'yyyy-mm-dd'
        Properties.EditFormat = 'yyyy-mm-dd'
        Properties.ShowTime = False
        Properties.View = cavModern
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = 'LiquidSky'
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = 'LiquidSky'
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = 'LiquidSky'
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = 'LiquidSky'
        TabOrder = 4
        Width = 126
      end
      object cxButton2: TcxButton
        Left = 768
        Top = 6
        Width = 80
        Height = 30
        Caption = 'TAMPIL'
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'iMaginary'
        TabOrder = 5
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = cxButton2Click
      end
    end
    object cxTabSheet4: TcxTabSheet
      Caption = 'PO - RETUR'
      Color = clRed
      ImageIndex = 3
      ParentColor = False
      object Label8: TLabel
        Left = 9
        Top = 15
        Width = 36
        Height = 13
        Caption = 'No PO  '
        Color = clBtnHighlight
        ParentColor = False
      end
      object Label9: TLabel
        Left = 9
        Top = 42
        Width = 38
        Height = 13
        Caption = 'Supplier'
        Color = clBtnHighlight
        ParentColor = False
      end
      object editpo: TcxTextEdit
        Left = 67
        Top = 12
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = 'LiquidSky'
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = 'LiquidSky'
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = 'LiquidSky'
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = 'LiquidSky'
        TabOrder = 0
        Width = 177
      end
      object editkd: TcxTextEdit
        Left = 67
        Top = 39
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = 'LiquidSky'
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = 'LiquidSky'
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = 'LiquidSky'
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = 'LiquidSky'
        TabOrder = 1
        OnExit = editkdExit
        Width = 121
      end
      object editnm: TcxTextEdit
        Left = 194
        Top = 39
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = 'LiquidSky'
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = 'LiquidSky'
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = 'LiquidSky'
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = 'LiquidSky'
        TabOrder = 2
        Width = 250
      end
      object cxGrid4: TcxGrid
        Left = -4
        Top = 67
        Width = 1036
        Height = 407
        TabOrder = 3
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'McSkin'
        object cxGridDBTableView4: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = DataSource5
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          object cxGridDBColumn12: TcxGridDBColumn
            Caption = 'Pilih'
            DataBinding.FieldName = 'CEK'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.ValueChecked = 1
            Properties.ValueUnchecked = 0
            Properties.OnEditValueChanged = cxGridDBColumn12PropertiesEditValueChanged
          end
          object cxGridDBColumn13: TcxGridDBColumn
            Caption = 'No Bukti'
            DataBinding.FieldName = 'NO_BUKTI'
            Options.Editing = False
            Width = 126
          end
          object cxGridDBColumn14: TcxGridDBColumn
            Caption = 'Tanggal'
            DataBinding.FieldName = 'TGL'
            Options.Editing = False
            Width = 91
          end
          object cxGridDBColumn15: TcxGridDBColumn
            Caption = 'Status'
            DataBinding.FieldName = 'STATUS'
            Options.Editing = False
            Width = 52
          end
          object cxGridDBColumn16: TcxGridDBColumn
            Caption = 'Dari'
            DataBinding.FieldName = 'DARI'
            Options.Editing = False
            Width = 142
          end
          object cxGridDBColumn17: TcxGridDBColumn
            Caption = 'Brand'
            DataBinding.FieldName = 'KODEM'
            Options.Editing = False
            Width = 45
          end
          object cxGridDBColumn18: TcxGridDBColumn
            Caption = 'Kode'
            DataBinding.FieldName = 'KODES'
            Options.Editing = False
            Width = 78
          end
          object cxGridDBColumn19: TcxGridDBColumn
            Caption = 'Nama '
            DataBinding.FieldName = 'NAMAS'
            Options.Editing = False
            Width = 210
          end
          object cxGridDBColumn20: TcxGridDBColumn
            Caption = 'Kode Asli'
            DataBinding.FieldName = 'KODESR'
            Options.Editing = False
            Width = 73
          end
          object cxGridDBColumn21: TcxGridDBColumn
            Caption = 'Nama Asli'
            DataBinding.FieldName = 'NAMASR'
            Options.Editing = False
            Width = 195
          end
        end
        object cxGridLevel3: TcxGridLevel
          GridView = cxGridDBTableView4
          Options.DetailFrameColor = clCream
        end
      end
      object cxButton3: TcxButton
        Left = 459
        Top = 30
        Width = 80
        Height = 30
        Caption = 'TAMPIL'
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'iMaginary'
        TabOrder = 4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = cxButton3Click
      end
      object cxButton4: TcxButton
        Left = 545
        Top = 30
        Width = 80
        Height = 30
        Caption = 'PROSES'
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'iMaginary'
        TabOrder = 5
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = cxButton4Click
      end
    end
  end
  object kmbs: TMyConnection
    Database = 'kmbs20'
    Username = 'root'
    Server = '192.168.0.111'
    Connected = True
    Left = 904
    Top = 8
    EncryptedPassword = '93FFCEFFCDFFC9FFCDFF97FF9BFF'
  end
  object hero: TMyQuery
    Connection = kmbs
    Left = 104
    Top = 368
  end
  object ABC: TMyQuery
    Connection = kmbs
    SQL.Strings = (
      '')
    Left = 40
    Top = 368
  end
  object DataSource1: TDataSource
    DataSet = ABC
    Left = 24
    Top = 416
  end
  object Timer2: TTimer
    Interval = 10000
    OnTimer = Timer2Timer
    Left = 248
    Top = 296
  end
  object cxGridPopupMenu1: TcxGridPopupMenu
    PopupMenus = <>
    AlwaysFireOnPopup = True
    Left = 248
    Top = 224
  end
  object DataSource2: TDataSource
    DataSet = merk
    Left = 88
    Top = 416
  end
  object merk: TMyQuery
    Connection = kmbs
    Left = 8
    Top = 368
  end
  object comd: TMyQuery
    Connection = kmbs
    Left = 72
    Top = 368
  end
  object com: TMyQuery
    Connection = kmbs
    Left = 136
    Top = 368
  end
  object DataSource3: TDataSource
    DataSet = HASIL
    Left = 856
    Top = 56
  end
  object HASIL: TMyQuery
    Connection = kmbs
    SQL.Strings = (
      '')
    Left = 856
    Top = 8
  end
  object PANDAAN: TMyConnection
    Database = 'DBKMBS'
    Options.LocalFailover = True
    Username = 'usropr'
    Server = '203.201.171.6'
    Left = 16
    Top = 152
    EncryptedPassword = 'B4FFCDFFCCFF86FFD2FFC6FFCBFFCAFFBFFF'
  end
  object cek: TMyQuery
    Connection = PANDAAN
    Left = 76
    Top = 155
  end
  object sup: TMyQuery
    Connection = PANDAAN
    Left = 124
    Top = 155
  end
  object RETAIL: TMyConnection
    Database = 'bellagio'
    Username = 'userfin1'
    Server = '192.168.3.2'
    Left = 20
    Top = 219
    EncryptedPassword = '8AFF8CFF9AFF8DFF99FF96FF91FFCEFF'
  end
  object cek1: TMyQuery
    Connection = RETAIL
    Left = 76
    Top = 219
  end
  object sup1: TMyQuery
    Connection = RETAIL
    Left = 132
    Top = 219
  end
  object HASIL2: TMyQuery
    Connection = kmbs
    SQL.Strings = (
      '')
    Left = 952
    Top = 8
  end
  object DataSource4: TDataSource
    DataSet = HASIL2
    Left = 952
    Top = 56
  end
  object ULANG: TMyQuery
    Connection = kmbs
    Left = 1000
    Top = 8
  end
  object rcek: TMyQuery
    Connection = PANDAAN
    Left = 908
    Top = 155
  end
  object rsup: TMyQuery
    Connection = PANDAAN
    Left = 948
    Top = 155
  end
  object rhero: TMyQuery
    Connection = kmbs
    Left = 988
    Top = 155
  end
  object DataSource5: TDataSource
    DataSet = ABCR
    Left = 988
    Top = 211
  end
  object ABCR: TMyQuery
    Connection = kmbs
    Left = 948
    Top = 211
  end
end
