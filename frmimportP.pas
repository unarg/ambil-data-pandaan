unit frmimportP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, MemDS, DBAccess, MyAccess,
  Vcl.StdCtrls, Vcl.ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, cxContainer, cxTextEdit, dxBarBuiltInMenu, cxPC,
  cxGridCustomPopupMenu, cxGridPopupMenu, Vcl.Menus, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxCheckBox, cxButtons,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar, MemData;

type
  Tfrimportp = class(TForm)
    kmbs: TMyConnection;
    hero: TMyQuery;
    ABC: TMyQuery;
    DataSource1: TDataSource;
    Timer2: TTimer;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxGridPopupMenu1: TcxGridPopupMenu;
    DataSource2: TDataSource;
    merk: TMyQuery;
    comd: TMyQuery;
    com: TMyQuery;
    cxTabSheet2: TcxTabSheet;
    DataSource3: TDataSource;
    HASIL: TMyQuery;
    Label1: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    txtpo: TcxTextEdit;
    Label3: TLabel;
    txtkode: TcxTextEdit;
    txtnama: TcxTextEdit;
    Label2: TLabel;
    cbmerk: TcxLookupComboBox;
    Button3: TcxButton;
    Button1: TcxButton;
    PANDAAN: TMyConnection;
    cek: TMyQuery;
    sup: TMyQuery;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1Column7: TcxGridDBColumn;
    cxGrid1DBTableView1NO_BUKTI: TcxGridDBColumn;
    cxGrid1DBTableView1TGL: TcxGridDBColumn;
    cxGrid1DBTableView1STATUS: TcxGridDBColumn;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1DBTableView1Column4: TcxGridDBColumn;
    cxGrid1DBTableView1Column5: TcxGridDBColumn;
    cxGrid1DBTableView1Column6: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Label4: TLabel;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView3: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    TGL1: TcxDateEdit;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    cxGridDBTableView1Column3: TcxGridDBColumn;
    cxGridDBTableView1Column4: TcxGridDBColumn;
    cxGridDBTableView1Column5: TcxGridDBColumn;
    cxGridDBTableView1Column6: TcxGridDBColumn;
    cxGridDBTableView1Column7: TcxGridDBColumn;
    cxGridDBTableView1Column8: TcxGridDBColumn;
    cxGridDBTableView1Column9: TcxGridDBColumn;
    cxButton1: TcxButton;
    RETAIL: TMyConnection;
    cek1: TMyQuery;
    sup1: TMyQuery;
    RadioButton3: TRadioButton;
    cxGridDBTableView1Column10: TcxGridDBColumn;
    cxGridDBTableView1Column11: TcxGridDBColumn;
    cxTabSheet3: TcxTabSheet;
    cxGrid3: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    Label5: TLabel;
    kode: TcxTextEdit;
    nama: TcxTextEdit;
    utgl1: TcxDateEdit;
    Label6: TLabel;
    utgl2: TcxDateEdit;
    Label7: TLabel;
    HASIL2: TMyQuery;
    DataSource4: TDataSource;
    cxButton2: TcxButton;
    ULANG: TMyQuery;
    cxTabSheet4: TcxTabSheet;
    Label8: TLabel;
    editpo: TcxTextEdit;
    Label9: TLabel;
    editkd: TcxTextEdit;
    editnm: TcxTextEdit;
    cxGrid4: TcxGrid;
    cxGridDBTableView4: TcxGridDBTableView;
    cxGridDBColumn12: TcxGridDBColumn;
    cxGridDBColumn13: TcxGridDBColumn;
    cxGridDBColumn14: TcxGridDBColumn;
    cxGridDBColumn15: TcxGridDBColumn;
    cxGridDBColumn16: TcxGridDBColumn;
    cxGridDBColumn17: TcxGridDBColumn;
    cxGridDBColumn18: TcxGridDBColumn;
    cxGridDBColumn19: TcxGridDBColumn;
    cxGridDBColumn20: TcxGridDBColumn;
    cxGridDBColumn21: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    rcek: TMyQuery;
    rsup: TMyQuery;
    rhero: TMyQuery;
    DataSource5: TDataSource;
    ABCR: TMyQuery;
    cxGridDBTableView1Column12: TcxGridDBColumn;
    procedure Timer1Timer(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure txtkodeExit(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxGrid1DBTableView1Column7PropertiesEditValueChanged(
      Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure kodeExit(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxGridDBTableView2CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxButton3Click(Sender: TObject);
    procedure editkdExit(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxGridDBColumn12PropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frimportp: Tfrimportp;

implementation
uses frmsupf;

{$R *.dfm}


procedure Tfrimportp.Button1Click(Sender: TObject);
begin
  if messagedlg('Data yang tidak dicentang, tidak akan diproses dan akan dihapus!!!!',mtconfirmation,[mbYes]+[mbNo],0)=mrYes then
  begin
    hero.SQL.Clear;
    hero.SQL.Text:='DELETE FROM IMPORTDATA WHERE POSTED=0 and kodem<>"RTR" AND CEK=0';
    hero.ExecSQL;


    hero.SQL.Clear;
    hero.SQL.Text:='update importdata set proses=1 where tgl=date(now()) and posted=0 and kodem<>"RTR" and cek=1';
    hero.Execute;

    abc.SQL.Clear;
    abc.SQL.Text:='select * from importdata where tgl=date(now()) and proses=0 and kodem<>"RTR" order by no_bukti';
    abc.open;

    hasil.SQL.Clear;
    hasil.SQL.Text:='select * from importdata where tgl=date(now()) and proses=1 order by no_bukti';
    hasil.open;

  end;
end;

procedure Tfrimportp.Button3Click(Sender: TObject);
var
  merk:String;
begin

  if (txtkode.Text='') or (txtnama.Text='') then
  begin
    MessageBox(handle,'Data Supplier Tidak Boleh Kosong!!','Peringatan',MB_OK);
  end
  else if txtpo.Text='' then
  begin
    MessageBox(handle,'Nomor PO Tidak Boleh Kosong!!','Peringatan',MB_OK);
  end
  else
  begin

    if RadioButton1.Checked=true then
    begin
      cek.Close;
      cek.SQL.Clear;
      cek.SQL.Text:='select pono,pokdsupp from kmpoh where pono=:pono group by pono';
      cek.Params.ParamByName('pono').Value := trim(TXTPO.Text);
      cek.Open;

      if cek.RecordCount=0 then
      begin
        MessageBox(handle,'Nomor PO TIDAK dikenali, mohon cek kembali!!','Peringatan',MB_OK);
      end
      else
      begin
        sup.Close;
        sup.SQL.Clear;
        sup.SQL.Text:='select kdsupp,nmsupp from kmmstsupp where kdsupp=:kd group by kdsupp';
        sup.Params.ParamByName('kd').Value := trim(cek.FieldByName('pokdsupp').value);
        sup.Open;

        if messagedlg('Supplier pandaan : '+sup.FieldByName('nmsupp').value+' ??',mtconfirmation,[mbYes]+[mbNo],0)=mrYes then begin
          if RadioButton1.Checked=true then
          begin
            hero.SQL.Clear;
            hero.SQL.Text:='INSERT INTO IMPORTDATA ( NO_BUKTI,TGL,FLAG,TYP,DARI,KODES,NAMAS,KODESR,NAMASR,CEK,PROSES) VALUES ( :BUKTI,DATE(now()),''PO'',''P'',''PANDAAN'',:KODES,:NAMAS,:KODESR,:NAMASR,1,0 )';
            hero.Params.ParamByName('BUKTI').Value := trim(TXTPO.Text);
            hero.Params.ParamByName('kodes').Value := trim(TXTKODE.Text);
            hero.Params.ParamByName('namas').Value := trim(TXTNAMA.Text);
            hero.Params.ParamByName('KODESR').Value := trim(sup.FieldByName('kdsupp').value);
            hero.Params.ParamByName('NAMASR').Value := trim(sup.FieldByName('nmsupp').value);
            hero.Execute;
          end;

        end;

      end;
    end
    else if RadioButton2.Checked=true then
    begin
      if TRIM(cbmerk.Text)='' then
      begin
        MessageBox(handle,'Merk tidak boleh kosong!!','Peringatan',MB_OK);
        cbmerk.SetFocus();
      end
      else
      begin
        if TRIM(cbmerk.Text) = 'BLG' then
            merk := 'bellagio'
        else if  TRIM(cbmerk.Text) = 'BRN' then
            merk := 'brunopremi'
        else if  TRIM(cbmerk.Text) = 'ELV' then
            merk := 'elvio'
        else if  TRIM(cbmerk.Text) = 'GRD' then
            merk := 'gerados'
        else if  TRIM(cbmerk.Text) = 'GRY' then
            merk := 'gerry'
        else if  TRIM(cbmerk.Text) = 'GSH' then
            merk := 'gosh'
        else if  TRIM(cbmerk.Text) = 'JOP' then
            merk := 'joop'
        else if  TRIM(cbmerk.Text) = 'RTL' then
            merk := 'rotelli'
        else if  TRIM(cbmerk.Text) = 'TRS' then
            merk := 'torresin';

        cek1.Close;
        cek1.SQL.Clear;
        cek1.SQL.Text:='select rapo.POBUKTI FROM '+merk+'.rapo where rapo.pobukti=:pono';
        cek1.Params.ParamByName('PONO').Value := trim(TXTPO.Text);
        cek1.Open;

        if cek1.RecordCount=0 then
        begin
          MessageBox(handle,'Nomor PO TIDAK dikenali, mohon cek kembali!!','Peringatan',MB_OK);
        end
        else
        begin
          sup1.Close;
          sup1.SQL.Clear;
          sup1.SQL.Text:='select rapo.POBUKTI,rapo.posupp as kodes,supplier.namasup as namas FROM '+merk+'.rapo left join '+merk+'.supplier on rapo.POSUPP=supplier.KODESUP where rapo.pobukti=:pono';
          sup1.Params.ParamByName('PONO').Value := trim(TXTPO.Text);
          sup1.Open;

          if messagedlg('Nama Supplier : '+sup1.FieldByName('namas').value+' ??',mtconfirmation,[mbYes]+[mbNo],0)=mrYes then begin
              hero.SQL.Clear;
              hero.SQL.Text:='INSERT INTO IMPORTDATA ( NO_BUKTI,TGL,FLAG,TYP,DARI,KODEM,KODES,NAMAS,KODESR,NAMASR,CEK,PROSES) VALUES ( :BUKTI,DATE(now()),''PO'',''R'',''RETAIL'',:KODEM,:KODES,:NAMAS,:KODESR,:NAMASR,1,0 )';
              hero.Params.ParamByName('BUKTI').Value := trim(TXTPO.Text);
              hero.Params.ParamByName('KODEM').Value := trim(CBmerk.Text);
              hero.Params.ParamByName('kodes').Value := trim(TXTKODE.Text);
              hero.Params.ParamByName('namas').Value := trim(TXTNAMA.Text);
              hero.Params.ParamByName('KODESR').Value := trim(sup1.FieldByName('kodes').value);
              hero.Params.ParamByName('NAMASR').Value := trim(sup1.FieldByName('namas').value);
              hero.Execute;
          end;

        end;

      end;

    end
    else if RadioButton3.Checked=true then
    begin
      cek1.Close;
      cek1.SQL.Clear;
      cek1.SQL.Text:='select headpo_t.* from eis.headpo_t where headpo_t.NO_PO=:pono and (headpo_t.MTUANG="RP" or headpo_t.MTUANG="IDR") group by headpo_t.NO_PO';
      cek1.Params.ParamByName('pono').Value := trim(TXTPO.Text);
      cek1.Open;

        if cek1.RecordCount=0 then
        begin
          MessageBox(handle,'Nomor PO TIDAK dikenali, mohon cek kembali!!','Peringatan',MB_OK);
        end
        else if cek1.FieldByName('RPLUNAS').AsInteger = 0 then
        begin
          MessageBox(handle,'Nomor PO Belum Dilunasi!!','Peringatan',MB_OK);
        end
        else
        begin
          sup1.Close;
          sup1.SQL.Clear;
          sup1.SQL.Text:='select headpo_t.NO_PO,headpo_t.kodesup as kodes,headpo_t.NAMASUP as namas FROM eis.headpo_t where headpo_t.NO_PO=:pono';
          sup1.Params.ParamByName('PONO').Value := trim(TXTPO.Text);
          sup1.Open;

          if messagedlg('Nama Supplier : '+sup1.FieldByName('namas').value+' ??',mtconfirmation,[mbYes]+[mbNo],0)=mrYes then begin
              hero.SQL.Clear;
              hero.SQL.Text:='INSERT INTO IMPORTDATA ( NO_BUKTI,TGL,FLAG,TYP,DARI,KODEM,KODES,NAMAS,KODESR,NAMASR,CEK,PROSES) VALUES ( :BUKTI,DATE(now()),''PO'',''R'',''RETAIL'',"PO",:KODES,:NAMAS,:KODESR,:NAMASR,1,0 )';
              hero.Params.ParamByName('BUKTI').Value := trim(TXTPO.Text);
              hero.Params.ParamByName('kodes').Value := trim(TXTKODE.Text);
              hero.Params.ParamByName('namas').Value := trim(TXTNAMA.Text);
              hero.Params.ParamByName('KODESR').Value := trim(sup1.FieldByName('kodes').value);
              hero.Params.ParamByName('NAMASR').Value := trim(sup1.FieldByName('namas').value);
              hero.Execute;
          end;

        end;

    end;

  end;


  abc.SQL.Clear;
  abc.SQL.Text:='select * from importdata where tgl=date(now()) and proses=0 and kodem<>"RTR" order by no_bukti';
  abc.open;

  hasil.SQL.Clear;
  hasil.SQL.Text:='select * from importdata where tgl=date(now()) and proses=1 order by no_bukti';
  hasil.open;


end;

procedure Tfrimportp.cxButton1Click(Sender: TObject);
begin
  hasil.SQL.Clear;
  hasil.SQL.Text:='select * from importdata where tgl="'+FormatDateTime('yyyy-mm-dd',TGL1.DATE)+'" and proses=1 order by no_bukti';
  hasil.open;
end;

procedure Tfrimportp.cxButton2Click(Sender: TObject);
begin
  hasil2.SQL.Clear;
  hasil2.SQL.Text:='select * from importdata where posted=1 and kodes=:kode and namas=:nama and tgl BETWEEN :tgl1 and :tgl2';
  hasil2.Params.ParamByName('kode').Value   := trim(kode.Text);
  hasil2.Params.ParamByName('nama').Value   := trim(nama.Text);
  hasil2.Params.ParamByName('tgl1').Value   := FormatDateTime('yyyy-mm-dd',UTGL1.DATE);
  hasil2.Params.ParamByName('tgl2').Value   := FormatDateTime('yyyy-mm-dd',UTGL2.DATE);
  hasil2.open;
end;

procedure Tfrimportp.cxButton3Click(Sender: TObject);
begin

  if (editkd.Text='') or (editnm.Text='') then
  begin
    MessageBox(handle,'Data Supplier Tidak Boleh Kosong!!','Peringatan',MB_OK);
  end
  else if editpo.Text='' then
  begin
    MessageBox(handle,'Nomor PO Tidak Boleh Kosong!!','Peringatan',MB_OK);
  end
  else
  begin
    rcek.Close;
    rcek.SQL.Clear;
    rcek.SQL.Text:='select trim(kmrtrbelid.dnopo) as nopo,trim(kmrtrbelih.hkdsupp) as sup from kmrtrbelid,kmrtrbelih '
                 +'where kmrtrbelih.hnobukti=kmrtrbelid.dnobukti AND kmrtrbelid.dnopo=:pono group by kmrtrbelid.dnopo ';
    rcek.Params.ParamByName('pono').Value := trim(editpo.Text);
    rcek.Open;

    if rcek.RecordCount=0 then
    begin
      MessageBox(handle,'Nomor PO TIDAK dikenali, mohon cek kembali!!','Peringatan',MB_OK);
    end
    else
    begin
      rsup.Close;
      rsup.SQL.Clear;
      rsup.SQL.Text:='select kdsupp,nmsupp from kmmstsupp where kdsupp=:kd group by kdsupp';
      rsup.Params.ParamByName('kd').Value := trim(rcek.FieldByName('sup').value);
      rsup.Open;

      if messagedlg('Supplier pandaan : '+rsup.FieldByName('nmsupp').value+' ??',mtconfirmation,[mbYes]+[mbNo],0)=mrYes then
      begin

        rhero.SQL.Clear;
        rhero.SQL.Text:='INSERT INTO IMPORTDATA ( NO_BUKTI,TGL,FLAG,TYP,DARI,KODES,NAMAS,KODESR,NAMASR,CEK,PROSES,KODEM) VALUES ( :BUKTI,DATE(now()),''PO'',''R'',''PANDAAN'',:KODES,:NAMAS,:KODESR,:NAMASR,1,0,"RTR" )';
        rhero.Params.ParamByName('BUKTI').Value := trim(editpo.Text);
        rhero.Params.ParamByName('kodes').Value := trim(editkd.Text);
        rhero.Params.ParamByName('namas').Value := trim(editnm.Text);
        rhero.Params.ParamByName('KODESR').Value := trim(rsup.FieldByName('kdsupp').value);
        rhero.Params.ParamByName('NAMASR').Value := trim(rsup.FieldByName('nmsupp').value);
        rhero.Execute;

      end;

    end;
  end;

  abcr.SQL.Clear;
  abcr.SQL.Text:='select * from importdata where tgl=date(now()) and kodem="RTR" and proses=0 order by no_bukti';
  abcr.open;

  hasil.SQL.Clear;
  hasil.SQL.Text:='select * from importdata where tgl=date(now()) and proses=1 order by no_bukti';
  hasil.open;

end;

procedure Tfrimportp.cxButton4Click(Sender: TObject);
begin

  if messagedlg('Data yang tidak dicentang, tidak akan diproses dan akan dihapus!!!!',mtconfirmation,[mbYes]+[mbNo],0)=mrYes then
  begin
    rhero.SQL.Clear;
    rhero.SQL.Text:='DELETE FROM IMPORTDATA WHERE POSTED=0 and kodem="RTR" AND CEK=0';
    rhero.ExecSQL;

    rhero.SQL.Clear;
    rhero.SQL.Text:='update importdata set proses=1 where tgl=date(now()) and posted=0 and kodem="RTR" and cek=1';
    rhero.Execute;

    abcr.SQL.Clear;
    abcr.SQL.Text:='select * from importdata where tgl=date(now())  and proses=0 and kodem="RTR" order by no_bukti';
    abcr.open;

    hasil.SQL.Clear;
    hasil.SQL.Text:='select * from importdata where tgl=date(now()) and proses=1 order by no_bukti';
    hasil.open;

  end;

end;

procedure Tfrimportp.cxGrid1DBTableView1Column7PropertiesEditValueChanged(
  Sender: TObject);
begin
abc.Edit;
abc.Post;
end;

procedure Tfrimportp.cxGridDBColumn12PropertiesEditValueChanged(
  Sender: TObject);
begin
abcr.Edit;
abcr.Post;
end;

procedure Tfrimportp.cxGridDBTableView2CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
//  ShowMessage(''+IntToStr(DataSource4.DataSet.FieldByName('NO_ID').AsInteger)+'');
  if messagedlg('Tarik ulang PO   '+DataSource4.DataSet.FieldByName('NO_BUKTI').AsString+'    !!!!',mtconfirmation,[mbYes]+[mbNo],0)=mrYes then
  begin
    ULANG.Close;
    ULANG.SQL.Clear;
    ULANG.SQL.Text := 'update importdata set tgl=:tgl, posted=0, status="", POZ=0, BELIZ=0 where no_id=:id';
    ULANG.Params.ParamByName('TGL').Value   := FormatDateTime('yyyy-mm-dd',NOW);
    ULANG.Params.ParamByName('ID').Value    := DataSource4.DataSet.FieldByName('NO_ID').AsInteger;
    ULANG.ExecSQL;

    hasil2.SQL.Clear;
    hasil2.SQL.Text:='select * from importdata where posted=1 and kodes=:kode and namas=:nama and tgl BETWEEN :tgl1 and :tgl2';
    hasil2.Params.ParamByName('kode').Value   := trim(kode.Text);
    hasil2.Params.ParamByName('nama').Value   := trim(nama.Text);
    hasil2.Params.ParamByName('tgl1').Value   := FormatDateTime('yyyy-mm-dd',UTGL1.DATE);
    hasil2.Params.ParamByName('tgl2').Value   := FormatDateTime('yyyy-mm-dd',UTGL2.DATE);
    hasil2.open;
  end;

end;

procedure Tfrimportp.editkdExit(Sender: TObject);
begin
  if editkd.text <>'' then
   begin

   com.SQL.Clear;
   com.sql.text:='select KODES, NAMAS from SUP where KODES=:b1';
   com.Params.ParamByName('b1').AsString:=trim(editkd.text) ;
   com.Open;

    if not com.EOF then
    begin
      editkd.text := com.FieldByName('kodes').AsString;
      editnm.text := com.FieldByName('namas').AsString;
    end
    else
    begin
      frsupF.Hint := 'retur';
      frsupF.ShowModal;
      editkd.text := frsupF.rKode;
      editnm.text := frsupF.rNama;
      FrsupF.Close;
    end;
  end;

end;

procedure Tfrimportp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if messagedlg('Yakin Anda Ingin Keluar...?',mtconfirmation,[mbYes]+[mbNo],0)=mrYes then begin
    application.Terminate;
  end;
end;

procedure Tfrimportp.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key = VK_RETURN)  then
begin
  frimportp.perform(WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure Tfrimportp.FormShow(Sender: TObject);
begin
TGL1.Date := NOW();

frimportp.KeyPreview:=true;

   merk.SQL.Clear;
   merk.SQL.Text:='SELECT trim(KODE) AS KODE, TRIM(NAMA) AS NAMA FROM MERK ' ;
   merk.Open;



abc.SQL.Clear;
abc.SQL.Text:='select * from importdata where tgl=date(now()) and proses=0 order by no_bukti';
abc.open;

hasil.SQL.Clear;
hasil.SQL.Text:='select * from importdata where tgl=date(now()) and proses=1 order by no_bukti';
hasil.open;

end;

procedure Tfrimportp.kodeExit(Sender: TObject);
begin
  if kode.text <>'' then

  begin

   com.SQL.Clear;
   com.sql.text:='select KODES, NAMAS from SUP where KODES=:b1';
   com.Params.ParamByName('b1').AsString:=trim(kode.text) ;
   com.Open;

    if not com.EOF then
    begin
       kode.text := com.FieldByName('kodes').AsString;
       nama.text := com.FieldByName('namas').AsString;

    end
    else
    begin
       frsupF.Hint := 'ulang';
       frsupF.ShowModal;
       kode.text := frsupF.ukode;
       nama.text := frsupF.unama;
       FrsupF.Close;
    end;
  end;
end;

procedure Tfrimportp.Timer1Timer(Sender: TObject);
var
BUKTIPO,STATUS : STRING;
POX,BLX : INTEGER;

begin
{
BUKTIPO:='';
   HEROX.SQL.Clear;
   HEROX.SQL.text:='SELECT * from IMPORTDATA where POSTED=0 ';
   HEROX.OPEN;

  HEROX.First;
  while NOT HEROX.EOF do
  BEGIN

  POX:=0;
  BLX:=0;
  STATUS:='Gagal';
  BUKTIPO:=TRIM(herox.FieldByName('NO_BUKTI').Value);

        COM.SQL.Clear;
        COM.SQL.text:='SELECT * from kmpoh where pono=:pono ';
        COM.Params.ParamByName('PONO').Value := trim(herox.FieldByName('NO_BUKTI').value) ;
        COM.OPEN;



     if com.RecordCount > 0 then
     begin



            //   ShowMessage('1');

           hero.SQL.Clear;
           hero.SQL.text:='select pono from PANDAANSBY.kmpoh where pono=:pono';
           hero.Params.ParamByName('pono').Value:=trim(herox.FieldByName('NO_BUKTI').value) ;
           hero.Open;



          if hero.RecordCount = 0 then
          begin
              // ShowMessage('2');
            POX:=1;

            hero.SQL.Clear;
            hero.SQL.Text:='insert into  PANDAANSBY.kmpoh (pono, potgl, pokdsupp, povaluta, pokurs, potop, potglkrm, pobruto, podisc, pojumdisc, poppn,'
                          +'pojumppn, ponetto, podestport, pokddept, poapproved, pochecked, pocetak, popost, potglpost, pousrpost, pokomppost ) '
                          +' values ( :pono, :potgl, :pokdsupp, :povaluta, :pokurs, :potop, :potglkrm, :pobruto, :podisc, :pojumdisc, :poppn, '
                          +':pojumppn, :ponetto, :podestport, :pokddept, :poapproved, :pochecked, :pocetak, :popost, :potglpost, :pousrpost, :pokomppost) ';

            hero.Params.ParamByName('pono').Value:=com.FieldByName('pono').value;
            hero.Params.ParamByName('potgl').Value:=FormatDateTime('yyyy-mm-dd',com.FieldByName('potgl').AsDateTime);
            hero.Params.ParamByName('pokdsupp').Value:=com.FieldByName('pokdsupp').value;
            hero.Params.ParamByName('povaluta').Value:=com.FieldByName('povaluta').value;
            hero.Params.ParamByName('pokurs').Value:=com.FieldByName('pokurs').value;
            hero.Params.ParamByName('potop').Value:=com.FieldByName('potop').value;
            hero.Params.ParamByName('potglkrm').Value:=FormatDateTime('yyyy-mm-dd',com.FieldByName('potglkrm').AsDateTime);
            hero.Params.ParamByName('pobruto').Value:=com.FieldByName('pobruto').value;
            hero.Params.ParamByName('podisc').Value:=com.FieldByName('podisc').value;
            hero.Params.ParamByName('pojumdisc').Value:=com.FieldByName('pojumdisc').value;
            hero.Params.ParamByName('poppn').Value:=com.FieldByName('poppn').value;
            hero.Params.ParamByName('pojumppn').Value:=com.FieldByName('pojumppn').value;
            hero.Params.ParamByName('ponetto').Value:=com.FieldByName('ponetto').value;
            hero.Params.ParamByName('podestport').Value:=com.FieldByName('podestport').value;
            hero.Params.ParamByName('pokddept').Value:=com.FieldByName('pokddept').value;
            hero.Params.ParamByName('poapproved').Value:=com.FieldByName('poapproved').value;
            hero.Params.ParamByName('pochecked').Value:=com.FieldByName('pochecked').value;
            hero.Params.ParamByName('pocetak').Value:=com.FieldByName('pocetak').value;
            hero.Params.ParamByName('popost').Value:=com.FieldByName('popost').value;
            hero.Params.ParamByName('potglpost').Value:=FormatDateTime('yyyy-mm-dd',com.FieldByName('potglpost').AsDateTime);
            hero.Params.ParamByName('pousrpost').Value:=com.FieldByName('pousrpost').value;
            hero.Params.ParamByName('pokomppost').Value:=com.FieldByName('pokomppost').value;
            hero.ExecSQL;




                COMD.SQL.Clear;
                COMD.SQL.text:='SELECT * from kmpod where dnopo=:dnopo order by dnopo ';
                COMD.Params.ParamByName('dnopo').Value := com.FieldByName('pono').Value;
                COMD.OPEN;



                comd.First;
                while not comd.eof do
                begin

                    herod.SQL.Clear;
                    herod.SQL.Text:='insert into  PANDAANSBY.kmpod (dnopo, dtglpo, dkdsupp, dkdbrg, dsatbeli, dsatpakai, dqty, dhrgsatuan, ddisc1, ddisc2, dsubtot, dqtytrm, dtgltrm,'
                                  +' access, komp, userby, postatus1, ketstatus1, access1, komp1, userby1, postatus2, ketstatus2, access2, komp2, userby2, postatus3, ketstatus3,'
                                  +' access3, komp3, userby3, aestdate, afixdate, afixqty, aaccess, akomp, auserby ) '
                                  +' values ( :dnopo, :dtglpo, :dkdsupp, :dkdbrg, :dsatbeli, :dsatpakai, :dqty, :dhrgsatuan, :ddisc1, :ddisc2, :dsubtot, :dqtytrm, :dtgltrm, :access,'
                                  +' :komp, :userby, :postatus1, :ketstatus1, :access1, :komp1, :userby1, :postatus2, :ketstatus2, :access2, :komp2, :userby2, :postatus3, :ketstatus3,'
                                  +' :access3, :komp3, :userby3, :aestdate, :afixdate, :afixqty, :aaccess, :akomp, :auserby) ';

                    herod.Params.ParamByName('dnopo').Value:=comd.FieldByName('dnopo').value;
                    herod.Params.ParamByName('dtglpo').Value:=FormatDateTime('yyyy-mm-dd',comd.FieldByName('dtglpo').AsDateTime);
                    herod.Params.ParamByName('dkdsupp').Value:=comd.FieldByName('dkdsupp').value;
                    herod.Params.ParamByName('dkdbrg').Value:=comd.FieldByName('dkdbrg').value;
                    herod.Params.ParamByName('dsatbeli').Value:=comd.FieldByName('dsatbeli').value;
                    herod.Params.ParamByName('dsatpakai').Value:=comd.FieldByName('dsatpakai').value;
                    herod.Params.ParamByName('dqty').Value:=comd.FieldByName('dqty').value;
                    herod.Params.ParamByName('dhrgsatuan').Value:=comd.FieldByName('dhrgsatuan').value;
                    herod.Params.ParamByName('ddisc1').Value:=comd.FieldByName('ddisc1').value;
                    herod.Params.ParamByName('ddisc2').Value:=comd.FieldByName('ddisc2').value;
                    herod.Params.ParamByName('dsubtot').Value:=comd.FieldByName('dsubtot').value;
                    herod.Params.ParamByName('dqtytrm').Value:=comd.FieldByName('dqtytrm').value;
                    herod.Params.ParamByName('dtgltrm').Value:=FormatDateTime('yyyy-mm-dd',comd.FieldByName('dtgltrm').AsDateTime);
                    herod.Params.ParamByName('access').Value:=comd.FieldByName('access').value;
                    herod.Params.ParamByName('komp').Value:=comd.FieldByName('komp').value;
                    herod.Params.ParamByName('userby').Value:=comd.FieldByName('userby').value;
                    herod.Params.ParamByName('postatus1').Value:=comd.FieldByName('postatus1').value;
                    herod.Params.ParamByName('ketstatus1').Value:=comd.FieldByName('ketstatus1').value;
                    herod.Params.ParamByName('access1').Value:=comd.FieldByName('access1').value;
                    herod.Params.ParamByName('komp1').Value:=comd.FieldByName('komp1').value;
                    herod.Params.ParamByName('userby1').Value:=comd.FieldByName('userby1').value;
                    herod.Params.ParamByName('postatus2').Value:=comd.FieldByName('postatus2').value;
                    herod.Params.ParamByName('ketstatus2').Value:=comd.FieldByName('ketstatus2').value;
                    herod.Params.ParamByName('access2').Value:=comd.FieldByName('access2').value;
                    herod.Params.ParamByName('komp2').Value:=comd.FieldByName('komp2').value;
                    herod.Params.ParamByName('userby2').Value:=comd.FieldByName('userby2').value;
                    herod.Params.ParamByName('postatus3').Value:=comd.FieldByName('postatus3').value;
                    herod.Params.ParamByName('ketstatus3').Value:=comd.FieldByName('ketstatus3').value;
                    herod.Params.ParamByName('access3').Value:=comd.FieldByName('access3').value;
                    herod.Params.ParamByName('komp3').Value:=comd.FieldByName('komp3').value;
                    herod.Params.ParamByName('userby3').Value:=comd.FieldByName('userby3').value;
                    herod.Params.ParamByName('aestdate').Value:=FormatDateTime('yyyy-mm-dd',comd.FieldByName('aestdate').AsDateTime);
                    herod.Params.ParamByName('afixdate').Value:=FormatDateTime('yyyy-mm-dd',comd.FieldByName('afixdate').AsDateTime);
                    herod.Params.ParamByName('afixqty').Value:=comd.FieldByName('afixqty').value;
                    herod.Params.ParamByName('aaccess').Value:=comd.FieldByName('aaccess').value;
                    herod.Params.ParamByName('akomp').Value:=comd.FieldByName('akomp').value;
                    herod.Params.ParamByName('auserby').Value:=comd.FieldByName('auserby').value;
                    herod.ExecSQL;


                comd.Next;
               end;






                    com.SQL.Clear;
                    com.SQL.text:='select * from kmbelih where blnopo=:pono';
                    com.Params.ParamByName('pono').Value:=trim(herox.FieldByName('no_bukti').value) ;
                    com.OPEN;



                    com.First;
                    while not com.eof do
                    begin

                    //ShowMessage('3');
                        BLX:=1;
                                   hero.SQL.Clear;
                                   hero.SQL.text:='select blnopo from  PANDAANSBY.kmbelih where blnobukti=:blnobukti';
                                   hero.Params.ParamByName('blnobukti').Value:=com.FieldByName('blnobukti').Value;
                                   hero.Open;



                                  if hero.RecordCount = 0 then
                                  begin

                                    hero.SQL.Clear;
                                    hero.SQL.Text:='insert into  PANDAANSBY.kmbelih (blkdsupp, blnosj, bltglsj, blnopo, bltglpo, blnobukti, bltgl, blkdgdg, blket, blkddept, blcetak ) '
                                                  +' values ( :blkdsupp, :blnosj, :bltglsj, :blnopo, :bltglpo, :blnobukti, :bltgl, :blkdgdg, :blket, :blkddept, :blcetak) ';

                                    hero.Params.ParamByName('blkdsupp').Value:=com.FieldByName('blkdsupp').value;
                                    hero.Params.ParamByName('blnosj').Value:=com.FieldByName('blnosj').value;
                                    hero.Params.ParamByName('bltglsj').Value:=FormatDateTime('yyyy-mm-dd',com.FieldByName('bltglsj').AsDateTime);
                                    hero.Params.ParamByName('blnopo').Value:=com.FieldByName('blnopo').value;
                                    hero.Params.ParamByName('bltglpo').Value:=FormatDateTime('yyyy-mm-dd',com.FieldByName('bltglpo').AsDateTime);
                                    hero.Params.ParamByName('blnobukti').Value:=com.FieldByName('blnobukti').value;
                                    hero.Params.ParamByName('bltgl').Value:=FormatDateTime('yyyy-mm-dd',com.FieldByName('bltgl').AsDateTime);
                                    hero.Params.ParamByName('blkdgdg').Value:=com.FieldByName('blkdgdg').value;
                                    hero.Params.ParamByName('blket').Value:=com.FieldByName('blket').value;
                                    hero.Params.ParamByName('blkddept').Value:=com.FieldByName('blkddept').value;
                                    hero.Params.ParamByName('blkddept').Value:=com.FieldByName('blkddept').value;
                                    hero.ExecSQL;



                              COMD.SQL.Clear;
                              COMD.SQL.text:='SELECT * from kmbelid  where dblnobukti=:dblnobukti order by dblnobukti ';
                              COMD.Params.ParamByName('dblnobukti').Value:=com.FieldByName('blnobukti').Value;
                              COMD.OPEN;



                                      comd.First;
                                      while not comd.eof do
                                      begin

                                          herod.SQL.Clear;
                                          herod.SQL.Text:='insert into  PANDAANSBY.kmbelid (dblnobukti, dbltgl, dblkdbrg, dblqtyord, dblsatord, dblqtybl, dblsatbl, dblqtytrm, '
                                                        +' dblsattrm, dblket, dlpbnobukti, dlpbnobaris, dblnoaju, dblnoinv, dblhscode, dblnmhscode, dblkdbrgpib, dblqtypib,'
                                                        +' dblsatpib, dblnobaris, dblsatsama, dblkonversi, dblkdfas, access, komp, userby ) '
                                                        +' values ( :dblnobukti, :dbltgl, :dblkdbrg, :dblqtyord, :dblsatord, :dblqtybl, :dblsatbl, :dblqtytrm, :dblsattrm, :dblket,'
                                                        +' :dlpbnobukti, :dlpbnobaris, :dblnoaju, :dblnoinv, :dblhscode, :dblnmhscode, :dblkdbrgpib, :dblqtypib, :dblsatpib, :dblnobaris,'
                                                        +' :dblsatsama, :dblkonversi, :dblkdfas, :access, :komp, :userby) ';

                                          herod.Params.ParamByName('dblnobukti').Value:=comd.FieldByName('dblnobukti').value;
                                          herod.Params.ParamByName('dbltgl').Value:=FormatDateTime('yyyy-mm-dd',comd.FieldByName('dbltgl').AsDateTime);
                                          herod.Params.ParamByName('dblkdbrg').Value:=comd.FieldByName('dblkdbrg').value;
                                          herod.Params.ParamByName('dblqtyord').Value:=comd.FieldByName('dblqtyord').value;
                                          herod.Params.ParamByName('dblsatord').Value:=comd.FieldByName('dblsatord').value;
                                          herod.Params.ParamByName('dblqtybl').Value:=comd.FieldByName('dblqtybl').value;
                                          herod.Params.ParamByName('dblsatbl').Value:=comd.FieldByName('dblsatbl').value;
                                          herod.Params.ParamByName('dblqtytrm').Value:=comd.FieldByName('dblqtytrm').value;
                                          herod.Params.ParamByName('dblsattrm').Value:=comd.FieldByName('dblsattrm').value;
                                          herod.Params.ParamByName('dblket').Value:=comd.FieldByName('dblket').value;
                                          herod.Params.ParamByName('dlpbnobukti').Value:=comd.FieldByName('dlpbnobukti').value;
                                          herod.Params.ParamByName('dlpbnobaris').Value:=comd.FieldByName('dlpbnobaris').value;
                                          herod.Params.ParamByName('dblnoaju').Value:=comd.FieldByName('dblnoaju').value;
                                          herod.Params.ParamByName('dblnoinv').Value:=comd.FieldByName('dblnoinv').value;
                                          herod.Params.ParamByName('dblhscode').Value:=comd.FieldByName('dblhscode').value;
                                          herod.Params.ParamByName('dblnmhscode').Value:=comd.FieldByName('dblnmhscode').value;
                                          herod.Params.ParamByName('dblkdbrgpib').Value:=comd.FieldByName('dblkdbrgpib').value;
                                          herod.Params.ParamByName('dblqtypib').Value:=comd.FieldByName('dblqtypib').value;
                                          herod.Params.ParamByName('dblsatpib').Value:=comd.FieldByName('dblsatpib').value;
                                          herod.Params.ParamByName('dblnobaris').Value:=comd.FieldByName('dblnobaris').value;
                                          herod.Params.ParamByName('dblsatsama').Value:=comd.FieldByName('dblsatsama').value;
                                          herod.Params.ParamByName('dblkonversi').Value:=comd.FieldByName('dblkonversi').value;
                                          herod.Params.ParamByName('dblkdfas').Value:=comd.FieldByName('dblkdfas').value;
                                          herod.Params.ParamByName('access').Value:=comd.FieldByName('access').value;
                                          herod.Params.ParamByName('komp').Value:=comd.FieldByName('komp').value;
                                          herod.Params.ParamByName('userby').Value:=comd.FieldByName('userby').value;
                                          herod.ExecSQL;



                                        comd.Next;
                                       end;
                            end;


                    com.Next;
                    end;

          STATUS:='Berhasil';
        end;

    end;

        HERO.SQL.Clear;
        HERO.SQL.text:='UPDATE IMPORTDATA SET POSTED=1 ,STATUS=:STATUS,POZ=:POX,BELIZ=:BLX where NO_BUKTI=:NO_PO';
        HERO.Params.ParamByName('STATUS').Value:=STATUS;
        HERO.Params.ParamByName('POX').Value:=POX;
        HERO.Params.ParamByName('BLX').Value:=BLX;
        HERO.Params.ParamByName('NO_PO').Value:=TRIM(HEROX.FieldByName('NO_BUKTI').value);

        HERO.ExecSQL;



        abc.SQL.Clear;
        abc.SQL.Text:='select * from importdata where tgl=date(now())order by no_bukti';
        abc.open;


   herox.Next;
 end;  }


end;

procedure Tfrimportp.Timer2Timer(Sender: TObject);
begin


hasil.SQL.Clear;
hasil.SQL.Text:='select * from importdata where tgl=date(now()) and proses=1 order by no_bukti';
hasil.open;

abc.SQL.Clear;
abc.SQL.Text:='select * from importdata where tgl=date(now()) and proses=0 and kodem<>"RTR"  order by no_bukti';
abc.open;

abcr.SQL.Clear;
abcr.SQL.Text:='select * from importdata where tgl=date(now()) and proses=0 and kodem="RTR"  order by no_bukti';
abcr.open;

end;

procedure Tfrimportp.txtkodeExit(Sender: TObject);
begin
  if txtkode.text <>'' then

   begin

   com.SQL.Clear;
   com.sql.text:='select KODES, NAMAS from SUP where KODES=:b1';
   com.Params.ParamByName('b1').AsString:=trim(txtkode.text) ;
   com.Open;

   if not com.EOF then
      begin
                 txtkode.text := com.FieldByName('kodes').AsString;
                 txtnama.text := com.FieldByName('namas').AsString;

      end

   else

      begin
            frsupF.Hint := 'po';
                  frsupF.ShowModal;
                  txtkode.text := frsupF.getKode;
                  txtnama.text := frsupF.getNama;
                  FrsupF.Close;
      end;
end;
end;

end.
