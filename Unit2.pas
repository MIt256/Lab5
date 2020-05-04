unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.MPlayer;

type
  TForm2 = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    MediaPlayer1: TMediaPlayer;
    procedure Timer1Timer(Sender: TObject);
    procedure land(Sender:tobject);
    procedure World(Sender:tobject);
    procedure PepleMove1 (Sender:tobject);
    procedure PepleMove2 (Sender:tobject);
    procedure PepleMove3 (Sender:tobject);

    procedure PepleSwim1 (Sender: TObject);
    procedure PepleSwim2 (Sender: TObject);
    procedure PepleSwim3 (Sender: TObject);
    procedure PepleSwim4 (Sender: TObject);
    procedure PepleSwim5 (Sender: TObject);

    procedure PepleExit1 (Sender: TObject);
    procedure PepleExit2 (Sender: TObject);
    procedure PepleExit3 (Sender: TObject);
    procedure PepleExit4 (Sender: TObject);

    procedure PepleWin (Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  landmove:integer=1;   //�������� ��� �������� ����
  T:integer=1;
  Z:integer=1;
  Global:integer=1;     //�������� ��� ����� ���� ��������
  i:integer;
  flag:boolean=false;
  Form2: TForm2;
  xm:integer=440;       //��������� ��� �������� �� ����
  ym:integer=480;
  xs:integer=500;      //��������� ��� �������� � ����� ���������
  ys:integer=600;

implementation

{$R *.dfm}

 procedure TForm2.Timer1Timer(Sender: TObject);
var i,x,y:integer;
begin

  World(Sender);   //������ ���
  Land(Sender);    //����� � �� ��������

  Image1.canvas.Brush.Color := clblue;
  Image1.canvas.pen.Color := clblue;

     for i := 1 to 1500 do               //��������� ����
     begin                               //������������� ��������� ���������,��� ���� ��������� � �������
       x := random(1100);
       y := random(100);
       Image1.canvas.Ellipse(x - 20, y + 600, x + 20, y + 630);
     end;

   Image1.canvas.pen.Width:=8;
   Image1.canvas.pen.Color:=$3F85CD;
   Image1.canvas.Brush.Color:=$3F85CD;
begin
 case Global of
   1:                        //������� �������
   Begin
   case T of            //���������� ������ ��������� ���������
     1:begin PepleSwim1(Sender);  end;
     2:begin PepleSwim2(Sender);  end;
     3:begin PepleSwim3(Sender);  end;
     4:begin PepleSwim4(Sender);  end;
     5:begin PepleSwim5(Sender);  end;
   end;
    if T<5 then inc(T) else T:=1;
  End;
   2:                       //����� �������� �� �����
  Begin
   case Z of         //���������� ������ ��������� ���������
     1:begin PepleExit1(sender);  end;
     2:begin PepleExit2(sender);  end;
     3:begin PepleExit3(sender);  end;
     4:begin PepleExit4(sender);  end;
        end;
   if Z<4 then inc(Z);
  End;
    3:                      //������� �����
  Begin
   if ym+160>500 then       //�������� ��� ��������
   begin
   inc(xm,5);
   dec(ym,5);
   end
   else
   if xm<900 then          //�������������� ��������
   inc(xm,5)
   else begin
   Global:=4;              //��� ������ ������� ������� �� �����,����� �������� ��������
   z:=5;
   end;

   case T of       //���������� ���� �������� ��������� �� ����
     1:begin PepleMove1(sender);  end;
     2:begin PepleMove3(sender);  end;        //���������� ������ ��������� ���������
     3:begin PepleMove2(sender);  end;
     4:begin PepleMove3(sender);  end;
   end;
    if T<4 then inc(T) else T:=1;
  End;
    4:
  begin
   PepleWin(Sender);        //�������� ��������
  end;
 end;
 if flag=true then Global:=2;
  if Z=4 then Global:=3;        //������������ ����� ���������� ���������
   if z=5 then Global:=4
end;
end;

 procedure TForm2.World(Sender:TObject); //��������� �������� ����(���,��������� ������,��������)
   var i,x,y:integer;
   begin
     Image1.canvas.pen.Color := claqua;
     Image1.canvas.Brush.Color := claqua; //���������� ���
     Image1.canvas.Rectangle(0, 0, 1100, 700);

     Image1.canvas.Brush.Color := $EBCE87;
     Image1.canvas.pen.Color := $EBCE87;
     Randomize;
     for i := 1 to 70 do
     begin                         //��� �� ���������� ������,������ �� ������������� ������� � ���� ���������� �����
       x := 100 + random(300);
       y := 100 + random(100);
       Image1.canvas.Ellipse(x - 50, y - 50, x + 50, y + 50);
     end;

     Image1.canvas.Brush.Color := clyellow;
     Image1.canvas.pen.Color := clyellow;

     x := 800 + random(10);   //����� �� ������ ������,�� ��� ����� ��� �� ������ �� ����� �����
     y := 100 + random(10);
     Image1.canvas.Ellipse(x - 50, y - 50, x + 50, y + 50);
   end;
 //LAND
 procedure TForm2.FormCreate(Sender: TObject); //��� ����� ����� ��� ����� �� ����
begin
MediaPlayer1.play;
end;

Procedure TForm2.Land(Sender: TObject); //��� ����� ��� �������� ����� � �� ��������
begin
begin
 Image1.canvas.pen.Color:=$00D7FF;
 Image1.canvas.Brush.Color:=$00A5FF;
 Image1.Canvas.polygon([point((1100-landmove),700),Point((1900-landmove),700),Point((1900-landmove),500),point((1300-landmove),500)]);   //land
 if (landmove < 730) then      //��������� ������� ��, ���� ��� �� ������ �� ������,��� ��������� ��� �������
  inc(landmove,30) else flag:=true;
 end;

end;
 //WALKING (��������� � ����������� ���������� ����� �������� )
 procedure TForm2.PepleMove1(Sender: TObject);
 begin
   Image1.canvas.pen.Width:=8;
   Image1.canvas.pen.Color:=$3F85CD;   //���������� ���������
   Image1.canvas.Brush.Color:=$3F85CD;

   Image1.canvas.Ellipse(xm-20, ym-20, xm+20, ym+20);   //������
   Image1.Canvas.MoveTo(xm,ym+20);
   Image1.canvas.lineto(xm,ym+100);   //����
   Image1.Canvas.MoveTo(xm,ym+20);
   Image1.canvas.lineto(xm+10,ym+50); //������ ����
   Image1.canvas.lineto(xm+30,ym+80);

   Image1.Canvas.MoveTo(xm,ym+20);
   Image1.canvas.lineto(xm-15,ym+50); //����� ����
   Image1.canvas.lineto(xm-15,ym+80);

   Image1.Canvas.MoveTo(xm,ym+100);
   Image1.canvas.lineto(xm+15,ym+130); //������ ����
   Image1.canvas.lineto(xm-15,ym+160);

   Image1.Canvas.MoveTo(xm,ym+100);
   Image1.canvas.lineto(xm+10,ym+130); //����� ����
   Image1.canvas.lineto(xm-5,ym+160);
 end;

 procedure TForm2.PepleMove2(Sender: TObject);
 begin
   Image1.canvas.pen.Width:=8;
   Image1.canvas.pen.Color:=$3F85CD;
   Image1.canvas.Brush.Color:=$3F85CD;

   Image1.canvas.Ellipse(xm-20, ym-20, xm+20, ym+20);   //head
   Image1.Canvas.MoveTo(xm,ym+20);
   Image1.canvas.lineto(xm,ym+100); //telo
   Image1.Canvas.MoveTo(xm,ym+20);
   Image1.canvas.lineto(xm+10,ym+50); //r arm
   Image1.canvas.lineto(xm+30,ym+80);

   Image1.Canvas.MoveTo(xm,ym+20);
   Image1.canvas.lineto(xm-15,ym+50); //l arm
   Image1.canvas.lineto(xm-15,ym+80);

   Image1.Canvas.MoveTo(xm,ym+100);
   Image1.canvas.lineto(xm+30,ym+130); //r leg
   Image1.canvas.lineto(xm+40,ym+160);

   Image1.Canvas.MoveTo(xm,ym+100);
   Image1.canvas.lineto(xm-15,ym+130); //l leg
   Image1.canvas.lineto(xm-45,ym+160);
 end;

 procedure TForm2.PepleMove3(Sender: TObject);
  begin
   Image1.canvas.pen.Width:=8;
   Image1.canvas.pen.Color:=$3F85CD;
   Image1.canvas.Brush.Color:=$3F85CD;

   Image1.canvas.Ellipse(xm-20, ym-20, xm+20, ym+20);   //head
   Image1.Canvas.MoveTo(xm,ym+20);
   Image1.canvas.lineto(xm,ym+100); //telo
   Image1.Canvas.MoveTo(xm,ym+20);
   Image1.canvas.lineto(xm+5,ym+50); //r arm
   Image1.canvas.lineto(xm+20,ym+80);

   Image1.Canvas.MoveTo(xm,ym+20);
   Image1.canvas.lineto(xm-10,ym+50); //l arm
   Image1.canvas.lineto(xm-5,ym+80);

   Image1.Canvas.MoveTo(xm,ym+100);
   Image1.canvas.lineto(xm+20,ym+130); //r leg
   Image1.canvas.lineto(xm+20,ym+160);

   Image1.Canvas.MoveTo(xm,ym+100);
   Image1.canvas.lineto(xm-10,ym+130); //l leg
   Image1.canvas.lineto(xm-25,ym+160);
   end;

 //SWIMING (��������� � ����������� �������� �� ����� ��������)
procedure TForm2.PepleSwim1(Sender: TObject);
begin
Image1.Canvas.Ellipse(xs+20 - 20 , ys - 20 , xs+20+20 , ys + 20); //�� ��� ������
Image1.Canvas.MoveTo(xs , ys);
Image1.Canvas.LineTo(xs , ys+40);
Image1.Canvas.MoveTo(xs , ys); //2 ���� ��������
Image1.Canvas.LineTo(xs+5 , ys-20);
Image1.Canvas.LineTo(xs+20 , ys-25);

Image1.Canvas.MoveTo(xs , ys);
Image1.Canvas.LineTo(xs-70 , ys+20); //����

Image1.Canvas.moveto(xs-70,ys+20);
Image1.Canvas.Lineto(xs-130,ys); //����
Image1.Canvas.moveto(xs-70,ys+20);
Image1.Canvas.Lineto(xs-130,ys+40);
end;

procedure TForm2.PepleSwim2(Sender: TObject);
begin
Image1.Canvas.Ellipse(xs+20 - 20 , ys - 20 , xs+20+20 , ys + 20);
Image1.Canvas.MoveTo(xs , ys);
Image1.Canvas.LineTo(xs-20 , ys+35);
Image1.Canvas.MoveTo(xs , ys);
Image1.Canvas.LineTo(xs+10 , ys-10); //arms
Image1.Canvas.LineTo(xs+20 , ys-15);
Image1.Canvas.LineTo(xs+40 , ys-15);
Image1.Canvas.LineTo(xs+50 , ys-10);

Image1.Canvas.MoveTo(xs , ys);
Image1.Canvas.LineTo(xs-70 , ys+20);

Image1.Canvas.moveto(xs-70,ys+20); //legs
Image1.Canvas.Lineto(xs-130,ys+10);
Image1.Canvas.moveto(xs-70,ys+20);
Image1.Canvas.Lineto(xs-130,ys+30);
end;

procedure TForm2.PepleSwim3(Sender: TObject);
begin
Image1.Canvas.Ellipse(xs+20 - 20 , ys - 20 , xs+20+20 , ys + 20);
Image1.Canvas.MoveTo(xs , ys);
Image1.Canvas.LineTo(xs+15 , ys-5);
Image1.Canvas.LineTo(xs+30 , ys-5); //arms
Image1.Canvas.LineTo(xs+50 , ys);
Image1.Canvas.MoveTo(xs , ys);
Image1.Canvas.LineTo(xs-35 , ys+20);

Image1.Canvas.MoveTo(xs , ys);
Image1.Canvas.LineTo(xs-70 , ys+20);

Image1.Canvas.moveto(xs-70,ys+20); //legs
Image1.Canvas.Lineto(xs-130,ys+19);
Image1.Canvas.moveto(xs-70,ys+20);
Image1.Canvas.Lineto(xs-130,ys+22);
end;

procedure TForm2.PepleSwim4(Sender: TObject);
begin
Image1.Canvas.Ellipse(xs+20 - 20 , ys - 20 , xs+20+20 , ys + 20);
Image1.Canvas.MoveTo(xs , ys);
Image1.Canvas.LineTo(xs+15 , ys+5);
Image1.Canvas.LineTo(xs+30 , ys+10); //arms
Image1.Canvas.LineTo(xs+40 , ys+20);
Image1.Canvas.MoveTo(xs , ys);
Image1.Canvas.LineTo(xs-35 , ys-20);

Image1.Canvas.MoveTo(xs , ys);
Image1.Canvas.LineTo(xs-70 , ys+20);

Image1.Canvas.moveto(xs-70,ys+20); //legs
Image1.Canvas.Lineto(xs-130,ys+27);
Image1.Canvas.moveto(xs-70,ys+20);
Image1.Canvas.Lineto(xs-130,ys+15);
end;

procedure TForm2.PepleSwim5(Sender: TObject);
begin
Image1.Canvas.Ellipse(xs+20 - 20 , ys - 20 , xs+20+20 , ys + 20);
Image1.Canvas.MoveTo(xs, ys);
Image1.Canvas.LineTo(xs+20 , ys+35); //arms
Image1.Canvas.MoveTo(xs , ys);
Image1.Canvas.LineTo(xs-10 , ys-35);

Image1.Canvas.MoveTo(xs , ys); //body
Image1.Canvas.LineTo(xs-70 , ys+20);

Image1.Canvas.moveto(xs-70,ys+20);
Image1.Canvas.Lineto(xs-130,ys+34); //legs
Image1.Canvas.moveto(xs-70,ys+20);
Image1.Canvas.Lineto(xs-130,ys+7);
end;
 //Exit   (��������� ������ �� ����)
procedure Tform2.PepleExit1(Sender: TObject);
begin
with Image1.Canvas do begin
pen.Color:=$3F85CD;
Brush.Color:=$3F85CD;
pen.Width:=8;
Ellipse(xs+40 - 20 , ys - 20 , xs+40 + 20 , ys + 20); // ������ 540 600
MoveTo(xs+20 , ys); // ����� ���������� ������ � ����
LineTo(xs-80 , ys); // ����� ��������
MoveTo(xs+20 , ys); // ������ ���
LineTo(xs+40 , ys+40); // ����� ���
MoveTo(xs-80 , ys); // ������ ���
LineTo(xs-115 , ys+35); // ����� ���
end;
end;

procedure Tform2.PepleExit2(Sender: TObject);
begin
with Image1.Canvas do begin
Pen.Color:=$3F85CD;
Brush.Color:=$3F85CD;
pen.Width:=8;
Ellipse(xs+10 - 20 , ys-50 - 20 , xs+10 + 20 , ys-50 + 20); // ������ 510 550
MoveTo(xs-10 , ys-40); // ����� ���������� ���� � ������
LineTo(xs-100 , ys); // ����� ��������
MoveTo(xs-10 , ys-40); // ������ ���
LineTo(xs+20 , ys-10); // ����� ���
MoveTo(xs-100 , ys); // ������ 1 ����
LineTo(xs-135 , ys+35); // ����� 1 ����
MoveTo(xs-100 , ys); // ������ 2 ����
LineTo(xs-105 , ys+40); // ����� 2 ����
end;
end;

procedure Tform2.PepleExit3(Sender: TObject);
begin
with Image1.Canvas do begin
Pen.Color:=$3F85CD;
Brush.Color:=$3F85CD;
pen.Width:=8;
Ellipse(xs-30 - 20 , 500 - 20 , xs-30 + 20 , 500 + 20); // ������ 510 550
MoveTo(xs-40 , ys-85); // ����� ���������� ���� � ������
LineTo(xs-20 , ys-50); // ������ �� ��� ����
moveTo(xs-40 , ys-85); // ����� ���������� ���� � ������
LineTo(xs-30 , ys-45);//����� �� ��� ����
MoveTo(xs-40 , ys-85);
LineTo(xs-100 , ys-20); // ����� ��������
MoveTo(xs-100 , ys-20); // ������ 1 ����
LineTo(xs-135 , ys+25); // ����� 1 ����
MoveTo(xs-100 , ys-20); // ������ 2 ����
LineTo(xs-80 , ys+30); // ����� 2 ����
end;
end;

procedure Tform2.PepleExit4(Sender: TObject);
begin
with Image1.Canvas do begin
Pen.Color:=$3F85CD;
Brush.Color:=$3F85CD;
pen.Width:=8;
Ellipse(xs-60 - 20 , ys-120 - 20 , xs-60 + 20 , ys-120 + 20); // ������
MoveTo(xs-60 , ys-100); // ����� ���������� ���� � ������
LineTo(xs-55 , ys-80); // ������ �� ��� ����
Lineto(xs-40, ys-60);
MoveTo(xs-60 , ys-100); //
LineTo(xs-65 , ys-80); // ����� �� ��� ����
Lineto(xs-75, ys-60);
MoveTo(xs-60 , ys-120);
LineTo(xs-60 , ys-20); // ����� ��������
LineTo(xs-60 , ys);
Lineto(xs-80, ys+20); //����� 1 ����
MoveTo(xs-60 , ys-20);
Lineto(xs-45, ys-10);
Lineto(xs-65, ys+20); // ����� 2 ����

inc(i);
end;
end;
 //�������� ��������� ���������
procedure TForm2.PepleWin(Sender: TObject);
  begin
   Image1.canvas.pen.Width:=8;
   Image1.canvas.pen.Color:=$3F85CD;
   Image1.canvas.Brush.Color:=$3F85CD;

   Image1.canvas.Ellipse(xm-20, ym-20, xm+20, ym+20);   //head
   Image1.Canvas.MoveTo(xm,ym+20);
   Image1.canvas.lineto(xm,ym+100); //Body
   Image1.Canvas.MoveTo(xm,ym+20);

   Image1.canvas.lineto(xm+20,ym+15); //r arm
   Image1.canvas.lineto(xm+30,ym-30);

   Image1.Canvas.MoveTo(xm,ym+20);
   Image1.canvas.lineto(xm-20,ym+15); //l arm
   Image1.canvas.lineto(xm-30,ym-30);

   Image1.Canvas.MoveTo(xm,ym+100);
   Image1.canvas.lineto(xm+15,ym+130); //r leg
   Image1.canvas.lineto(xm+20,ym+160);

   Image1.Canvas.MoveTo(xm,ym+100);
   Image1.canvas.lineto(xm-15,ym+130); //l leg
   Image1.canvas.lineto(xm-20,ym+160);
   end;
end.



