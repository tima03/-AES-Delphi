unit registration;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm2 = class(TForm)
    log: TLabel;
    btnREG: TButton;
    edtNAMEREG: TEdit;
    edtPASREG: TEdit;
    edtMAILREG: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure logClick(Sender: TObject);
    procedure btnREGClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses client;

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
begin
Form2.Visible:=False;
end;

procedure TForm2.logClick(Sender: TObject);
begin
Form2.visible:=False;
Form1.Visible:=True;
end;

procedure TForm2.btnREGClick(Sender: TObject);
begin
Form1.ClientSocket.Active:=True;
mes:='_REG '+edtNAMEREG.Text+' '+edtPASREG.Text+' '+edtMAILREG.Text;
Form1.SENDTMR.Enabled:=True;
end;

end.
