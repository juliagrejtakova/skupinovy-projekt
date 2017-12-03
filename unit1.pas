unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;
type zaznam = record
     meno:string;
     suma:integer;
     end;
const N=6;
var subor:textfile;
    pole:array[1..N]of zaznam;
    i:integer;
    pocet70,pocet250,pocet_zaznamov:integer;
    znak:char;
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var j:integer;
begin
pocet70:=0;
edit1.clear;
edit2.clear;
i:=0;
j:=0;
memo1.clear;
assignfile(subor,'Mena.txt');
reset(subor);
while not eof(subor) do

      begin
          inc(i);
          read(subor,znak);
          repeat
            pole[i].meno:=pole[i].meno + znak;
            read(subor,znak);
          until (znak = ' ');
          read(subor,pole[i].suma);
          pocet70:=pocet70+1;
          Memo1.append(pole[i].meno + ' '+inttostr(pole[i].suma));
          readln(subor);
      end;





end;

procedure TForm1.Button1Click(Sender: TObject);
var meno:string;
    suma:integer;
    j,k:integer;
    pocet250:integer;
begin
 for j:=1 to i do
         begin
           if ((pole[j].suma) = 250)   then pocet250:=pocet250+1
         end;

meno:=(edit1.text);
suma:=strtoint(edit2.text);


 if (suma = 70)  then      begin
                           pole[i].meno:=meno;
                           pole[i].suma:=suma;
                           memo1.append(pole[pocet70].meno + ' '+inttostr(pole[pocet70].suma));
                           end
                 else begin
                             for j:=i downto (pocet250+1) do
                              begin
                                pole[j+1].meno:=pole[j].meno;
                                pole[j+1].suma:=pole[j].suma;
                              end;
                             pole[pocet250].meno:= meno;
                             pole[pocet250].suma:= suma;
                             memo1.clear;
                             for k:=1 to (pocet70+1) do
                               begin
                               Memo1.append(pole[k].meno + ' '+inttostr(pole[k].suma));
                               end;

                        end;

                                //pole[pocet250].meno:=pole[i].meno;
                                //pole[pocet250].suma:=pole[i].suma;
                                //Memo1.append(pole[pocet250].meno + ' '+inttostr(pole[pocet250].suma));

 //











 //memo1.append(meno + ' '+ inttostr(suma));
 edit1.clear;
 edit2.clear;



 {if suma = 70 then begin
                     pole[i+1].meno:=meno;
                     pole[i+1].suma:=suma;
                   end;


 memo1.Append(pole[i+1].meno + ' '+inttostr( pole[i+1].suma));

 for j:= 1 to eof(subor) do

    if (pole[j].suma = 250) then (pocet250:=j)
                                 memo1.append(pole[j].meno+' '+pole[j].suma);  }
 end;




end.

