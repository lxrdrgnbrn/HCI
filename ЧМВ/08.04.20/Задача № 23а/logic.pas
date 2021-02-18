unit Logic;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,Dialogs;

type
  Ftype = file of Real;

procedure Result(a,b,c,h,p:real);
procedure Save_TFile(Var f:Ftype; N:string; a,b,c:real);
procedure Open(Var f:Ftype; n:String);

implementation

uses unit1;

procedure Result(a,b,c,h,p:real);
begin
p:=(a+b+c)/2;
h:=2/a*sqrt(p*(p-a)*(p-b)*(p-c));
end;


procedure Save_TFile(Var f:Ftype; N:string; a,b,c:real);
begin
      AssignFile(f,N);
      Rewrite(f);
      Write(f,a);
      Write(f,b);
      Write(f,c);
      CloseFile(f);
end;

procedure Open(Var f:Ftype; N:string);
var a,b,c:Real;
begin
  AssignFile(f,Name);
  Reset(f);
  Read(f,a);
  Read(f,b);;
  Read(f,c);
end;


end.

