program infosistemas;

uses
  Forms,
  ufrmCadCliente in 'ufrmCadCliente.pas' {frmCadCliente},
  uRequisicao in 'uRequisicao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCadCliente, frmCadCliente);
  Application.Run;
end.
