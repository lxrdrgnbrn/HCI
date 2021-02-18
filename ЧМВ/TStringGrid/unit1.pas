unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus, Logic,
	LCLtype, Grids;

type

  { TMain }

  TMain = class(TForm)//класс формы (главного окна)
    {Поля класса формы}
				MainMenu1: TMainMenu;
				MenuItem1: TMenuItem;
				MenuItem2: TMenuItem;
				MenuItem3: TMenuItem;
				MenuItem4: TMenuItem;
				MenuItem5: TMenuItem;
				MenuItem6: TMenuItem;
				OpenDialog1: TOpenDialog;
    result_button: TButton;
    angle_input: TEdit;
    rad_input: TEdit;
    Label1: TLabel;
    Label2: TLabel;
		SaveDialog1: TSaveDialog;
		TSG: TStringGrid;
		procedure FormCreate(Sender: TObject);
  procedure MenuItem2Click(Sender: TObject);
		procedure MenuItem3Click(Sender: TObject);
		procedure MenuItem4Click(Sender: TObject);
		procedure MenuItem5Click(Sender: TObject);
		procedure MenuItem6Click(Sender: TObject);
    procedure result_buttonClick(Sender: TObject);
  private

  public

  end;

var
  Main: TMain;//объект (экземпляр) класса формы
  Ft:Ftype;
  FileName:string;
  a:real;
  ms:mass;
  last_index:integer;
  calc:perimeter;
  n:integer;
  r:real;
  p:real;
  s:Real;
  i:integer;

implementation

{$R *.lfm}

{ TMain }
{Методы класса формы}
{Методы класса определяются в программе точно так же, как и обычные процедуры и функции,
за исключением того, что имя процедуры или функции, являющейся методом,
состоит из двух частей: имени класса, к которому принадлежит метод, и имени метода.
Имя класса от имени метода отделяется точкой.}
procedure TMain.MenuItem2Click(Sender: TObject);
begin
Main.OpenDialog1.Filter:= 'Типизированные файлы|*.dat|Все файлы|*.*';
  if not Main.OpenDialog1.Execute then exit;
  FileName:= Main.OpenDialog1.FileName;
  Open(Ft,FileName);
  while not (EOF) do
  begin
   read(Ft,s);
   main.tsg.cells[i,last_index]:=Floattostr(s);
   inc(i);
  end;
end;

procedure TMain.FormCreate(Sender: TObject);
begin

end;

procedure TMain.MenuItem3Click(Sender: TObject);
begin
if (angle_input.Text<>'') and (rad_input.Text<>'') then
   begin
        if trystrtoFloat(angle_input.Text,a) and trystrtoFloat(rad_input.Text,a) then
           begin
                Main.OpenDialog1.Filter:= 'Типизированные файлы|*.dat|Все файлы|*.*';
                if not Main.OpenDialog1.Execute then exit;
                FileName := Main.OpenDialog1.FileName;
                Save_TFile(ft,n,p,r,FileName);
					 end
        else
          begin
            ShowMessage('Данные введены неверно');
            angle_input.Text:='';
            rad_input.Text:='';
          end;
   end
else
    showMessage('Сначала введите данные');
end;

procedure TMain.MenuItem4Click(Sender: TObject);
begin
end;

procedure TMain.MenuItem5Click(Sender: TObject);
begin
ShowMessage('Автор: Иванов Илья'+#13+#10+
            'Задача №8'+#13+#10+
            'Определить периметр правильного n-угольника,'+#13+#10+
            'описанного около окружности радиуса r.'+#13+#10+
            'http://bgu-chita.ru/zadachnik/Glava01/index01.htm#z8');
end;

procedure TMain.MenuItem6Click(Sender: TObject);
var
ex:Word;
begin
ex:=Application.MessageBox('Вы действительно хотите выйти?','Выход',MB_YESNO);
if ex=IDYES then
  application.Terminate;
end;


procedure TMain.result_buttonClick(Sender: TObject);
begin
if (angle_input.Text<>'') and (rad_input.Text<>'') then
   begin
        if trystrtoFloat(angle_input.Text,a) and trystrtoFloat(rad_input.Text,a) then
          begin
               Main.angle_input.Color := clDefault;
               Main.rad_input.Color := clDefault;
               inc(last_index);
               calc.n:=strtoint(Main.angle_input.Text);
               calc.r:=strtofloat(Main.rad_input.Text);
               Result(calc,ms,last_index);
               Main.TSG.RowCount:=Main.TSG.RowCount+1;
               Main.TSG.Cells[0, last_index] := inttostr(last_index);
               Main.TSG.Cells[1, last_index] := inttostr(calc.n);
               Main.TSG.Cells[2, last_index] := floattostr(calc.r);
               Main.TSG.Cells[3, last_index] := floattostr(calc.p);
					end
				else
          begin
            Main.angle_input.Color := TColor($CCCCFF);
            Main.rad_input.Color := TColor($CCCCFF);
            ShowMessage('Данные введены неверно');
            angle_input.Text:='';
            rad_input.Text:='';
          end;
   end
else
    begin
    Main.angle_input.Color := TColor($CCCCFF);
    Main.rad_input.Color := TColor($CCCCFF);
    showMessage('Сначала введите данные');
    end;
end;

end.

