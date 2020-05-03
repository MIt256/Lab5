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
  landmove:integer=1;
  T:integer=1;
  Z:integer=1;
  Global:integer=1;
  i:integer;
  flag:boolean=false;
  flag2:boolean=false;      //land
  Form2: TForm2;
  xm:integer=440;
  ym:integer=480;

implementation

{$R *.dfm}

 procedure TForm2.Timer1Timer(Sender: TObject);
var i,x,y:integer;
begin

  World(Sender);
  Land(Sender);

  Image1.canvas.Brush.Color := clblue;
  Image1.canvas.pen.Color := clblue;

     for i := 1 to 1500 do
     begin // water
       x := random(1100);
       y := random(100);
       Image1.canvas.Ellipse(x - 20, y + 600, x + 20, y + 630);
     end;

   Image1.canvas.pen.Width:=8;
 //
   Image1.canvas.pen.Color:=$3F85CD;
   Image1.canvas.Brush.Color:=$3F85CD;
begin
 case Global of
   1:
   Begin
   case T of
     1:begin PepleSwim1(Sender);  end;
     2:begin PepleSwim2(Sender);  end;
     3:begin PepleSwim3(Sender);  end;
     4:begin PepleSwim4(Sender);  end;
     5:begin PepleSwim5(Sender);  end;
   end;
    if T<5 then inc(T) else T:=1;
  End;
   2:
  Begin
   case Z of
     1:begin PepleExit1(sender);  end;
     2:begin PepleExit2(sender);  end;
     3:begin PepleExit3(sender);  end;
     4:begin PepleExit4(sender);  end;
        end;
   if Z<4 then inc(Z);
  End;
    3:
  Begin
   if ym+160>500 then
   begin
   inc(xm,5);
   dec(ym,5);
   end
   else
   if xm<900 then
   inc(xm,5)
   else begin
   Global:=4;
   z:=5;
   end;

   case T of
     1:begin PepleMove1(sender);  end;
     2:begin PepleMove2(sender);  end;
     3:begin PepleMove3(sender);  end;
   end;
    if T<3 then inc(T) else T:=1;
  End;
    4:
  begin
   PepleWin(Sender);
  end;
 end;
 if flag=true then Global:=2;
  if Z=4 then Global:=3;
   if z=5 then Global:=4
end;
end;

 procedure TForm2.World(Sender:TObject);
   var i,x,y:integer;
   begin
     Image1.canvas.pen.Color := claqua;
     Image1.canvas.Brush.Color := claqua; // world
     Image1.canvas.Rectangle(0, 0, 1100, 700);

     Image1.canvas.Brush.Color := $EBCE87;
     Image1.canvas.pen.Color := $EBCE87;
     Randomize;
     for i := 1 to 70 do
     begin // cloud
       x := 100 + random(300);
       y := 100 + random(100);
       Image1.canvas.Ellipse(x - 50, y - 50, x + 50, y + 50);
     end;

     Image1.canvas.Brush.Color := clyellow;
     Image1.canvas.pen.Color := clyellow;

     x := 800 + random(10);
     y := 100 + random(10); // sun
     Image1.canvas.Ellipse(x - 50, y - 50, x + 50, y + 50);
   end;
 //LAND
 procedure TForm2.FormCreate(Sender: TObject);
begin
MediaPlayer1.play;
end;

Procedure TForm2.Land(Sender: TObject);
begin
begin
 Image1.canvas.pen.Color:=$00D7FF;
 Image1.canvas.Brush.Color:=$00A5FF;
 Image1.Canvas.polygon([point((1100-landmove),700),Point((1900-landmove),700),Point((1900-landmove),500),point((1300-landmove),500)]);   //land
 if (landmove < 730) then
  inc(landmove,30) else flag:=true;
 end;

end;
 //WALKING
 procedure TForm2.PepleMove1(Sender: TObject);
 begin
   Image1.canvas.pen.Width:=8;
   Image1.canvas.pen.Color:=$3F85CD;
   Image1.canvas.Brush.Color:=$3F85CD;

   Image1.canvas.Ellipse(xm-20, ym-20, xm+20, ym+20);   //head
   Image1.Canvas.MoveTo(xm,ym+20);
   Image1.canvas.lineto(xm,ym+100);   //telo
   Image1.Canvas.MoveTo(xm,ym+20);
   Image1.canvas.lineto(xm+10,ym+50); //r arm
   Image1.canvas.lineto(xm+30,ym+80);

   Image1.Canvas.MoveTo(xm,ym+20);
   Image1.canvas.lineto(xm-15,ym+50); //l arm
   Image1.canvas.lineto(xm-15,ym+80);

   Image1.Canvas.MoveTo(xm,ym+100);
   Image1.canvas.lineto(xm+15,ym+130); //r leg
   Image1.canvas.lineto(xm-15,ym+160);

   Image1.Canvas.MoveTo(xm,ym+100);
   Image1.canvas.lineto(xm+10,ym+130); //l leg
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

 //SWIMING
procedure TForm2.PepleSwim1(Sender: TObject);
begin
Image1.Canvas.Ellipse(520 - 20 , 600 - 20 , 520 + 20 , 600 + 20);
Image1.Canvas.MoveTo(500 , 600);
Image1.Canvas.LineTo(500 , 640);
Image1.Canvas.MoveTo(500 , 600); //arms
Image1.Canvas.LineTo(505 , 580);
Image1.Canvas.LineTo(520 , 575);

Image1.Canvas.MoveTo(500 , 600);
Image1.Canvas.LineTo(430 , 620); //body

Image1.Canvas.moveto(430,620);
Image1.Canvas.Lineto(370,600); //legs
Image1.Canvas.moveto(430,620);
Image1.Canvas.Lineto(370,640);
end;

procedure TForm2.PepleSwim2(Sender: TObject);
begin
Image1.Canvas.Ellipse(520 - 20 , 600 - 20 , 520 + 20 , 600 + 20);
Image1.Canvas.MoveTo(500 , 600);
Image1.Canvas.LineTo(480 , 635);
Image1.Canvas.MoveTo(500 , 600);
Image1.Canvas.LineTo(510 , 590); //arms
Image1.Canvas.LineTo(520 , 585);
Image1.Canvas.LineTo(540 , 585);
Image1.Canvas.LineTo(550 , 590);

Image1.Canvas.MoveTo(500 , 600); //body
Image1.Canvas.LineTo(430 , 620);

Image1.Canvas.moveto(430,620); //legs
Image1.Canvas.Lineto(370,610);
Image1.Canvas.moveto(430,620);
Image1.Canvas.Lineto(370,630);
end;

procedure TForm2.PepleSwim3(Sender: TObject);
begin
Image1.Canvas.Ellipse(520 - 20 , 600 - 20 , 520 + 20 , 600 + 20);
Image1.Canvas.MoveTo(500 , 600);
Image1.Canvas.LineTo(515 , 595);
Image1.Canvas.LineTo(530 , 595); //arms
Image1.Canvas.LineTo(550 , 600);
Image1.Canvas.MoveTo(500 , 600);
Image1.Canvas.LineTo(465 , 620);

Image1.Canvas.MoveTo(500 , 600); //body
Image1.Canvas.LineTo(430 , 620);

Image1.Canvas.moveto(430,620); //legs
Image1.Canvas.Lineto(370,619);
Image1.Canvas.moveto(430,620);
Image1.Canvas.Lineto(370,622);
end;

procedure TForm2.PepleSwim4(Sender: TObject);
begin
Image1.Canvas.Ellipse(520 - 20 , 600 - 20 , 520 + 20 , 600 + 20);
Image1.Canvas.MoveTo(500 , 600);
Image1.Canvas.LineTo(515 , 605);
Image1.Canvas.LineTo(530 , 610); //arms
Image1.Canvas.LineTo(540 , 620);
Image1.Canvas.MoveTo(500 , 600);
Image1.Canvas.LineTo(465 , 580);

Image1.Canvas.MoveTo(500 , 600); //body
Image1.Canvas.LineTo(430 , 620);

Image1.Canvas.moveto(430,620); //legs
Image1.Canvas.Lineto(370,627);
Image1.Canvas.moveto(430,620);
Image1.Canvas.Lineto(370,615);
end;

procedure TForm2.PepleSwim5(Sender: TObject);
begin
Image1.Canvas.Ellipse(520 - 20 , 600 - 20 , 520 + 20 , 600 + 20);
Image1.Canvas.MoveTo(500 , 600);
Image1.Canvas.LineTo(520 , 635); //arms
Image1.Canvas.MoveTo(500 , 600);
Image1.Canvas.LineTo(490 , 565);

Image1.Canvas.MoveTo(500 , 600); //body
Image1.Canvas.LineTo(430 , 620);

Image1.Canvas.moveto(430,620);
Image1.Canvas.Lineto(370,634); //legs
Image1.Canvas.moveto(430,620);
Image1.Canvas.Lineto(370,607);
end;
 //Exit
procedure Tform2.PepleExit1(Sender: TObject);
begin
with Image1.Canvas do begin
pen.Color:=$3F85CD;
Brush.Color:=$3F85CD;
pen.Width:=8;
Ellipse(540 - 20 , 600 - 20 , 540 + 20 , 600 + 20); // голова 540 600
MoveTo(520 , 600); // точка соединения головы и тела
LineTo(420 , 600); // конец туловища
MoveTo(520 , 600); // начало рук
LineTo(540 , 640); // конец рук
MoveTo(420 , 600); // начало ног
LineTo(385 , 635); // конец ног
end;
end;

procedure Tform2.PepleExit2(Sender: TObject);
begin
with Image1.Canvas do begin
Pen.Color:=$3F85CD;
Brush.Color:=$3F85CD;
pen.Width:=8;
Ellipse(510 - 20 , 550 - 20 , 510 + 20 , 550 + 20); // голова 510 550
MoveTo(490 , 560); // точка соединения тела и головы
LineTo(400 , 600); // конец туловища
MoveTo(490 , 560); // начало рук
LineTo(520 , 590); // конец рук
MoveTo(400 , 600); // начало 1 ноги
LineTo(365 , 635); // конец 1 ноги
MoveTo(400 , 600); // начало 2 ноги
LineTo(395 , 640); // конец 2 ноги
end;
end;

procedure Tform2.PepleExit3(Sender: TObject);
begin
with Image1.Canvas do begin
Pen.Color:=$3F85CD;
Brush.Color:=$3F85CD;
pen.Width:=8;
Ellipse(470 - 20 , 500 - 20 , 470 + 20 , 500 + 20); // голова 510 550
MoveTo(460 , 515); // точка соединения тела и головы
LineTo(490 , 550); // правая от нас рука
moveTo(460 , 515); // точка соединения тела и головы
LineTo(470 , 555);//левая от нас рука


MoveTo(460 , 515);
LineTo(400 , 580); // конец туловища
MoveTo(400 , 580); // начало 1 ноги
LineTo(365 , 625); // конец 1 ноги
MoveTo(400 , 580); // начало 2 ноги
LineTo(420 , 630); // конец 2 ноги
end;
end;

procedure Tform2.PepleExit4(Sender: TObject);
begin
with Image1.Canvas do begin
Pen.Color:=$3F85CD;
Brush.Color:=$3F85CD;
pen.Width:=8;
Ellipse(440 - 20 , 480 - 20 , 440 + 20 , 480 + 20); // голова
MoveTo(440 , 500); // точка соединения тела и головы
LineTo(450 , 530); // правая от нас рука
Lineto(465, 555);

MoveTo(440 , 500); //
LineTo(425 , 530); // левая от нас рука
Lineto(435, 555);


MoveTo(440 , 480);
LineTo(440 , 580); // конец туловища
LineTo(440 , 600);

Lineto(420, 620); //конец 1 ноги
MoveTo(440 , 580);
Lineto(455, 590);
Lineto(435, 620); // конец 2 ноги

inc(i);
end;
end;

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



