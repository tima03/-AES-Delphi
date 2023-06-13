unit Chat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmCHAT = class(TForm)
    mainCHAT: TMemo;
    btnSENDMSG: TButton;
    cbbFRIENDS: TComboBox;
    edtSEARCH: TEdit;
    btnSEARCH: TButton;
    edtENRMSG: TEdit;
    procedure btnSEARCHClick(Sender: TObject);
    procedure btnSENDMSGClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtENRMSGKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCHAT: TfrmCHAT;

implementation

uses client;

{$R *.dfm}

procedure TfrmCHAT.btnSEARCHClick(Sender: TObject);
begin
  frmMAIN.ClientSocket.Active := True;
  mes := '_SRCH ' + edtSEARCH.Text;
  frmMAIN.SENDTMR.Enabled := True;
end;

procedure TfrmCHAT.btnSENDMSGClick(Sender: TObject);
begin
  frmMAIN.ClientSocket.Active := True;
  frmCHAT.mainCHAT.Lines.Add('>> Your message: ' + edtENRMSG.Text);
  mes := '_GETKEYFR ' + frmCHAT.cbbFRIENDS.Text + ' ' + IntToStr(myid);
  frmMAIN.SENDTMR.Enabled := True;
end;

procedure TfrmCHAT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
  frmMAIN.Close;
end;

procedure TfrmCHAT.edtENRMSGKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    frmMAIN.ClientSocket.Active := True;
    frmCHAT.mainCHAT.Lines.Add('>> Your message: ' + edtENRMSG.Text);
    mes := '_GETKEYFR ' + frmCHAT.cbbFRIENDS.Text + ' ' + IntToStr(myid);
    frmMAIN.SENDTMR.Enabled := True;
  end;
end;
end.

