unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm2 = class(TForm)
    tmrMain: TTimer;
    btnStart: TButton;
    lblStatus: TLabel;
    tmrBratA: TTimer;
    tmrBratB: TTimer;
    tmrBratC: TTimer;
    shpCarcasa: TShape;
    shpBaterie: TShape;
    shpBulb: TShape;
    shpBase: TShape;
    imgCapac: TImage;
    procedure FormCreate(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure tmrMainTimer(Sender: TObject);
    procedure tmrBratATimer(Sender: TObject);
    procedure tmrBratBTimer(Sender: TObject);
    procedure tmrBratCTimer(Sender: TObject);
    procedure DesenCapacTrapez;
  private
    FStep: Integer;
    FPosEtapa1, FPosEtapa2, FPosEtapa3: Integer;
    FCenterY: Integer;
    FBaterieMontata, FLedMontat, FCapacMontat: Boolean;
  public
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
begin
  Width := 1600;
  Height := 900;
  Color := clWhite;
  Position := poScreenCenter;

  FPosEtapa1 := 400;
  FPosEtapa2 := 700;
  FPosEtapa3 := 1000;
  FCenterY := Height div 2;

  // Carcasa
  shpCarcasa.Width := 40;
  shpCarcasa.Height := 100;
  shpCarcasa.Brush.Color := clGray;
  shpCarcasa.Visible := False;

  // Baterie
  shpBaterie.Width := 20;
  shpBaterie.Height := 40;
  shpBaterie.Brush.Color := clGreen;
  shpBaterie.Visible := False;

  // Bec - bulb
  shpBulb.Width := 20;
  shpBulb.Height := 20;
  shpBulb.Shape := stCircle;
  shpBulb.Brush.Color := clYellow;
  shpBulb.Visible := False;

  // Bec - bază
  shpBase.Width := 12;
  shpBase.Height := 10;
  shpBase.Shape := stRectangle;
  shpBase.Brush.Color := clSilver;
  shpBase.Visible := False;

  // Capac (trapez)
  imgCapac.Width := 60;
  imgCapac.Height := 20;
  imgCapac.Visible := False;

  // UI
  btnStart.Left := 20;
  btnStart.Top := Height - 80;
  lblStatus.Left := 120;
  lblStatus.Top := btnStart.Top + 10;
end;

procedure TForm2.btnStartClick(Sender: TObject);
begin
  FStep := 1;
  FBaterieMontata := False;
  FLedMontat := False;
  FCapacMontat := False;

  // Carcasa
  shpCarcasa.Left := 0;
  shpCarcasa.Top := FCenterY;
  shpCarcasa.Visible := True;
  shpCarcasa.BringToFront;

  // Baterie
  shpBaterie.Visible := False;
  shpBaterie.Top := 50;

  // Bec
  shpBulb.Visible := False;
  shpBulb.Top := 50;
  shpBase.Visible := False;
  shpBase.Top := 50;

  // Capac
  imgCapac.Visible := False;
  imgCapac.Top := 50;

  lblStatus.Caption := 'Carcasa se deplasează spre prima stație...';
  tmrMain.Enabled := True;
end;

procedure TForm2.tmrMainTimer(Sender: TObject);
begin
  shpCarcasa.Left := shpCarcasa.Left + 5;

  if FBaterieMontata then
    shpBaterie.Left := shpCarcasa.Left + 10;

  if FLedMontat then
  begin
    shpBulb.Left := shpCarcasa.Left + 10;
    shpBase.Left := shpBulb.Left + 4;
  end;

  if FCapacMontat then
    imgCapac.Left := shpCarcasa.Left - 10;

  case FStep of
    1:
      if shpCarcasa.Left >= FPosEtapa1 then
      begin
        tmrMain.Enabled := False;
        lblStatus.Caption := 'Stație baterie.';
        shpBaterie.Visible := True;
        shpBaterie.Left := shpCarcasa.Left + 10;
        shpBaterie.Top := 50;
        tmrBratA.Enabled := True;
      end;
    2:
      if shpCarcasa.Left >= FPosEtapa2 then
      begin
        tmrMain.Enabled := False;
        lblStatus.Caption := 'Stație LED.';
        shpBulb.Visible := True;
        shpBase.Visible := True;
        shpBulb.Left := shpCarcasa.Left + 10;
        shpBulb.Top := 50;
        shpBase.Left := shpBulb.Left + 4;
        shpBase.Top := shpBulb.Top + shpBulb.Height;
        tmrBratB.Enabled := True;
      end;
    3:
      if shpCarcasa.Left >= FPosEtapa3 then
      begin
        tmrMain.Enabled := False;
        lblStatus.Caption := 'Stație capac.';
        imgCapac.Left := shpCarcasa.Left - 10;
        imgCapac.Top := 50;
        imgCapac.Visible := True;
        DesenCapacTrapez;
        tmrBratC.Enabled := True;
      end;
    4:
      if shpCarcasa.Left > Width then
      begin
        tmrMain.Enabled := False;
        lblStatus.Caption := 'Lanterna a ieșit de pe linia de producție!';
      end;
  end;
end;

procedure TForm2.tmrBratATimer(Sender: TObject);
begin
  if shpBaterie.Top < shpCarcasa.Top then
    shpBaterie.Top := shpBaterie.Top + 5
  else
  begin
    tmrBratA.Enabled := False;
    lblStatus.Caption := 'Bateria a fost montată.';
    FBaterieMontata := True;

    // Trimite bateria în spate, carcasa în față
    shpBaterie.SendToBack;
    shpCarcasa.BringToFront;

    FStep := 2;
    tmrMain.Enabled := True;
  end;
end;

procedure TForm2.tmrBratBTimer(Sender: TObject);
begin
  if shpBulb.Top < shpCarcasa.Top then
  begin
    shpBulb.Top := shpBulb.Top + 5;
    shpBase.Top := shpBulb.Top + shpBulb.Height;
  end
  else
  begin
    tmrBratB.Enabled := False;
    lblStatus.Caption := 'Becul a fost montat.';
    FLedMontat := True;
    FStep := 3;
    tmrMain.Enabled := True;
  end;
end;

procedure TForm2.tmrBratCTimer(Sender: TObject);
begin
  if imgCapac.Top + imgCapac.Height < shpCarcasa.Top then
    imgCapac.Top := imgCapac.Top + 5
  else
  begin
    tmrBratC.Enabled := False;
    lblStatus.Caption := 'Capacul a fost montat.';
    FCapacMontat := True;
    FStep := 4;
    tmrMain.Enabled := True;
  end;
end;

procedure TForm2.DesenCapacTrapez;
var
  Points: array[0..3] of TPoint;
begin
  with imgCapac.Canvas do
  begin
    Brush.Color := clGray;
    Pen.Color := clBlack;
    FillRect(Rect(0, 0, imgCapac.Width, imgCapac.Height));

    Points[0] := Point(10, 0);
    Points[1] := Point(imgCapac.Width - 10, 0);
    Points[2] := Point(imgCapac.Width, imgCapac.Height);
    Points[3] := Point(0, imgCapac.Height);
    Polygon(Points);
  end;
end;

end.

