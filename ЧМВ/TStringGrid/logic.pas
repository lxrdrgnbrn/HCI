unit Logic;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,Dialogs,Math;

type perimeter=record
     n:integer;
     r:real;
     p:real;
end;
  mass=array[1..128] of perimeter;

  Ftype = file of Real;

procedure Result(var c:perimeter; m:mass; i:integer);
{procedure Save_Report;}
procedure Save_TFile(Var f:Ftype; n:integer; p,r:real; Name:string);
procedure Open(Var f:Ftype; Name:string);

implementation

uses unit1;

procedure Result(var c:perimeter; m:mass; i:integer);
begin
 c.p:=2*c.n*tan(Pi/c.n)*c.r/2;
 m[i].n:=c.n;
 m[i].r:=c.r;
 m[i].p:=c.p;

end;

{procedure Save_Report;
var Name:string;
begin
  Main.SaveDialog1.Filter:= 'Текстовый файл|*.txt|Word Файл|*.doc|Все файлы|*.*';
  if not Main.SaveDialog1.Execute then exit;
  Name:= Main.SaveDialog1.FileName;
  Main.Result_Memo.Lines.SaveToFile(Name);
end;}

procedure Save_TFile(Var f:Ftype; n:integer; p,r:real; Name:string);
begin
      AssignFile(f,Name);
      Rewrite(f);
      Write(f,n);
      Write(f,r);
      Write(f,p);
      CloseFile(f);
end;

procedure Open(Var f:Ftype; Name:string);
begin
  AssignFile(f,Name);
  Reset(f);
end;


end.

