unit Chat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm3 = class(TForm)
    mainCHAT: TMemo;
    btnSENDMSG: TButton;
    cbbFRIENDS: TComboBox;
    edtSEARCH: TEdit;
    btnSEARCH: TButton;
    edtENRMSG: TEdit;
    procedure btnSEARCHClick(Sender: TObject);
    procedure btnSENDMSGClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses client;

{$R *.dfm}

procedure TForm3.btnSEARCHClick(Sender: TObject);
begin
Form1.ClientSocket.Active:=True;
mes:='_SRCH '+edtSEARCH.Text;
Form1.SENDTMR.Enabled:=True;
end;


procedure TForm3.btnSENDMSGClick(Sender: TObject);
begin
Form1.ClientSocket.Active:=True;
Form3.mainCHAT.Lines.Add('>> '+edtENRMSG.Text);
mes:='_GETKEY '+IntToStr(myid)+' '+Form3.cbbFRIENDS.Text;
Form1.SENDTMR.Enabled:=True;
end;

end.
