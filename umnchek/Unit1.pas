unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    btn1: TButton;
    edt1: TEdit;
    edt2: TEdit;
    mmo1: TMemo;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

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

procedure TForm1.btn1Click(Sender: TObject);
var a,b:string;
begin
 a:= edt1.Text;
 b:= edt2.Text;
 mmo1.Lines.Add(umn(a,b));
end;

end.
