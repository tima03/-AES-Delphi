unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBTables, StdCtrls, ScktComp, DBClient;

type
  TForm1 = class(TForm)
    DBGrid: TDBGrid;
    log: TMemo;
    SERVstart: TButton;
    SERVstop: TButton;
    ServerSocket: TServerSocket;
    clr: TButton;
    DataSource: TDataSource;
    DataSet: TClientDataSet;
    procedure SERVstartClick(Sender: TObject);
    procedure SERVstopClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ServerSocketClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocketClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure clrClick(Sender: TObject);
    procedure ServerSocketClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

  USERID: integer;
  REMADR: string;
implementation

{$R *.dfm}

procedure SENDTOACTCLIENT(SOMEMSG: string);
var
  i: integer;
begin
  for i := 0 to Form1.ServerSocket.Socket.ActiveConnections - 1 do
    if Form1.ServerSocket.Socket.Connections[i].RemoteAddress = REMADR then
    begin
      Form1.ServerSocket.Socket.Connections[i].SendText(SOMEMSG);
    end;
end;

procedure SENDTODEFCLIENT(ADRESS: string; SOMEMSG: string);
var
  j: integer;
begin
  for j := 0 to Form1.ServerSocket.Socket.ActiveConnections - 1 do
    if Form1.ServerSocket.Socket.Connections[j].RemoteAddress = ADRESS then
    begin
      Form1.log.lines.add('>>' + ADRESS + ' ' + SOMEMSG);
      Form1.ServerSocket.Socket.Connections[j].SendText(SOMEMSG);
    end;
end;

procedure TForm1.SERVstartClick(Sender: TObject);
begin
  ServerSocket.Open;
  log.Lines.Insert(0, '>> Server START');
  SERVstart.Visible := false;
  SERVstop.Visible := True;
end;

procedure TForm1.SERVstopClick(Sender: TObject);
begin
  ServerSocket.Active := False;
  log.Lines.Insert(0, '>> Server STOP');
  SERVstart.Visible := True;
  SERVstop.Visible := False;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i: integer;
begin
  DataSet.FieldDefs.Clear;
  {
  DataSet.FieldDefs.Add('ID', ftString, 20, False);
  DataSet.FieldDefs.Add('NAME', ftString, 20, False);
  DataSet.FieldDefs.Add('PASS', ftString, 20, False);
  DataSet.FieldDefs.Add('MAIL', ftString, 20, False);
  DataSet.FieldDefs.Add('ADR', ftString, 20, False);
  DataSet.CreateDataSet();
  DataSet.FileName:='db.xml';
 DataSet.SaveToFile('db.xml');  }

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

procedure TForm1.ServerSocketClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  log.Lines.Insert(0, '>> Client connected');
  REMADR := Socket.RemoteAddress;
end;

procedure TForm1.ServerSocketClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  OPERATION, Name, Password, Mail, GETTEXT, GETADR, tempADR: string;
begin
  GETTEXT := Socket.ReceiveText();
  log.Lines.Insert(0, '>> ' + GETTEXT);
  OPERATION := Copy(GETTEXT, 1, pos(' ', GETTEXT) - 1);
  Delete(GETTEXT, 1, pos(' ', GETTEXT));
  if OPERATION = '_LOG' then
  begin
    Name := Copy(GETTEXT, 1, Pos(' ', GETTEXT) - 1);
    Delete(GETTEXT, 1, Pos(' ', GETTEXT));

    Password := GETTEXT;

    if DataSet.Locate('NAME', Name, []) then
    begin
      log.Lines.Insert(0, '>> Name found');
      if DataSet.Fields.Fields[2].AsString = Password then
      begin
        log.Lines.Insert(0, '>> Password found');
        USERID := DataSet.Fields.Fields[0].AsInteger;
        SENDTOACTCLIENT('_LOGIN ' + IntToStr(USERID));
      end
      else
      begin
        log.Lines.Insert(0, '>> Name not found');
        SENDTOACTCLIENT('_ERR Wrong password');
      end;
    end
    else
    begin
      log.Lines.Insert(0, '>> Password not found');
      SENDTOACTCLIENT('_ERR This name does not exist');
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
      SENDTOACTCLIENT('_ERR ' + 'This name is alredy used')
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
      SENDTOACTCLIENT('_FOUNDUSR ' + IntToStr(USERID) + ' ' + Name);
    end
    else
      ServerSocket.Socket.Connections[0].SendText('_ERR This user does not exist');
  end
  else if OPERATION = '_MSGPOST' then
  begin
    USERID := StrToInt(Copy(GETTEXT, 1, Pos(' ', GETTEXT) - 1));
    Delete(GETTEXT, 1, Pos(' ', GETTEXT));

    Name := Copy(GETTEXT, 1, Pos(' ', GETTEXT) - 1);
    Delete(GETTEXT, 1, Pos(' ', GETTEXT));
    if DataSet.Locate('NAME', name, []) then
    begin
      GETADR := DataSet.Fields.Fields[4].AsString;
      SENDTODEFCLIENT(GETADR, '_MSGGET ' + GETTEXT);
    end;
  end
  else if OPERATION = '_GETKEY' then
  begin
    USERID := StrToInt(Copy(GETTEXT, 1, Pos(' ', GETTEXT) - 1));
    Delete(GETTEXT, 1, Pos(' ', GETTEXT));
    if DataSet.Locate('ID', USERID, []) then
      tempADR := DataSet.Fields.Fields[4].AsString;
    USERID := StrToInt(Copy(GETTEXT, 1, Pos(' ', GETTEXT) - 1));
    Delete(GETTEXT, 1, Pos(' ', GETTEXT));
    if DataSet.Locate('NAME', GETTEXT, []) then
    begin
      GETADR := DataSet.Fields.Fields[4].AsString;
      SENDTODEFCLIENT(GETADR, '_GETKEY ' + tempADR);
    end;
  end
  else if OPERATION = '_POSTKEY' then
  begin
    tempADR := Copy(GETTEXT, 1, Pos(' ', GETTEXT) - 1);
    Delete(GETTEXT, 1, Pos(' ', GETTEXT));
    SENDTODEFCLIENT(tempADR, '_POSTKEY ' + GETTEXT);
  end
  else
    log.Lines.Insert(0, '>> Unknown operation');
end;

procedure TForm1.clrClick(Sender: TObject);
var
  i: integer;
begin
  DataSet.EmptyDataSet;
  DataSet.SaveToFile('db.xml');
end;

procedure TForm1.ServerSocketClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  log.Lines.Insert(0, '>> Client disconnected');
end;

end.

