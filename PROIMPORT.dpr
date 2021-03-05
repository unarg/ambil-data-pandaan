program PROIMPORT;

uses
  Vcl.Forms,
  frmimportP in 'frmimportP.pas' {frimportp},
  frmsupF in 'frmsupF.pas' {FrsupF};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrimportp, frimportp);
  Application.CreateForm(TFrsupF, FrsupF);
  Application.Run;
end.
