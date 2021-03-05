unit frmdatapandaan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, MemDS, DBAccess,
  MyAccess, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
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
  dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxDBEdit, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus, cxButtons;

type
  Tfrdatapandaan = class(TForm)
    PANDAAN: TMyConnection;
    hero: TMyQuery;
    DTTGL: TcxDateEdit;
    COM: TMyQuery;
    KMPOH: TcxButton;
    kmbs: TMyConnection;
    cxButton1: TcxButton;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    comd: TMyQuery;
    herod: TMyQuery;
    cxButton2: TcxButton;
    txtpo: TcxTextEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure KMPOHClick(Sender: TObject);
    procedure KMPODClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frdatapandaan: Tfrdatapandaan;

implementation

{$R *.dfm}

procedure Tfrdatapandaan.Button1Click(Sender: TObject);
begin

hero.sql.clear;
hero.sql.text:='DELETE FROM PO WHERE TGL=:TGL ';
hero.Params.ParamByName('tgl').Value:=FormatDateTime('yyyy-mm-dd',DTtgl.Date);
hero.ExecSQL;

hero.sql.clear;
hero.sql.text:='DELETE FROM POD WHERE POTGL=:TGL ';
hero.Params.ParamByName('tgl').Value:=FormatDateTime('yyyy-mm-dd',DTtgl.Date);
hero.ExecSQL;

hero.sql.clear;
hero.sql.text:=' INSERT INTO PO(NO_BUKTI,TGL,JTEMPO,CURR,RATE,KODES,TOTAL1,DISC,PPN,NETT1,DISC1,PPN1,'
              +' TOTAL,RPDISC,RPPPN,NETT,SISA,RPDISC1,RPPPN1,FLAG,PER,TYP,GOL ) '
              +' SELECT TRIM(KMPOH.PONO),KMPOH.POTGL,KMPOH.POTGLKRM,KMPOH.POVALUTA,KMPOH.POKURS,TRIM(KMPOH.POKDSUPP), '
              +' KMPOH.POBRUTO,KMPOH.POJUMDISC,KMPOH.POJUMPPN,KMPOH.PONETTO,KMPOH.PODISC,KMPOH.POPPN,'
              +' KMPOH.POBRUTO * KMPOH.POKURS AS TOTAL,KMPOH.POJUMDISC*KMPOH.POKURS  AS RPDISC, KMPOH.POJUMPPN *KMPOH.POKURS  AS RPPPN,KMPOH.PONETTO*KMPOH.POKURS AS NETT,KMPOH.PONETTO*KMPOH.POKURS AS SISA,'
              +' KMPOH.PODISC AS RPDISC1,KMPOH.POPPN AS RPPPN1,''PO'',CONCAT(lpad(MONTH(KMPOH.POTGL),2,''0''),''/'',year(KMPOH.POTGL)) as per,IF(KMPOH.POVALUTA=''IDR'',''L'',''I'') AS TYP,''A'' FROM KMBSLAMA.KMPOH WHERE KMPOH.POTGL=:TGL   ';
hero.Params.ParamByName('tgl').Value:=FormatDateTime('yyyy-mm-dd',DTtgl.Date);
hero.ExecSQL;
ShowMessage('PO');

hero.sql.clear;
hero.sql.text:=' INSERT INTO POD ( NO_BUKTI, KD_BHN,NA_BHN,SATUAN, QTY,SISA_QTY, HARGA, TOTAL, HARGA1, TOTAL1,DISC,RPDISC,DISC2,POTGL ) '
              +' SELECT TRIM(KMPOD.DNOPO),TRIM(KMPOD.DKDBRG),TRIM(kmmstbhnbaku.nmbrg) AS nmbrg,TRIM(KMPOD.DSATBELI),KMPOD.DQTY,KMPOD.DQTY AS SISA, '
              +' KMPOD.DHRGSATUAN * KMPOH.POKURS AS HARGA ,KMPOD.DQTY*KMPOD.DHRGSATUAN - ( IF(KMPOD.DDISC1 > 1,KMPOD.DQTY*KMPOD.DHRGSATUAN*KMPOD.DDISC1/100,KMPOD.DDISC2)) * KMPOH.POKURS   AS TOTAL, '
              +' KMPOD.DHRGSATUAN As harga1,KMPOD.DQTY*KMPOD.DHRGSATUAN - ( IF(KMPOD.DDISC1 > 1,KMPOD.DQTY*KMPOD.DHRGSATUAN*KMPOD.DDISC1/100,KMPOD.DDISC2)) AS TOTAL1,'
              +' KMPOD.DDISC1,KMPOD.DDISC1*KMPOD.DHRGSATUAN AS RPDISC, KMPOD.DDISC2,KMPOH.POTGL FROM KMBSLAMA.KMPOH,KMBSLAMA.KMPOD LEFT JOIN KMBSLAMA.KMMSTBHNBAKU ON TRIM(KMPOD.DKDBRG)= TRIM(KMMSTBHNBAKU.KDBRG) '
              +' WHERE TRIM(KMPOH.PONO)=TRIM(KMPOD.DNOPO) AND KMPOH.POTGL=:TGL ';
hero.Params.ParamByName('tgl').Value:=FormatDateTime('yyyy-mm-dd',DTtgl.Date);
hero.ExecSQL;

//KIRIM,
//KMPOD.DQTYTRM

ShowMessage('POD');
hero.SQL.Clear;
hero.SQL.text:='update pod,po set POD.PER=PO.PER,POD.TYP=PO.TYP,POD.GOL=PO.GOL,POD.ID=PO.NO_ID WHERE TRIM(POD.NO_BUKTI)=TRIM(PO.NO_BUKTI) AND POD.POTGL=:TGL ' ;
hero.Params.ParamByName('tgl').Value:=FormatDateTime('yyyy-mm-dd',DTtgl.Date);
hero.ExecSQL;





ShowMessage('UP PO');

                // ,REC,PER,FLAG, NO_PP,NA_BHN,ID,BLT , TYP,GOL
               ///  DSUBTOT
end;

procedure Tfrdatapandaan.Button2Click(Sender: TObject);
begin


hero.sql.clear;
hero.sql.text:='DELETE FROM beli WHERE TGL=:TGL ';
hero.Params.ParamByName('tgl').Value:=FormatDateTime('yyyy-mm-dd',DTtgl.Date);
hero.ExecSQL;



 hero.sql.clear;
hero.sql.text:='DELETE FROM beliD WHERE BLTGL=:TGL ';
hero.Params.ParamByName('tgl').Value:=FormatDateTime('yyyy-mm-dd',DTtgl.Date);
hero.ExecSQL;

 hero.SQL.Clear;
 hero.SQL.text:=' INSERT INTO BELI(NO_BUKTI,TGL,KODES,NO_SJ,TGL_SJ,NO_PO,BLKDGDG,NOTES,BLKDDEPT,'
                + ' CURR,RATE,FLAG,PER,TYP,GOL,NAMAS, ALAMAT, KOTA ,ABL ) '

                +' select TRIM(kmbelih.blnobukti),kmbelih.bltgl,TRIM(kmbelih.blkdsupp),TRIM(kmbelih.blnosj),kmbelih.bltglsj,TRIM(kmbelih.blnopo),TRIM(kmbelih.blkdgdg),TRIM(kmbelih.blket),TRIM(kmbelih.blkddept),'
                + ' TRIM(kmpoh.povaluta),kmpoh.pokurs,''BL'' ,CONCAT(lpad(MONTH(kmbelih.bltgl),2,''0''),''/'',year(kmbelih.bltgl)) as per,IF(KMPOH.POVALUTA=''IDR'',''L'',''I'') AS TYP,''A'',TRIM(KMMSTSUPP.NMSUPP),TRIM(KMMSTSUPP.ALSUPP),TRIM(KMMSTSUPP.KTSUPP),1 '
                +' from KMBSLAMA.KMBELIH LEFT JOIN KMBSLAMA.KMPOH ON TRIM(KMBELIH.BLNOPO) = TRIM(KMPOH.PONO) LEFT JOIN KMBSLAMA.KMMSTSUPP ON TRIM(KMBELIH.BLKDSUPP)=TRIM(KMMSTSUPP.KDSUPP) '
                +' where kmbelih.bltgl=:tgl ';
hero.Params.ParamByName('tgl').Value:=FormatDateTime('yyyy-mm-dd',DTtgl.Date);
hero.ExecSQL;

ShowMessage('BELI');

// 'CURRNM, TOTAL,RPDISC,RPPPN,NETT,SISA,RPDISC1,RPPPN1,RPPPH1,RPPPH,INVOICE,TGL_INVOICE,NO_FP,TGL_FP

  // TOTAL_QTY,TOTAL1,DISC,PPN,NETT1,DISC1,PPN1,PPH1,PPH,'

 hero.SQL.Clear;
 hero.SQL.text:=' INSERT INTO BELID ( NO_BUKTI,BLTGL,KD_BHN,NA_BHN,QTY,SATUAN,KET,NO_PO,HARGA1,HARGA )  '
               +' SELECT TRIM(kmbelid.dblnobukti) AS dblnobukti,kmbelid.dbltgl,TRIM(kmbelid.dblkdbrg) AS dblkdbrg,TRIM(kmmstbhnbaku.nmbrg) AS nmbrg,kmbelid.dblqtybl  ,TRIM(kmbelid.dblsatbl) AS dblsatbl,TRIM(kmbelid.dblket) AS dblKET,TRIM(KMBELIH.BLNOPO)  AS BLNOPO , '
               +' KMPOD.DHRGSATUAN ,KMPOD.DHRGSATUAN AS HARGA '
               +' FROM kmbslama.kmbelih,KMBSLAMA.KMBELID left join KMBSLAMA.kmmstbhnbaku on TRIM(kmbelid.dblkdbrg)=TRIM(kmmstbhnbaku.kdbrg) ,KMBSLAMA.KMPOD WHERE TRIM(kmbeliH.blnobukti) = TRIM(kmbeliD.Dblnobukti) AND kmbeliH.BLTGL=:TGL  AND '
               +' KMBELIH.BLNOPO=KMPOD.DNOPO AND KMBELID.DBLKDBRG=KMPOD.DKDBRG ' ;

hero.Params.ParamByName('tgl').Value:=FormatDateTime('yyyy-mm-dd',DTtgl.Date);
hero.ExecSQL;



 hero.SQL.Clear;
 hero.SQL.text:=' INSERT INTO BELIDX ( NO_BUKTI,BLTGL,KD_BHN,NA_BHN,QTY,SATUAN,KET,NO_PO,HARGA1,HARGA )  '
               +' SELECT TRIM(kmbelid.dblnobukti) AS dblnobukti,kmbelid.dbltgl,TRIM(kmbelid.dblkdbrg) AS dblkdbrg,TRIM(kmmstbhnbaku.nmbrg) AS nmbrg,kmbelid.dblqtybl  ,TRIM(kmbelid.dblsatbl) AS dblsatbl,TRIM(kmbelid.dblket) AS dblKET,TRIM(KMBELIH.BLNOPO)  AS BLNOPO , '
               +' KMPOD.DHRGSATUAN ,KMPOD.DHRGSATUAN AS HARGA '
               +' FROM kmbslama.kmbelih,KMBSLAMA.KMBELID left join KMBSLAMA.kmmstbhnbaku on TRIM(kmbelid.dblkdbrg)=TRIM(kmmstbhnbaku.kdbrg) ,KMBSLAMA.KMPOD WHERE TRIM(kmbeliH.blnobukti) = TRIM(kmbeliD.Dblnobukti) AND kmbeliH.BLTGL=:TGL  AND '
               +' KMBELIH.BLNOPO=KMPOD.DNOPO AND KMBELID.DBLKDBRG=KMPOD.DKDBRG ' ;

hero.Params.ParamByName('tgl').Value:=FormatDateTime('yyyy-mm-dd',DTtgl.Date);
hero.ExecSQL;


ShowMessage('BELID');




//transfer retur beli


  hero.SQL.Clear;
  hero.SQL.Add(' INSERT INTO BELI(NO_BUKTI, TGL, KODES, BLKDGDG, NOTES, CURR, RATE, FLAG, PER, TYP, GOL, NAMAS, ALAMAT, KOTA, HMUTASI ) '
              +' SELECT KMRTRBELIH.hnobukti, KMRTRBELIH.htgl, TRIM(KMRTRBELIH.hkdsupp), TRIM(KMRTRBELIH.hkdgdg), TRIM(KMRTRBELIH.hket) as notes, TRIM(KMPOH.POVALUTA) as curr, '
              +' KMPOH.POKURS as rate, ''RB'' as flag, '
              +' CONCAT(lpad(MONTH(KMRTRBELIH.htgl),2,''0''),''/'',year(KMRTRBELIH.htgl)) as per, IF(KMPOH.POVALUTA=''IDR'',''L'',''I'') AS TYP,''A'', TRIM(KMMSTSUPP.NMSUPP) as namas, '
              +' TRIM(KMMSTSUPP.ALSUPP) as alamat, TRIM(KMMSTSUPP.KTSUPP) as kota, KMRTRBELIH.hmutasi as mutasi '
              +' FROM kmbslama.kmrtrbelih LEFT JOIN kmbslama.kmmstsupp ON TRIM(KMRTRBELIH.HKDSUPP) = TRIM(KMMSTSUPP.kdsupp) '
			        +' LEFT JOIN kmbslama.kmrtrbelid ON TRIM(KMRTRBELIH.HNOBUKTI) = TRIM(KMRTRBELID.dnobukti) LEFT JOIN kmbslama.kmpoh ON TRIM(KMRTRBELID.DNOPO) = TRIM(KMPOH.PONO) '
              +' WHERE KMRTRBELIH.htgl = :tgl');
  hero.Params.ParamByName('tgl').Value := FormatDateTime('yyyy-mm-dd',DTtgl.Date);
  hero.ExecSQL;
  ShowMessage('retur beli');

  hero.SQL.Clear;
  hero.SQL.text := ' INSERT INTO BELID(NO_BUKTI, BLTGL, KD_BHN, NA_BHN, QTY, SATUAN, NO_PO, HARGA1, HARGA )'
                  +' SELECT kmrtrbelih.hnobukti, kmrtrbelih.htgl, trim(kmrtrbelid.dkdbrg), trim(kmmstbhnbaku.nmbrg) as nmbrg, kmrtrbelid.dqtyrtrbeli,'
                  +' trim(kmrtrbelid.dsatrtrbeli), trim(kmrtrbelid.dnopo)as dnopo, kmpod.dhrgsatuan, kmpod.dhrgsatuan as harga '
                  +' FROM kmbslama.kmrtrbelih, kmbslama.kmrtrbelid LEFT JOIN kmbslama.kmmstbhnbaku ON TRIM(kmrtrbelid.dkdbrg ) = TRIM(KMMSTBHNBAKU.kdbrg) , kmbslama.kmpod'
                  +' WHERE TRIM(kmrtrbelih.hnobukti) = TRIM(kmrtrbelid.dnobukti) and kmrtrbelih.htgl = :tgl and kmrtrbelid.dnopo = kmpod.dnopo and kmrtrbelid.dkdbrg = kmpod.dkdbrg' ;
  hero.Params.ParamByName('tgl').Value := FormatDateTime('yyyy-mm-dd',DTtgl.Date);
  hero.ExecSQL;

    // QTYPO, DSATPO
    // kmrtrbelid.dqtypo, kmrtrbelid.dsatpo

  ShowMessage('retur belid');






hero.SQL.Clear;
hero.SQL.text:='update BELID,BELI set BELID.PER=BELI.PER,BELID.TYP=BELI.TYP,BELID.GOL=BELI.GOL,BELID.ID=BELI.NO_ID,BELID.FLAG=BELI.FLAG '
              +' BELID.TOTAL=BELID.QTY*BELID.HARGA1*BELI.RATE,BELID.HARGA=BELID.HARGA1*BELI.RATE, BELID.TOTAL1=BELID.QTY*BELID.HARGA1 WHERE TRIM(BELID.NO_BUKTI)=TRIM(BELI.NO_BUKTI) AND BELID.BLTGL=:TGL  ' ;
hero.Params.ParamByName('tgl').Value:=FormatDateTime('yyyy-mm-dd',DTtgl.Date);
hero.ExecSQL;



hero.SQL.Clear;
hero.SQL.text:='update BELIDX,BELI set BELIDX.PER=BELI.PER,BELIDX.TYP=BELI.TYP,BELIDX.GOL=BELI.GOL,BELIDX.ID=BELI.NO_ID, '
              +' BELIDX.TOTAL=BELIDX.QTY*BELIDX.HARGA1*BELI.RATE,BELIDX.HARGA=BELIDX.HARGA1*BELI.RATE, BELIDX.TOTAL1=BELIDX.QTY*BELIDX.HARGA1 WHERE TRIM(BELIDX.NO_BUKTI)=TRIM(BELI.NO_BUKTI) AND BELIDX.BLTGL=:TGL  ' ;
hero.Params.ParamByName('tgl').Value:=FormatDateTime('yyyy-mm-dd',DTtgl.Date);
hero.ExecSQL;


hero.SQL.Clear;
hero.SQL.text:='UPDATE beli,(SELECT BELID.no_bukti , SUM(belid.qty) AS TOTAL_QTY,SUM(belid.total) AS TOTAL,SUM(belid.total1) AS TOTAL1  FROM BELID WHERE BELID.BLTGL=:TGL GROUP BY BELID.NO_BUKTI) AS BL '
                +' SET BELI.total_qty = BL.TOTAL_QTY,BELI.TOTAL=BL.TOTAL,BELI.NETT=BL.TOTAL,BELI.SISA = BL.TOTAL ,BELI.TOTAL1=BL.TOTAL1,BELI.NETT1=BL.TOTAL1,BELI.TOTALBTB=BL.TOTAL1 WHERE BELI.no_bukti = BL.no_bukti AND BELI.TGL=:TGL';
hero.Params.ParamByName('tgl').Value:=FormatDateTime('yyyy-mm-dd',DTtgl.Date);
hero.ExecSQL;



ShowMessage('UPDATE BELI');

hero.sql.clear;
hero.sql.text:='SELECT * FROM BELI WHERE FLAG = ''BL'' AND TGL=:TGL ';
hero.Params.ParamByName('tgl').Value:=FormatDateTime('yyyy-mm-dd',DTtgl.Date);
hero.ExecSQL;


while NOT HERO.EOF do
BEGIN

                  com.SQL.Clear;
                  com.SQL.Add('CALL BELIXINS(:NO_BUKTI)');
                  com.Params.ParamByName('NO_BUKTI').Value:=trim(hero.FieldByName('no_bukti').AsString) ;
                  com.ExecSQL;

HERO.Next;
END;








  {
  dblqtytrm,
  dblsattrm,

  dlpbnobukti,
  dlpbnobaris,
  dblnoaju,
  dblnoinv,
  dblhscode,
  dblnmhscode,
  dblkdbrgpib,
  dblqtypib,
  dblsatpib,
  dblnobaris,
  dblsatsama,
  dblkonversi,
  dblkdfas, }


    // NA_BHN FLAG,PER,NO_PO,QTYPO,GOL,YER,TYP,



end;

procedure Tfrdatapandaan.Button3Click(Sender: TObject);
begin

hero.sql.clear;
hero.sql.text:='DELETE FROM PAKAI WHERE TGL=:TGL ';
hero.Params.ParamByName('tgl').Value:=FormatDateTime('yyyy-mm-dd',DTtgl.Date);
hero.ExecSQL;



 hero.sql.clear;
hero.sql.text:='DELETE FROM PAKAID WHERE DPUTGL=:TGL ';
hero.Params.ParamByName('tgl').Value:=FormatDateTime('yyyy-mm-dd',DTtgl.Date);
hero.ExecSQL;





  HERO.SQL.Clear;
  HERO.SQL.Add('INSERT INTO PAKAID(NO_BUKTI, KD_BHN, NA_BHN, QTY, SATUAN,'
  +' PER, FLAG,DPUNOMP, DPUKDPKJ,'
  +' DPUNOPKJ, DPUSUBPKJ, DPUNOSUBPKJ, DPUQTYOUT, DPUQTYLNS, DPUNOMUTASI,'
  +' DPUNOLUNAS, DPUTGL) SELECT CLDAMBILBRG.DPUNOBUKTI, CLDAMBILBRG.DPUKDBRG, CLDAMBILBRG.DPUNMBRG, CLDAMBILBRG.DPUQTY, CLDAMBILBRG.DPUSATUAN, '
  +' CONCAT(lpad(MONTH(CLHAMBILBRG.hputgl),2,''0''),''/'',year(CLHAMBILBRG.hputgl)) as PER, :FLAG, CLDAMBILBRG.DPUNOMP, '
  +' CLDAMBILBRG.DPUKDPKJ, CLDAMBILBRG.DPUNOPKJ, CLDAMBILBRG.DPUSUBPKJ, CLDAMBILBRG.DPUNOSUBPKJ, CLDAMBILBRG.DPUQTYOUT,CLDAMBILBRG.DPUQTYLNS,CLDAMBILBRG.DPUNOMUTASI, CLDAMBILBRG.DPUNOLUNAS, :TGL '
  +' FROM KMBSLAMA.CLDAMBILBRG, KMBSLAMA.CLHAMBILBRG WHERE CLDAMBILBRG.DPUNOBUKTI = '
  +' CLHAMBILBRG.HPUNOBUKTI AND CLHAMBILBRG.HPUTGL = :TGL  ');

  HERO.Params.ParamByName('FLAG').Value := 'PK';
  HERO.Params.ParamByName('TGL').Value := FormatDateTime('YYYY-MM-DD', dtTgl.Date);
  HERO.ExecSQL;
  ShowMessage('PAKAI DETAIL');

  //PAKAI HEADER

  HERO.SQL.Clear;
  HERO.SQL.Add('INSERT INTO PAKAI(NO_BUKTI, TGL, PER, FLAG, '
  +'  HPUKDGDG, HPUKDTRANS, HPUKDDEPT, HPUKDPKJ)'
  +' SELECT HPUNOBUKTI, HPUTGL, CONCAT(lpad(MONTH(hputgl),2,''0''),''/'',year(hputgl)) as PER,:FLAG,'
  +'  HPUKDGDG,HPUKDTRANS,HPUKDDEPT, HPUKDPKJ FROM KMBSLAMA.CLHAMBILBRG WHERE CLHAMBILBRG.HPUTGL = :TGL GROUP BY HPUNOBUKTI ');

  HERO.Params.ParamByName('FLAG').Value := 'PK';
  HERO.Params.ParamByName('TGL').Value := FormatDateTime('YYYY-MM-DD', dtTgl.Date);
  HERO.ExecSQL;

  ShowMessage('PAKAI HEADER');

  //UPDATE ID
  hero.SQL.Clear;
  hero.SQL.Add('UPDATE pakaid, pakai SET pakaid.ID = pakai.NO_ID '
                +' WHERE pakaid.no_bukti = pakai.no_bukti AND pakai.tgl = :TGL' );
  hero.Params.ParamByName('TGL').Value := FormatDateTime('YYYY-MM-DD', dtTgl.Date);
  hero.ExecSQL;
  ShowMessage('UPDATE ID');

  //UPDATE TOTAL QTY
  hero.SQL.Clear;
  hero.SQL.Add('UPDATE pakai, (SELECT pakaid.no_bukti AS NO_BUKTI, pakaid.dpunomp AS NO_MP, SUM(pakaid.qty) AS TOTAL_QTY FROM PAKAID where dputgl =:tgl  GROUP BY NO_BUKTI) AS PK '
                +' SET pakai.total_qty = PK.TOTAL_QTY WHERE pakai.no_bukti = PK.no_bukti and pakai.tgl=:tgl ');
  hero.Params.ParamByName('TGL').Value := FormatDateTime('YYYY-MM-DD', dtTgl.Date);
  hero.ExecSQL;
 ShowMessage('UPDATE TOTAL_QTY');
end;

procedure Tfrdatapandaan.cxButton1Click(Sender: TObject);
begin
        COM.SQL.Clear;
        COM.SQL.text:='SELECT * from kmbelih where bltgl=:bltgl';
        COM.Params.ParamByName('bltgl').Value := FormatDateTime('YYYY-MM-DD', dtTgl.Date);
        COM.OPEN;

        com.First;
        while not com.eof do
        begin

           hero.SQL.Clear;
           hero.SQL.text:='select blnobukti from kmbelih where blnobukti=:blnobukti';
           hero.Params.ParamByName('blnobukti').Value:=com.FieldByName('blnobukti').Value;
           hero.Open;

          if hero.RecordCount = 0 then
          begin

            hero.SQL.Clear;
            hero.SQL.Text:='insert into kmbelih (blkdsupp, blnosj, bltglsj, blnopo, bltglpo, blnobukti, bltgl, blkdgdg, blket, blkddept, blcetak ) '
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
                      herod.SQL.Text:='insert into kmbelid (dblnobukti, dbltgl, dblkdbrg, dblqtyord, dblsatord, dblqtybl, dblsatbl, dblqtytrm, '
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

         showmessage('KMBELIH');
end;

procedure Tfrdatapandaan.cxButton2Click(Sender: TObject);
var
BUKTIPO : STRING;
begin

BUKTIPO:='';

        COM.SQL.Clear;
        COM.SQL.text:='SELECT * from kmpoh where pono=:pono ';
        COM.Params.ParamByName('PONO').Value := trim(txtpo.text);
        COM.OPEN;



     if com.RecordCount > 0 then
     begin

         BUKTIPO:=TRIM(com.FieldByName('pono').Value);

           hero.SQL.Clear;
           hero.SQL.text:='select pono from kmpoh where pono=:pono';
           hero.Params.ParamByName('pono').Value:=TRIM(BUKTIPO);
           hero.Open;



          if hero.RecordCount = 0 then
          begin

            hero.SQL.Clear;
            hero.SQL.Text:='insert into kmpoh (pono, potgl, pokdsupp, povaluta, pokurs, potop, potglkrm, pobruto, podisc, pojumdisc, poppn,'
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
                    herod.SQL.Text:='insert into kmpod (dnopo, dtglpo, dkdsupp, dkdbrg, dsatbeli, dsatpakai, dqty, dhrgsatuan, ddisc1, ddisc2, dsubtot, dqtytrm, dtgltrm,'
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
                    com.SQL.text:='SELECT KMPOH.PONO, KMBELIH.* FROM KMPOH, KMBELIH WHERE TRIM(KMPOH.PONO)=TRIM(KMBELIH.BLNOPO) AND TRIM(KMPOH.PONO)=:PONO';
                    com.Params.ParamByName('pono').Value:=TRIM(BUKTIPO);
                    com.OPEN;



                    com.First;
                    while not com.eof do
                    begin

                                   hero.SQL.Clear;
                                   hero.SQL.text:='select blnopo from kmbelih where blnobukti=:blnobukti';
                                   hero.Params.ParamByName('blnobukti').Value:=com.FieldByName('blnobukti').Value;
                                   hero.Open;



                                  if hero.RecordCount = 0 then
                                  begin

                                    hero.SQL.Clear;
                                    hero.SQL.Text:='insert into kmbelih (blkdsupp, blnosj, bltglsj, blnopo, bltglpo, blnobukti, bltgl, blkdgdg, blket, blkddept, blcetak ) '
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
                                          herod.SQL.Text:='insert into kmbelid (dblnobukti, dbltgl, dblkdbrg, dblqtyord, dblsatord, dblqtybl, dblsatbl, dblqtytrm, '
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

        end;

    end;
end;


procedure Tfrdatapandaan.cxButton4Click(Sender: TObject);
begin
        COM.SQL.Clear;
        COM.SQL.text:='SELECT * from clhambilbrg where hputgl=:hputgl';
        COM.Params.ParamByName('hputgl').Value := FormatDateTime('YYYY-MM-DD', dtTgl.Date);
        COM.OPEN;

        com.First;
        while not com.eof do
        begin

           hero.SQL.Clear;
           hero.SQL.text:='select hpunobukti,hpunomp from clhambilbrg where hpunobukti=:hpunobukti and hpunomp=:hpunomp ';
           hero.Params.ParamByName('hpunobukti').Value:=com.FieldByName('hpunobukti').Value;
           hero.Params.ParamByName('hpunomp').Value:=com.FieldByName('hpunomp').Value;
           hero.Open;

          if hero.RecordCount = 0 then
          begin

            hero.SQL.Clear;
            hero.SQL.Text:='insert into clhambilbrg (hpunobukti, hpukdgdg, hpukdtrans, hputgl, hpukddept, hpunomp, hpukdpkj, access, komp, userby ) '
                          +' values ( :hpunobukti, :hpukdgdg, :hpukdtrans, :hputgl, :hpukddept, :hpunomp, :hpukdpkj, :access, :komp, :userby) ';

            hero.Params.ParamByName('hpunobukti').Value:=com.FieldByName('hpunobukti').value;
            hero.Params.ParamByName('hpukdgdg').Value:=com.FieldByName('hpukdgdg').value;
            hero.Params.ParamByName('hpukdtrans').Value:=com.FieldByName('hpukdtrans').value;
            hero.Params.ParamByName('hputgl').Value:=FormatDateTime('yyyy-mm-dd',com.FieldByName('hputgl').AsDateTime);
            hero.Params.ParamByName('hpukddept').Value:=com.FieldByName('hpukddept').value;
            hero.Params.ParamByName('hpunomp').Value:=com.FieldByName('hpunomp').value;
            hero.Params.ParamByName('hpukdpkj').Value:=com.FieldByName('hpukdpkj').value;
            hero.Params.ParamByName('access').Value:=com.FieldByName('access').value;
            hero.Params.ParamByName('komp').Value:=com.FieldByName('komp').value;
            hero.Params.ParamByName('userby').Value:=com.FieldByName('userby').value;
            hero.ExecSQL;



                     comd.SQL.Clear;
                     comd.SQL.text:='select * from cldambilbrg where dpunobukti=:dpunobukti and dpunomp=:dpunomp order by dpunobukti ';
                     comd.Params.ParamByName('dpunobukti').Value:=com.FieldByName('hpunobukti').Value;
                     comd.Params.ParamByName('dpunomp').Value:=com.FieldByName('hpunomp').Value;
                     comd.Open;

                  comd.First;
                  while not comd.eof do
                  begin


                      herod.SQL.Clear;
                      herod.SQL.Text:='insert into cldambilbrg (dpunobukti, dpunomp, dpukdpkj, dpunopkj, dpusubpkj, dpunosubpkj, dpukdbrg, dpunmbrg, dpuqty,'
                                    +' dpusatuan, dpuqtyout, dpuqtylns, dpunomutasi, dpunolunas, dpucetak, access, komp, userby ) '
                                    +' values ( :dpunobukti, :dpunomp, :dpukdpkj, :dpunopkj, :dpusubpkj, :dpunosubpkj, :dpukdbrg, :dpunmbrg, :dpuqty, :dpusatuan,'
                                    +' :dpuqtyout, :dpuqtylns, :dpunomutasi, :dpunolunas, :dpucetak, :access, :komp, :userby) ';

                      herod.Params.ParamByName('dpunobukti').Value:=comd.FieldByName('dpunobukti').value;
                      herod.Params.ParamByName('dpunomp').Value:=comd.FieldByName('dpunomp').value;
                      herod.Params.ParamByName('dpukdpkj').Value:=comd.FieldByName('dpukdpkj').value;
                      herod.Params.ParamByName('dpunopkj').Value:=comd.FieldByName('dpunopkj').value;
                      herod.Params.ParamByName('dpusubpkj').Value:=comd.FieldByName('dpusubpkj').value;
                      herod.Params.ParamByName('dpunosubpkj').Value:=comd.FieldByName('dpunosubpkj').value;
                      herod.Params.ParamByName('dpukdbrg').Value:=comd.FieldByName('dpukdbrg').value;
                      herod.Params.ParamByName('dpunmbrg').Value:=comd.FieldByName('dpunmbrg').value;
                      herod.Params.ParamByName('dpuqty').Value:=comd.FieldByName('dpuqty').value;
                      herod.Params.ParamByName('dpusatuan').Value:=comd.FieldByName('dpusatuan').value;
                      herod.Params.ParamByName('dpuqtyout').Value:=comd.FieldByName('dpuqtyout').value;
                      herod.Params.ParamByName('dpunomutasi').Value:=comd.FieldByName('dpunomutasi').value;
                      herod.Params.ParamByName('dpunolunas').Value:=comd.FieldByName('dpunolunas').value;
                      herod.Params.ParamByName('dpucetak').Value:=comd.FieldByName('dpucetak').value;
                      herod.Params.ParamByName('access').Value:=comd.FieldByName('access').value;
                      herod.Params.ParamByName('komp').Value:=comd.FieldByName('komp').value;
                      herod.Params.ParamByName('userby').Value:=comd.FieldByName('userby').value;
                      herod.ExecSQL;



                   comd.Next;
                   end;





           end;

         com.Next;
         end;

         showmessage('clhambilbrg');
end;

procedure Tfrdatapandaan.cxButton5Click(Sender: TObject);
begin
        COM.SQL.Clear;
        COM.SQL.text:='SELECT * from kmrtrbelih where htgl=:htgl';
        COM.Params.ParamByName('htgl').Value := FormatDateTime('YYYY-MM-DD', dtTgl.Date);
        COM.OPEN;

        com.First;
        while not com.eof do
        begin

           hero.SQL.Clear;
           hero.SQL.text:='select hnobukti from kmrtrbelih where hnobukti=:hnobukti ';
           hero.Params.ParamByName('hnobukti').Value:=com.FieldByName('hnobukti').Value;
           hero.Open;

          if hero.RecordCount = 0 then
          begin

            hero.SQL.Clear;
            hero.SQL.Text:='insert into kmrtrbelih (hnobukti, htgl, hkdsupp, hkdgdg, hmutasi, hket, hcetak ) '
                          +' values ( :hnobukti, :htgl, :hkdsupp, :hkdgdg, :hmutasi, :hket, :hcetak) ';

            hero.Params.ParamByName('hnobukti').Value:=com.FieldByName('hnobukti').value;
            hero.Params.ParamByName('htgl').Value:=FormatDateTime('yyyy-mm-dd',com.FieldByName('htgl').AsDateTime);
            hero.Params.ParamByName('hkdsupp').Value:=com.FieldByName('hkdsupp').value;
            hero.Params.ParamByName('hkdgdg').Value:=com.FieldByName('hkdgdg').value;
            hero.Params.ParamByName('hmutasi').Value:=com.FieldByName('hmutasi').value;
            hero.Params.ParamByName('hket').Value:=com.FieldByName('hket').value;
            hero.Params.ParamByName('hcetak').Value:=com.FieldByName('hcetak').value;
            hero.ExecSQL;








                COMd.SQL.Clear;
                COMd.SQL.text:='SELECT * from kmrtrbelid where dnobukti=:dnobukti order by dnobukti';
                comd.Params.ParamByName('dnobukti').Value:=com.FieldByName('hnobukti').Value;
                COMd.OPEN;

                comd.First;
                while not comd.eof do
                begin


                    herod.SQL.Clear;
                    herod.SQL.Text:='insert into kmrtrbelid (dnobukti, dtgl, dkdbrg, dmutasi, dqty, dsatuan, dnopo, dtglpo, dqtypo, dsatpo, dqtyrtrbeli, dsatrtrbeli, access, komp, userby ) '
                                  +' values ( :dnobukti, :dtgl, :dkdbrg, :dmutasi, :dqty, :dsatuan, :dnopo, :dtglpo, :dqtypo, :dsatpo, :dqtyrtrbeli, :dsatrtrbeli, :access, :komp, :userby) ';

                    herod.Params.ParamByName('dnobukti').Value:=comd.FieldByName('dnobukti').value;
                    herod.Params.ParamByName('dtgl').Value:=FormatDateTime('yyyy-mm-dd',comd.FieldByName('dtgl').AsDateTime);
                    herod.Params.ParamByName('dkdbrg').Value:=comd.FieldByName('dkdbrg').value;
                    herod.Params.ParamByName('dmutasi').Value:=comd.FieldByName('dmutasi').value;
                    herod.Params.ParamByName('dqty').Value:=comd.FieldByName('dqty').value;
                    herod.Params.ParamByName('dsatuan').Value:=comd.FieldByName('dsatuan').value;
                    herod.Params.ParamByName('dnopo').Value:=comd.FieldByName('dnopo').value;
                    herod.Params.ParamByName('dtglpo').Value:=FormatDateTime('yyyy-mm-dd',comd.FieldByName('dtglpo').AsDateTime);
                    herod.Params.ParamByName('dqtypo').Value:=comd.FieldByName('dqtypo').value;
                    herod.Params.ParamByName('dsatpo').Value:=comd.FieldByName('dsatpo').value;
                    herod.Params.ParamByName('dqtyrtrbeli').Value:=comd.FieldByName('dqtyrtrbeli').value;
                    herod.Params.ParamByName('dsatrtrbeli').Value:=comd.FieldByName('dsatrtrbeli').value;
                    herod.Params.ParamByName('access').Value:=comd.FieldByName('access').value;
                    herod.Params.ParamByName('komp').Value:=comd.FieldByName('komp').value;
                    herod.Params.ParamByName('userby').Value:=comd.FieldByName('userby').value;
                    herod.ExecSQL;



                 comd.Next;
                 end;


           end;

         com.Next;
         end;

         showmessage('KMRTRBELIH');
end;

procedure Tfrdatapandaan.cxButton6Click(Sender: TObject);
begin

         showmessage('KMRTRBELID');
end;

procedure Tfrdatapandaan.KMPODClick(Sender: TObject);
begin

        COM.SQL.Clear;
        COM.SQL.text:='SELECT * from kmpod where dtglpo=:dtglpo ';
        COM.Params.ParamByName('dTGLpo').Value := FormatDateTime('YYYY-MM-DD', dtTgl.Date);
        COM.OPEN;

        com.First;
        while not com.eof do
        begin

           hero.SQL.Clear;
           hero.SQL.text:='select dnopo from kmpod where dnopo=:dnopo and dkdbrg=:dkdbrg';
           hero.Params.ParamByName('dnopo').Value:=com.FieldByName('dnopo').Value;
           hero.Params.ParamByName('dkdbrg').Value:=com.FieldByName('dkdbrg').Value;
           hero.Open;

          if hero.RecordCount = 0 then
          begin

            hero.SQL.Clear;
            hero.SQL.Text:='insert into kmpod (dnopo, dtglpo, dkdsupp, dkdbrg, dsatbeli, dsatpakai, dqty, dhrgsatuan, ddisc1, ddisc2, dsubtot, dqtytrm, dtgltrm,'
                          +' access, komp, userby, postatus1, ketstatus1, access1, komp1, userby1, postatus2, ketstatus2, access2, komp2, userby2, postatus3, ketstatus3,'
                          +' access3, komp3, userby3, aestdate, afixdate, afixqty, aaccess, akomp, auserby ) '
                          +' values ( :dnopo, :dtglpo, :dkdsupp, :dkdbrg, :dsatbeli, :dsatpakai, :dqty, :dhrgsatuan, :ddisc1, :ddisc2, :dsubtot, :dqtytrm, :dtgltrm, :access,'
                          +' :komp, :userby, :postatus1, :ketstatus1, :access1, :komp1, :userby1, :postatus2, :ketstatus2, :access2, :komp2, :userby2, :postatus3, :ketstatus3,'
                          +' :access3, :komp3, :userby3, :aestdate, :afixdate, :afixqty, :aaccess, :akomp, :auserby) ';

            hero.Params.ParamByName('dnopo').Value:=com.FieldByName('dnopo').value;
            hero.Params.ParamByName('dtglpo').Value:=FormatDateTime('yyyy-mm-dd',com.FieldByName('dtglpo').AsDateTime);
            hero.Params.ParamByName('dkdsupp').Value:=com.FieldByName('dkdsupp').value;
            hero.Params.ParamByName('dkdbrg').Value:=com.FieldByName('dkdbrg').value;
            hero.Params.ParamByName('dsatbeli').Value:=com.FieldByName('dsatbeli').value;
            hero.Params.ParamByName('dsatpakai').Value:=com.FieldByName('dsatpakai').value;
            hero.Params.ParamByName('dqty').Value:=com.FieldByName('dqty').value;
            hero.Params.ParamByName('dhrgsatuan').Value:=com.FieldByName('dhrgsatuan').value;
            hero.Params.ParamByName('ddisc1').Value:=com.FieldByName('ddisc1').value;
            hero.Params.ParamByName('ddisc2').Value:=com.FieldByName('ddisc2').value;
            hero.Params.ParamByName('dsubtot').Value:=com.FieldByName('dsubtot').value;
            hero.Params.ParamByName('dqtytrm').Value:=com.FieldByName('dqtytrm').value;
            hero.Params.ParamByName('dtgltrm').Value:=FormatDateTime('yyyy-mm-dd',com.FieldByName('dtgltrm').AsDateTime);
            hero.Params.ParamByName('access').Value:=com.FieldByName('access').value;
            hero.Params.ParamByName('komp').Value:=com.FieldByName('komp').value;
            hero.Params.ParamByName('userby').Value:=com.FieldByName('userby').value;
            hero.Params.ParamByName('postatus1').Value:=com.FieldByName('postatus1').value;
            hero.Params.ParamByName('ketstatus1').Value:=com.FieldByName('ketstatus1').value;
            hero.Params.ParamByName('access1').Value:=com.FieldByName('access1').value;
            hero.Params.ParamByName('komp1').Value:=com.FieldByName('komp1').value;
            hero.Params.ParamByName('userby1').Value:=com.FieldByName('userby1').value;
            hero.Params.ParamByName('postatus2').Value:=com.FieldByName('postatus2').value;
            hero.Params.ParamByName('ketstatus2').Value:=com.FieldByName('ketstatus2').value;
            hero.Params.ParamByName('access2').Value:=com.FieldByName('access2').value;
            hero.Params.ParamByName('komp2').Value:=com.FieldByName('komp2').value;
            hero.Params.ParamByName('userby2').Value:=com.FieldByName('userby2').value;
            hero.Params.ParamByName('postatus3').Value:=com.FieldByName('postatus3').value;
            hero.Params.ParamByName('ketstatus3').Value:=com.FieldByName('ketstatus3').value;
            hero.Params.ParamByName('access3').Value:=com.FieldByName('access3').value;
            hero.Params.ParamByName('komp3').Value:=com.FieldByName('komp3').value;
            hero.Params.ParamByName('userby3').Value:=com.FieldByName('userby3').value;
            hero.Params.ParamByName('aestdate').Value:=FormatDateTime('yyyy-mm-dd',com.FieldByName('aestdate').AsDateTime);
            hero.Params.ParamByName('afixdate').Value:=FormatDateTime('yyyy-mm-dd',com.FieldByName('afixdate').AsDateTime);
            hero.Params.ParamByName('afixqty').Value:=com.FieldByName('afixqty').value;
            hero.Params.ParamByName('aaccess').Value:=com.FieldByName('aaccess').value;
            hero.Params.ParamByName('akomp').Value:=com.FieldByName('akomp').value;
            hero.Params.ParamByName('auserby').Value:=com.FieldByName('auserby').value;
            hero.ExecSQL;

           end;

         com.Next;
         end;

         showmessage('KMPOD');
end;

procedure Tfrdatapandaan.FormShow(Sender: TObject);
begin
    dttgl.Date:=now();
end;

procedure Tfrdatapandaan.KMPOHClick(Sender: TObject);
begin

        COM.SQL.Clear;
        COM.SQL.text:='SELECT * from kmpoh where potgl=:potgl ';
        COM.Params.ParamByName('POTGL').Value := FormatDateTime('YYYY-MM-DD', dtTgl.Date);
        COM.OPEN;

        com.First;
        while not com.eof do
        begin

           hero.SQL.Clear;
           hero.SQL.text:='select pono from kmpoh where pono=:pono';
           hero.Params.ParamByName('pono').Value:=com.FieldByName('pono').Value;
           hero.Open;

          if hero.RecordCount = 0 then
          begin

            hero.SQL.Clear;
            hero.SQL.Text:='insert into kmpoh (pono, potgl, pokdsupp, povaluta, pokurs, potop, potglkrm, pobruto, podisc, pojumdisc, poppn,'
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
                    herod.SQL.Text:='insert into kmpod (dnopo, dtglpo, dkdsupp, dkdbrg, dsatbeli, dsatpakai, dqty, dhrgsatuan, ddisc1, ddisc2, dsubtot, dqtytrm, dtgltrm,'
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

           end;

         com.Next;
         end;

         showmessage('PO SELESAI');

end;

end.
