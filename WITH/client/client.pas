unit client;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ScktComp, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    ClientSocket: TClientSocket;
    btnLOG: TButton;
    edtNAMELOG: TEdit;
    edtPASLOG: TEdit;
    SENDTMR: TTimer;
    registr: TLabel;
    procedure btnLOGClick(Sender: TObject);
    procedure SENDTMRTimer(Sender: TObject);
    procedure registrClick(Sender: TObject);
    procedure ClientSocketRead(Sender: TObject; Socket: TCustomWinSocket);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  mes, GETTEXT, OPERATION: string;
  myID: integer;
  firstpr, secpr, resultpr, fr, Kp, Ks, l: Longword;
  m, zahmsg: string;

implementation

uses registration, Chat;

{$R *.dfm}

function power(m, n: integer): Int64;
var
  s: Int64;
  i: Integer;
begin
  s := 1;
  for i := 1 to n do
    s := s * m;
  power := s
end;

procedure SEND(s: string);
begin
  Form1.ClientSocket.Socket.SendText(s);
end;

procedure TForm1.btnLOGClick(Sender: TObject);
begin
  ClientSocket.Active := True;
  mes := '_LOG ' + edtNAMELOG.Text + ' ' + edtPASLOG.Text;
  SENDTMR.Enabled := True;
end;

procedure TForm1.SENDTMRTimer(Sender: TObject);
begin
  SEND(mes);
  SENDTMR.Enabled := false;
end;

procedure TForm1.registrClick(Sender: TObject);
begin
  Form2.visible := True;
  Form1.Visible := False;
end;

procedure TForm1.ClientSocketRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  item: string;
  i, x, code: Integer;
  Ks2, resultpr2: LongWord;
  j:Int64;
  isalredy: Boolean;
  OP, temp: string;
begin
  GETTEXT := Socket.ReceiveText();
  OPERATION := Copy(GETTEXT, 1, pos(' ', GETTEXT) - 1);
  op := OPERATION;
  Delete(GETTEXT, 1, pos(' ', GETTEXT));
  if OPERATION = '_ERR' then
    ShowMessage(GETTEXT)
  else if OPERATION = '_LOGIN' then
  begin
    myID := StrToInt(GETTEXT);
    Form3.Visible := True;
    Form2.Visible := False;
    Form1.Visible := False;
  end
  else if OPERATION = '_FOUNDUSR' then
  begin
    isalredy := true;
    for i := 0 to Form3.cbbFRIENDS.Items.Count do
    begin
      item := Form3.cbbFRIENDS.Items[i];
      if GETTEXT = item then
        isalredy := false;
    end;
    if isalredy then
      Form3.cbbFRIENDS.Items.Add(GETTEXT);
  end
  else if OPERATION = '_MSGGET' then
  begin
    m := GETTEXT;
    temp := '';
    while length(m) <> 0 do
    begin
      val(copy(m, 1, pos(' ', m) - 1), x, code);
      delete(m, 1, pos(' ', m));
      if code = 0 then
      begin
        x := power(x, Kp) mod resultpr;
        temp := temp + chr(x);
      end;
    end;
    form3.mainCHAT.Lines.Add('>> ' + temp);
  end
  else if OPERATION = '_GETKEY' then
  begin
    firstpr := 3;
    secpr := 11;
    resultpr := firstpr * secpr;
    fr := (firstpr - 1) * (secpr - 1);
    Ks := 7;
    Kp := 1;
    repeat Kp := Kp + 1
    until (Kp * Ks) mod ((firstpr - 1) * (secpr - 1)) = 1;
    mes := '_POSTKEY ' + GETTEXT + ' ' + IntToStr(Ks) + ' ' + IntToStr(resultpr)
      + ' ' + IntToStr(myid);
    Form1.SENDTMR.Enabled := True;
  end
  else if OPERATION = '_POSTKEY' then
  begin
    zahmsg:='';
    Ks2 := StrToInt(Copy(GETTEXT, 1, Pos(' ', GETTEXT) - 1));
    Delete(GETTEXT, 1, Pos(' ', GETTEXT));
    resultpr2 := StrToInt(Copy(GETTEXT, 1, Pos(' ', GETTEXT) - 1));
    Delete(GETTEXT, 1, Pos(' ', GETTEXT));
    m := Form3.edtENRMSG.Text + ' ';
    for i := 1 to Length(m) do
    begin
      j := Ord(m[i]);
      zahmsg := zahmsg +  IntToStr(power(j, Ks2) mod resultpr2)+' ';
    end;
    mes := '_MSGPOST ' + Form3.cbbFRIENDS.Text + ' ' + zahmsg;
    Form1.SENDTMR.Enabled := True;
  end
  else
    ShowMessage('Unknown error');
end;

end.

