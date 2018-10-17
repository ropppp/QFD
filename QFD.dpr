program QFD;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uTextoConcorrente in 'uTextoConcorrente.pas' {frmConcorrente},
  uRelacao in 'uRelacao.pas' {frmRelacao},
  uTexto in 'uTexto.pas' {frmTextoProj},
  uValorAux in 'uValorAux.pas' {frmValorAux},
  uTexto2 in 'uTexto2.pas' {frmTextoClie},
  uValorCli in 'uValorCli.pas' {frmValorCli},
  uClasses in 'uClasses.pas',
  uMetas in 'uMetas.pas' {frmMetas},
  uTipoRelacao in 'uTipoRelacao.pas' {frmTipoRelacao},
  uValorConco in 'uValorConco.pas' {frmValorConco},
  uMedidas in 'uMedidas.pas' {frmMedidas},
  uHelp in 'uHelp.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'QFD App';
  TStyleManager.TrySetStyle('Carbon');
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmConcorrente, frmConcorrente);
  Application.CreateForm(TfrmRelacao, frmRelacao);
  Application.CreateForm(TfrmTextoProj, frmTextoProj);
  Application.CreateForm(TfrmValorAux, frmValorAux);
  Application.CreateForm(TfrmTextoClie, frmTextoClie);
  Application.CreateForm(TfrmValorCli, frmValorCli);
  Application.CreateForm(TfrmMetas, frmMetas);
  Application.CreateForm(TfrmTipoRelacao, frmTipoRelacao);
  Application.CreateForm(TfrmValorConco, frmValorConco);
  Application.CreateForm(TfrmMedidas, frmMedidas);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
