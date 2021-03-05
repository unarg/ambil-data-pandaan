unit frmsupF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, MemDS, DBAccess, MyAccess, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid;

type
  TFrsupF = class(TForm)
    DataSource1: TDataSource;
    sup: TMyQuery;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1kodes: TcxGridDBColumn;
    cxGrid1DBTableView1namas: TcxGridDBColumn;
    cxGrid1DBTableView1alamat: TcxGridDBColumn;
    cxGrid1DBTableView1kota: TcxGridDBColumn;
    DataSource2: TDataSource;
    sup2: TMyQuery;
    sup3: TMyQuery;
    DataSource3: TDataSource;
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

    function getkode:String;
    function getnama:String;
    function getalamat:String;
    function getkota:String;
    function ukode:String;
    function unama:String;
    function ualamat:String;
    function ukota:String;
    function rkode:String;
    function rnama:String;
    function ralamat:String;
    function rkota:String;

  end;

var
  FrsupF: TFrsupF;
  //sup : TZQuery;
implementation
uses frmimportp;
{$R *.dfm}


procedure TFrsupF.cxGrid1DBTableView1DblClick(Sender: TObject);
begin

      Self.Close;

end;

procedure TFrsupF.cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=13 then
   begin

      Key:=0;
      Self.Close;
   end;
end;

procedure TFrsupF.FormShow(Sender: TObject);
begin
  if hint='po' then
  begin
    cxGrid1DBTableView1.DataController.DataSource := DataSource1;
    sup.Active:=true;
  end
  else if hint='ulang' then
  begin
    cxGrid1DBTableView1.DataController.DataSource := DataSource2;
    sup2.Active:=true;
  end
  else if hint='retur' then
  begin
    cxGrid1DBTableView1.DataController.DataSource := DataSource3;
    sup3.Active:=true;
  end;
end;

function TFrsupF.getkode:String;
begin
  result:=DataSource1.DataSet.FieldByName('kodes').AsString;
end;

function TFrsupF.getnama:String;
begin
  result:=DataSource1.DataSet.FieldByName('namas').AsString;
end;

function TFrsupF.getalamat:String;
begin
  result:=DataSource1.DataSet.FieldByName('alamat').AsString;
end;

function TFrsupF.getkota:String;
begin
  result:=DataSource1.DataSet.FieldByName('kota').AsString;
end;

function TFrsupF.ukode:String;
begin
  result:=DataSource2.DataSet.FieldByName('kodes').AsString;
end;

function TFrsupF.unama:String;
begin
  result:=DataSource2.DataSet.FieldByName('namas').AsString;
end;

function TFrsupF.ualamat:String;
begin
  result:=DataSource2.DataSet.FieldByName('alamat').AsString;
end;

function TFrsupF.ukota:String;
begin
  result:=DataSource2.DataSet.FieldByName('kota').AsString;
end;

function TFrsupF.rkode:String;
begin
  result:=DataSource3.DataSet.FieldByName('kodes').AsString;
end;

function TFrsupF.rnama:String;
begin
  result:=DataSource3.DataSet.FieldByName('namas').AsString;
end;

function TFrsupF.ralamat:String;
begin
  result:=DataSource3.DataSet.FieldByName('alamat').AsString;
end;

function TFrsupF.rkota:String;
begin
  result:=DataSource3.DataSet.FieldByName('kota').AsString;
end;


end.
