unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBTables, StdCtrls, ScktComp, DBClient;

type
  TfrmSERV = class(TForm)
    DBGrid: TDBGrid;
    mmoLOG: TMemo;
    SERVstart: TButton;
    SERVstop: TButton;
    ServerSocket: TServerSocket;
    btnCLR: TButton;
    DataSource: TDataSource;
    DataSet: TClientDataSet;
    procedure SERVstartClick(Sender: TObject);
    procedure SERVstopClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ServerSocketClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocketClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure btnCLRClick(Sender: TObject);
    procedure ServerSocketClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSERV: TfrmSERV;

  USERID: integer;
  REMADR: string;
implementation

{$R *.dfm}

procedure SENDTODEFCLIENT(ADRESS: string; SOMEMSG: string);
var
  j: integer;
begin
  for j := 0 to frmSERV.ServerSocket.Socket.ActiveConnections - 1 do
    if frmSERV.ServerSocket.Socket.Connections[j].RemoteAddress = ADRESS then
    begin
      frmSERV.mmoLOG.lines.add('>>' + ADRESS + ' ' + SOMEMSG);
      frmSERV.ServerSocket.Socket.Connections[j].SendText(SOMEMSG);
    end;
end;

procedure TfrmSERV.SERVstartClick(Sender: TObject);
begin
  ServerSocket.Open;
  mmoLOG.Lines.Insert(0, '>> Server START');
  SERVstart.Visible := false;
  SERVstop.Visible := True;
end;

procedure TfrmSERV.SERVstopClick(Sender: TObject);
begin
  ServerSocket.Active := False;
  mmoLOG.Lines.Insert(0, '>> Server STOP');
  SERVstart.Visible := True;
  SERVstop.Visible := False;
end;

procedure TfrmSERV.FormCreate(Sender: TObject);
var
  i: integer;
  path1: string;
begin
  DataSet.FieldDefs.Clear;
  {
  DataSet.FieldDefs.Add('ID', ftString, 20, False);
  DataSet.FieldDefs.Add('NAME', ftString, 20, False);
  DataSet.FieldDefs.Add('PASS', ftString, 20, False);
  DataSet.FieldDefs.Add('MAIL', ftString, 20, False);
  DataSet.FieldDefs.Add('ADR', ftString, 20, False);
  DataSet.CreateDataSet();
  DataSet.SaveToFile('db.xml');  }
  GetDir(0, path1);
  DataSet.FileName := path1 + '\db.xml';
  DataSet.Active := True;
  SERVstart.Visible := True;
  SERVstop.Visible := False;
  ServerSocket.Port := 6000;
  ServerSocket.Active := False;
  if DBGrid.DataSource.DataSet.RecordCount <> 0 then
  begin
    DBGrid.DataSource.DataSet.Last;
    USERID := dbgrid.Fields[0].AsInteger;
  end
  else
    USERID := 0;
end;

procedure TfrmSERV.ServerSocketClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  mmoLOG.Lines.Insert(0, '>> Client connected');
  REMADR := Socket.RemoteAddress;
end;

procedure TfrmSERV.ServerSocketClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  OPERATION, Name, Password, Mail, GETTEXT, GETADR, tempADR, tempID, tempNAME:
    string;
begin
  REMADR := Socket.RemoteAddress;
  GETTEXT := Socket.ReceiveText();
  mmoLOG.Lines.Insert(0, '>> ' + GETTEXT);
  OPERATION := Copy(GETTEXT, 1, pos(' ', GETTEXT) - 1);
  Delete(GETTEXT, 1, pos(' ', GETTEXT));
  if OPERATION = '_LOG' then
  begin
    Name := Copy(GETTEXT, 1, Pos(' ', GETTEXT) - 1);
    Delete(GETTEXT, 1, Pos(' ', GETTEXT));

    Password := GETTEXT;

    if DataSet.Locate('NAME', Name, []) then
    begin
      mmoLOG.Lines.Insert(0, '>> Name found');
      if DataSet.Fields.Fields[2].AsString = Password then
      begin
        mmoLOG.Lines.Insert(0, '>> Password found');
        USERID := DataSet.Fields.Fields[0].AsInteger;
        SENDTODEFCLIENT(REMADR, '_LOGIN ' + IntToStr(USERID));
      end
      else
      begin
        mmoLOG.Lines.Insert(0, '>> Name not found');
        SENDTODEFCLIENT(REMADR, '_ERR Wrong password');
      end;
    end
    else
    begin
      mmoLOG.Lines.Insert(0, '>> Password not found');
      SENDTODEFCLIENT(REMADR, '_ERR This name does not exist');
    end;
  end
  else if OPERATION = '_REG' then
  begin
    Name := Copy(GETTEXT, 1, Pos(' ', GETTEXT) - 1);
    Delete(GETTEXT, 1, Pos(' ', GETTEXT));

    Password := Copy(GETTEXT, 1, Pos(' ', GETTEXT) - 1);
    Delete(GETTEXT, 1, Pos(' ', GETTEXT));

    Mail := GETTEXT;

    if DataSet.Locate('NAME', Name, []) or DataSet.Locate('ADR', REMADR, [])
      then
      SENDTODEFCLIENT(REMADR, '_ERR ' + 'This name is alredy used')
    else
    begin
      if DBGrid.DataSource.DataSet.RecordCount = 0 then
      begin
        DataSet.LoadFromFile('db.xml');
        //DATset.FileName:='db.xml';
        DataSet.Append();
        DataSet.FieldByName('ID').Value := 1;
        DataSet.FieldByName('NAME').Value := Name;
        DataSet.FieldByName('PASS').Value := Password;
        DataSet.FieldByName('MAIL').Value := Mail;
        DataSet.FieldByName('ADR').Value := REMADR;
        DataSet.Post;
        DataSet.SaveToFile('db.xml');
        USERID := 1;
      end
      else
      begin
        DataSet.LoadFromFile('db.xml');
        //DATset.FileName:='db.xml';  .
        USERID := USERID + 1;
        DataSet.append();
        DataSet.FieldByName('ID').Value := USERID;
        DataSet.FieldByName('NAME').Value := Name;
        DataSet.FieldByName('PASS').Value := Password;
        DataSet.FieldByName('MAIL').Value := Mail;
        DataSet.FieldByName('ADR').Value := REMADR;
        DataSet.Post;
        DataSet.SaveToFile('db.xml');
      end;
    end;
  end
  else if OPERATION = '_SRCH' then
  begin
    if DataSet.Locate('NAME', GETTEXT, []) then
    begin
      Name := DataSet.Fields.Fields[1].AsString;
      USERID := DataSet.Fields.Fields[0].AsInteger;
      SENDTODEFCLIENT(REMADR, '_FOUNDUSR ' + IntToStr(USERID) + ' ' + Name);
    end
    else
      SENDTODEFCLIENT(REMADR, '_ERR This user does not exist');
  end
  else if OPERATION = '_MSGPOST' then
  begin
    if Copy(GETTEXT, 1, Pos(' ', GETTEXT) - 1) <> '' then
    begin
      USERID := StrToInt(Copy(GETTEXT, 1, Pos(' ', GETTEXT) - 1));
      Delete(GETTEXT, 1, Pos(' ', GETTEXT));

      Name := Copy(GETTEXT, 1, Pos(' ', GETTEXT) - 1);
      Delete(GETTEXT, 1, Pos(' ', GETTEXT));

      tempID := Copy(GETTEXT, 1, Pos(' ', GETTEXT) - 1);
      Delete(GETTEXT, 1, Pos(' ', GETTEXT));

      if DataSet.Locate('ID', tempID, []) then
        tempNAME := DataSet.Fields.Fields[1].AsString;

      if DataSet.Locate('NAME', name, []) then
      begin
        tempADR := DataSet.Fields.Fields[4].AsString;
        SENDTODEFCLIENT(tempADR, '_MSGGET ' + tempNAME + ' ' + GETTEXT);
      end;
    end
    else
      SENDTODEFCLIENT(REMADR, '_ERR This user does not exist');
  end
  else if OPERATION = '_GETKEYFR' then
  begin
    if Copy(GETTEXT, 1, Pos(' ', GETTEXT) - 1) <> '' then
    begin
      USERID := StrToInt(Copy(GETTEXT, 1, Pos(' ', GETTEXT) - 1));
      Delete(GETTEXT, 1, Pos(' ', GETTEXT));

      Name := Copy(GETTEXT, 1, Pos(' ', GETTEXT) - 1);
      Delete(GETTEXT, 1, Pos(' ', GETTEXT));

      if DataSet.Locate('NAME', name, []) then
      begin
        tempADR := DataSet.Fields.Fields[4].AsString;
        SENDTODEFCLIENT(tempADR, '_GETKEYTO ' + GETTEXT);
      end;
    end
    else
      SENDTODEFCLIENT(REMADR, '_ERR sendERROR');
  end
  else if OPERATION = '_POSTKEYFR' then
  begin
    if Copy(GETTEXT, 1, Pos(' ', GETTEXT) - 1) <> '' then
    begin
      USERID := StrToInt(Copy(GETTEXT, 1, Pos(' ', GETTEXT) - 1));
      Delete(GETTEXT, 1, Pos(' ', GETTEXT));

      if DataSet.Locate('ID', USERID, []) then
      begin
        tempADR := DataSet.Fields.Fields[4].AsString;
        SENDTODEFCLIENT(tempADR, '_POSTKEYTO ' + GETTEXT);
      end;
    end
    else
      SENDTODEFCLIENT(REMADR, '_ERR sendERROR');
  end
  else
    mmoLOG.Lines.Insert(0, '>> Unknown operation');
end;

procedure TfrmSERV.btnCLRClick(Sender: TObject);
var
  i: integer;
begin
  DataSet.EmptyDataSet;
  DataSet.SaveToFile('db.xml');
end;

procedure TfrmSERV.ServerSocketClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  mmoLOG.Lines.Insert(0, '>> Client disconnected');
end;

end.

