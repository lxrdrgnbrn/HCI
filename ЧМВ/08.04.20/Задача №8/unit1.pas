unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,Logic,LCLtype;

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
    result_memo: TMemo;
		SaveDialog1: TSaveDialog;
		procedure MenuItem2Click(Sender: TObject);
		procedure MenuItem3Click(Sender: TObject);
		procedure MenuItem4Click(Sender: TObject);
		procedure MenuItem5Click(Sender: TObject);
		procedure MenuItem6Click(Sender: TObject);
		procedure rad_inputChange(Sender: TObject);
    procedure result_buttonClick(Sender: TObject);
  private

  public

  end;

var
  Main: TMain;//объект (экземпляр) класса формы
  Ft:Ftype;
  r,s,n:real;
  name:string;


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
      Name:= Main.OpenDialog1.FileName;
      Open(ft,name,n,r);
      angle_input.Text:=FloatToStr(n);
      rad_input.Text:=FloatToStr(r);
end;

procedure TMain.MenuItem3Click(Sender: TObject);
begin
if (angle_input.Text<>'') and (rad_input.Text<>'') then
   begin
        if trystrtoFloat(angle_input.Text,n) and trystrtoFloat(rad_input.Text,r) then
           begin
               Main.OpenDialog1.Filter:= 'Типизированные файлы|*.dat|Все файлы|*.*';
               if not Main.OpenDialog1.Execute then exit;
                Name := Main.OpenDialog1.FileName;
                Save_TFile(ft,n,r,name);
                n:=StrToInt(angle_input.Text);
                r:=StrToFloat(rad_input.Text);
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
  Main.SaveDialog1.Filter:= 'Текстовый файл|*.txt|Word Файл|*.doc|Все файлы|*.*';
  if not Main.SaveDialog1.Execute then exit;
  Name:= Main.SaveDialog1.FileName;
  Main.Result_Memo.Lines.SaveToFile(Name);
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

procedure TMain.rad_inputChange(Sender: TObject);
begin

end;


procedure TMain.result_buttonClick(Sender: TObject);
begin
if (angle_input.Text<>'') and (rad_input.Text<>'') then
   begin
        if trystrtoFloat(angle_input.Text,n) and trystrtoFloat(rad_input.Text,r) then
           begin
             n:=strtoFloat(angle_input.Text);
             n:=trunc(n);
             angle_input.Text:=FloatToStr(n);
             r:=strtofloat(rad_input.Text);
             Result(n,r,s);
             Main.result_memo.Lines.add('Кол-во углов: '+angle_input.Text+#13+#10+
                       'Радиус вписанной окружности: '+rad_input.Text+#13+#10+
                       'Площадь многоугольника: '+floattostr(s)+#13+#10);
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

end.

