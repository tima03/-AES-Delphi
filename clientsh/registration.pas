unit registration;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmREG = class(TForm)
    lblLOG: TLabel;
    btnREG: TButton;
    edtNAMEREG: TEdit;
    edtPASREG: TEdit;
    edtMAILREG: TEdit;
    lblREG: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure lblLOGClick(Sender: TObject);
    procedure btnREGClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmREG: TfrmREG;

implementation

uses client;

{$R *.dfm}

procedure TfrmREG.FormCreate(Sender: TObject);
begin
  frmREG.Visible := False;
end;

procedure TfrmREG.lblLOGClick(Sender: TObject);
begin
  frmREG.visible := False;
  frmMAIN.Visible := True;
end;

procedure TfrmREG.btnREGClick(Sender: TObject);
begin
  frmMAIN.ClientSocket.Active := True;
  mes := '_REG ' + edtNAMEREG.Text + ' ' + edtPASREG.Text + ' ' +
    edtMAILREG.Text;
  frmMAIN.SENDTMR.Enabled := True;
end;

procedure TfrmREG.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
  frmMAIN.Close;
end;

end.

