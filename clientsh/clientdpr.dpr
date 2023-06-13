program clientdpr;

uses
  Forms,
  client in 'client.pas' {frmMAIN},
  registration in 'registration.pas' {frmREG},
  Chat in 'Chat.pas' {frmCHAT};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMAIN, frmMAIN);
  Application.CreateForm(TfrmREG, frmREG);
  Application.CreateForm(TfrmCHAT, frmCHAT);
  Application.Run;
end.
