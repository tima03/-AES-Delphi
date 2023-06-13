program server;

uses
  Forms,
  main in 'main.pas' {frmSERV};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmSERV, frmSERV);
  Application.Run;
end.
