program clientdpr;

uses
  Forms,
  client in 'client.pas' {Form1},
  registration in 'registration.pas' {Form2},
  Chat in 'Chat.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
