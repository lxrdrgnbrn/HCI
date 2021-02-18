unit Logic;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,Dialogs,Math;

type
  Ftype = file of Real;

procedure Result(var n,r,s:real);
procedure Save_TFile(Var f:Ftype; n,r:real; name:string);
procedure Open(Var f:Ftype; name:string; n,r:real);

implementation

uses unit1;

procedure Result(var n,r,s:real);
begin
 s:=2*n*tan(Pi/n)*r/2;
end;


procedure Save_TFile(Var f:Ftype; n,r:real; name:string);
begin
      AssignFile(f,Name);
      Rewrite(f);
      Write(f,n);
      Write(f,r);
      CloseFile(f);
end;

procedure Open(Var f:Ftype; name:string; n,r:real);
begin
  AssignFile(f,Name);
  Reset(f);
  Read(f,n);
  Read(f,r);
end;


end.

