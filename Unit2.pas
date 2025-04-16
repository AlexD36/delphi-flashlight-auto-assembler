unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm2 = class(TForm)
    tmrMain: TTimer;
    imgCarcasa: TImage;
    btnStart: TButton;
    lblStatus: TLabel;
    imgBaterie: TImage;
    tmrBratA: TTimer;
    shpBec: TShape;
    tmrBratB: TTimer;
    shpCapac: TShape;
    tmrBratC: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure tmrMainTimer(Sender: TObject);
    procedure tmrBratATimer(Sender: TObject);
    procedure tmrBratBTimer(Sender: TObject);
    procedure tmrBratCTimer(Sender: TObject);
  private
    FStep: Integer;
    FPosEtapa1, FPosEtapa2, FPosEtapa3: Integer;
    FCenterY: Integer;
    FBaterieMontata, FBecMontat, FCapacMontat: Boolean;
  public
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
begin
  BorderStyle := bsSingle;
  Width := 1600;
  Height := 900;
  Color := clWhite;
  Position := poScreenCenter;

  // Stații de lucru
  FPosEtapa1 := 400;
  FPosEtapa2 := 700;
  FPosEtapa3 := 1000;
  FCenterY := Height div 2;
  FStep := 0;

  // Carcasa
  imgCarcasa.Visible := False;
  imgCarcasa.Width := 40;
  imgCarcasa.Height := 40;
  imgCarcasa.Top := FCenterY;

  // Baterie
  imgBaterie.Visible := False;
  imgBaterie.Width := 20;
  imgBaterie.Height := 40;
  imgBaterie.Top := 50;
  imgBaterie.Left := 10;
  imgBaterie.Canvas.Brush.Color := clLime;
  imgBaterie.Canvas.FillRect(Rect(0, 0, imgBaterie.Width, imgBaterie.Height));
  tmrBratA.Enabled := False;

  // Bec
  shpBec.Visible := False;
  shpBec.Width := 20;
  shpBec.Height := 20;
  shpBec.Shape := stCircle;
  shpBec.Brush.Color := clYellow;
  shpBec.Top := 50;
  shpBec.Left := 10;
  tmrBratB.Enabled := False;

  // Capac
  shpCapac.Visible := False;
  shpCapac.Width := 40;
  shpCapac.Height := 10;
  shpCapac.Shape := stRoundRect;
  shpCapac.Brush.Color := clBlue;
  shpCapac.Top := 50;
  shpCapac.Left := 10;
  tmrBratC.Enabled := False;

  // UI
  btnStart.Left := 20;
  btnStart.Top := Height - 80;
  btnStart.Caption := 'Start';

  lblStatus.Left := 120;
  lblStatus.Top := btnStart.Top + 10;
  lblStatus.Caption := '';
end;

procedure TForm2.btnStartClick(Sender: TObject);
begin
  // Resetare
  FStep := 1;
  FBaterieMontata := False;
  FBecMontat := False;
  FCapacMontat := False;

  imgCarcasa.Left := 0;
  imgCarcasa.Top := FCenterY;
  imgCarcasa.Visible := True;
  imgCarcasa.Canvas.Brush.Color := clRed;
  imgCarcasa.Canvas.FillRect(Rect(0, 0, imgCarcasa.Width, imgCarcasa.Height));

  imgBaterie.Visible := False;
  imgBaterie.Top := 50;

  shpBec.Visible := False;
  shpBec.Top := 50;

  shpCapac.Visible := False;
  shpCapac.Top := 50;

  lblStatus.Caption := 'Carcasa se deplasează spre prima stație...';
  tmrMain.Enabled := True;
end;

procedure TForm2.tmrMainTimer(Sender: TObject);
begin
  // Mișcă lanterna
  imgCarcasa.Left := imgCarcasa.Left + 5;

  if FBaterieMontata then
    imgBaterie.Left := imgCarcasa.Left + 10;
  if FBecMontat then
    shpBec.Left := imgCarcasa.Left + 10;
  if FCapacMontat then
    shpCapac.Left := imgCarcasa.Left;

  case FStep of
    1:
      if imgCarcasa.Left >= FPosEtapa1 then
      begin
        tmrMain.Enabled := False;
        lblStatus.Caption := 'Carcasa a ajuns la stația de baterie.';
        imgBaterie.Visible := True;
        imgBaterie.Top := 50;
        imgBaterie.Left := imgCarcasa.Left + 10;
        tmrBratA.Enabled := True;
      end;
    2:
      if imgCarcasa.Left >= FPosEtapa2 then
      begin
        tmrMain.Enabled := False;
        lblStatus.Caption := 'Carcasa a ajuns la stația de bec.';
        shpBec.Visible := True;
        shpBec.Top := 50;
        shpBec.Left := imgCarcasa.Left + 10;
        tmrBratB.Enabled := True;
      end;
    3:
      if imgCarcasa.Left >= FPosEtapa3 then
      begin
        tmrMain.Enabled := False;
        lblStatus.Caption := 'Carcasa a ajuns la stația de capac.';
        shpCapac.Visible := True;
        shpCapac.Top := 50;
        shpCapac.Left := imgCarcasa.Left;
        tmrBratC.Enabled := True;
      end;
    4:
      if imgCarcasa.Left >= Width then
      begin
        tmrMain.Enabled := False;
        lblStatus.Caption := 'Lanterna a ieșit de pe linia de producție!';
      end;
  end;
end;

procedure TForm2.tmrBratATimer(Sender: TObject);
begin
  if imgBaterie.Top < imgCarcasa.Top then
    imgBaterie.Top := imgBaterie.Top + 5
  else
  begin
    tmrBratA.Enabled := False;
    lblStatus.Caption := 'Bateria a fost montată.';
    FBaterieMontata := True;
    FStep := 2;
    tmrMain.Enabled := True;
  end;
end;

procedure TForm2.tmrBratBTimer(Sender: TObject);
begin
  if shpBec.Top < imgCarcasa.Top then
    shpBec.Top := shpBec.Top + 5
  else
  begin
    tmrBratB.Enabled := False;
    lblStatus.Caption := 'Becul LED a fost montat.';
    FBecMontat := True;
    FStep := 3;
    tmrMain.Enabled := True;
  end;
end;

procedure TForm2.tmrBratCTimer(Sender: TObject);
begin
  if shpCapac.Top + shpCapac.Height < imgCarcasa.Top then
    shpCapac.Top := shpCapac.Top + 5
  else
  begin
    tmrBratC.Enabled := False;
    lblStatus.Caption := 'Capacul a fost montat. Se deplasează spre ieșire...';
    FCapacMontat := True;
    FStep := 4;
    tmrMain.Enabled := True;
  end;
end;

end.

