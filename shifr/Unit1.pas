unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    btn1: TButton;
    edt1: TEdit;
    mmo1: TMemo;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  b:byte;
  firstpr, secpr, resultpr, fr, Kp,  i,k: longint;
  ks: integer;
  u:char;
  KpDEC, resDEC, a, mes,desh: string;
implementation

{$R *.dfm}


function sumtemp(a: string; b: string; var m: string; var p, t: integer): string;
var
  u: boolean;
  c: string;
  i, l, k, j, y: integer;
begin
  if length(b) < length(a) then
  begin
    c := a;
    a := b;
    b := c;
  end;
  c := '';
  p := 0;
  u := false;
  i := length(a);
  j := length(b);
  while i <> 0 do
  begin
    L := StrToInt(a[i]);
    K := StrToInt(b[j]);
    if not u then
    begin
      P := k + l;
      t := p;
    end
      else
    begin
      p := k + l + p;
      t := p;
    end;
    if (p > 9) then
    begin
      u := true;
      insert(IntTostr(p mod 10), c, 1);
      p := p div 10;
    end
      else
    begin
      u := false;
      insert(IntTostr(p), c, 1);
    end;
    delete(a, i, 1);
    delete(b, j, 1);
    i := i - 1;
    j := j - 1;
  end;   
  m := b;
  sumtemp := c;
end;

function sum(a, b: string): string;
var
U:boolean;
  itog, ostBUKV, temp, ostBUKV2: string;
  ostCHISl, ostCHISl2, t1, t2,i: integer;
begin
u:=false;
for i:=1 to length(a) do
if a[i]<>'0' then
u:=true;
if not u then
a:='0';
  itog := sumtemp(a, b, ostBUKV, ostCHISl, t1);
  if a = '0' then
    insert(ostBUKV, itog, 1)
  else
  if (ostBUKV = '') then
  begin
    if (t1 > 9) then
      insert(IntTOstr(ostCHISl), itog, 1);
  end
    else
  if (length(ostBUKV) > 1) then
  begin
    if (t1 > 9) then
    begin
      temp := sumtemp(IntToStr(ostCHISl), ostBUKV, ostBUKV2, ostCHISl2, t2);

      if t2<=9 then
      insert(ostBUKV2, temp, 1)
      else
      insert(IntToStr(StrToInt(ostBUKV2)+1), temp, 1);

      insert(temp, itog, 1);
    end
    else
      insert(ostBUKV, itog, 1);
  end
    else
  if(length(ostBUKV) = 1) then
  begin
    if t1 > 9 then
      insert(IntToStr(StrToInt(ostBUKV) + (t1 div 10)), itog, 1)
    else
      insert(ostBUKV, itog, 1);
  end;
  sum := itog;
end;

function umn(a, b: string): string;
var
  c, m, z, l, t: string;
  i, j, n, k, code, x: integer;
begin
  c := '';
  l := '0';
  if length(b) > length(a) then
  begin
    c := a;
    a := b;
    b := c;
  end;
  c := '';
  t := '';
  k := 0;
  for i := length(b) downto 1 do
  begin
    for j := length(a) downto 1 do
    begin
      n := (StrToint(a[j]) * StrToint(b[i])) + k;
      m := IntTostr(n mod 10);
      k := n div 10;
      val(m, x, code);
      if code = 0 then
      begin
        insert(IntToStr(x), c, 1);
      end
      else
        insert(m, c, 1);
    end;
    if k <> 0 then
      insert(IntToStr(k), c, 1);
    l := sum(l, c + t);
    t := t + '0';
    c := '';
    k := 0;
  end;
  umn:= l;
end;

function Power(a: string; b: integer): string;
var
  s: string;
  i,j:integer;
begin
  s := '1';
  s := umn(s, a);
  for i := 1 to b-1 do
  begin
    s := umn(s, a);
    j:=i;
    end;
  power := s;
end;

function bolsh(a, b: string): boolean;
var
  i, j, k, m: integer;
begin
  if copy(a, 1, length(a)) = copy(b, 1, length(b)) then
    bolsh := false;
  if length(a) > length(b) then
    bolsh := true
  else
  if length(a) < length(b) then
    bolsh := false
  else
  begin
    for i := 1 to length(a) do
    begin
      k := strToInt(a[i]);
      m := strToInt(b[i]);
      if k > m then
      begin
        bolsh := true;
        break;
      end
      else
      if k < m then
      begin
        bolsh := false;
        break;
      end;
    end;   
  end;
end;

function ravno(a, b: string): boolean;
begin
  ravno := (copy(a, 1, length(a)) = copy(b, 1, length(b)));
end;

function vichit(a, b: string): string;
var
  c: string;
  p, i, j, l, k, m: integer;
  u: boolean;
begin
  c := '';
  p := 0;
  u := false;
  i := length(a);
  j := length(b);
  while i <> 0 do
  begin
    L := StrToInt(a[i]);
    if j > 0 then
      K := StrToInt(b[j])
    else
      k := 0;
    if (L < K) then
    begin
      if (u = false) then
      begin
        p := L + 10 - K;
        u := true;
      end
      else
      begin
        p := L + 10 - K - 1;
      end;
    end
    else
    begin
      if (u = false) then
      begin
        p := L - K;
      end
      else
      begin
        p := L - K - 1;
        if p < 0 then
        begin
          p := p + 10;
          u := true;
        end
        else
          u := false;
      end;
    end;
    insert(IntToStr(p), c, 1);
    delete(a, i, 1);
    delete(b, j, 1);
    i := i - 1;
    j := j - 1;
  end;
 if copy(c, 1, 1) = '0' then
    while copy(c, 1, 1) = '0' do
      delete(c, 1, 1);
  vichit := c;
end;

function delit(a, b: string): string;
var c,k,m:string;

begin
    c:='';
    if bolsh(a,b) then
    begin
      k:=copy(a,1,length(b));
      delete(a,1,length(b));
      if StrToInt(k)<StrToInt(b) then
      begin
        k:=k+copy(a,1,1);
        delete(a,1,1);
      end;
      while a<>'' do
      begin       
        m:=IntToStr(StrToInt(k) mod StrToInt(b));
        c:=c+IntToStr(StrToInt(k) div StrToInt(b));
        k:=m+copy(a,1,1);
        delete(a,1,1);
      end;
      m:=IntToStr(StrToInt(k) mod StrToInt(b));
      c:=c+IntToStr(StrToInt(k) div StrToInt(b));
    end
    else
    c:='0';
    delit:=c;
end;

function modDEC(a,b:string):string;
var tempa,tempdel,tempumn,tempvich:string;
begin
  tempa:=a;
  tempdel:=delit(a,b);
  tempumn:=umn(tempdel,b);
  tempvich:=vichit(a,tempumn);
modDEC:=tempvich;
end;





procedure TForm1.btn1Click(Sender: TObject);
var
  u:char;
  b:byte;
  deshint,temp:string;
begin
 
firstpr := 17;
  secpr := 19;
  resultpr := firstpr * secpr;
  fr := (firstpr - 1) * (secpr - 1);
  Ks := 13;
  Kp := 1;
  repeat
    Kp := Kp + 1
  until (Kp * Ks) mod ((firstpr - 1) * (secpr - 1)) = 1;
  mmo1.Lines.Add('p - '+ IntToStr(firstpr));
  mmo1.Lines.Add('q - '+ IntToStr(secpr));
  mmo1.Lines.Add('n - '+ IntToStr(resultpr));
  mmo1.Lines.Add('fr - '+ IntToStr(fr));
  mmo1.Lines.Add('e - '+ IntToStr(Ks));
  mmo1.Lines.Add('d - '+ IntToStr(Kp));

  KpDEC := IntToStr(Kp);
  resDEC := IntToStr(resultpr);

  a:=edt1.Text;
    mmo1.Lines.Add(a);
  for i := 1 to length(a) do
  begin
  u:=a[i];
    b := ord(u);
    mmo1.Lines.Add(IntToSTr(b));
    mmo1.Lines.Add(IntToStr(KS));
    mmo1.Lines.Add(resDEC);
    mes := mes + modDEC(power(IntTostr(b), Ks), resDEC) + ' ';
    mmo1.Lines.Add(mes);
  end;

while length(mes)<>0 do
begin
 desh:= copy(mes,1,pos(' ',mes)-1);
 temp:=desh;
desh:= modDEC(power(desh, Kp), resDEC);
temp:=desh;
deshint:=deshint+chr(StrToInt(desh));
delete(mes,1,pos(' ',mes));
 end;
 mmo1.Lines.Add(deshint);
end;

end.
