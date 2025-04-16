object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object imgCarcasa: TImage
    Left = 0
    Top = 93
    Width = 81
    Height = 77
  end
  object lblStatus: TLabel
    Left = 464
    Top = 143
    Width = 3
    Height = 15
  end
  object imgBaterie: TImage
    Left = 0
    Top = 176
    Width = 81
    Height = 81
  end
  object shpBec: TShape
    Left = 8
    Top = 263
    Width = 73
    Height = 74
    Shape = stCircle
  end
  object shpCapac: TShape
    Left = 8
    Top = 360
    Width = 65
    Height = 65
    Shape = stRoundRect
  end
  object btnStart: TButton
    Left = 448
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 0
    OnClick = btnStartClick
  end
  object tmrMain: TTimer
    Interval = 50
    OnTimer = tmrMainTimer
    Left = 144
    Top = 120
  end
  object tmrBratA: TTimer
    Enabled = False
    Interval = 50
    OnTimer = tmrBratATimer
    Left = 144
    Top = 184
  end
  object tmrBratB: TTimer
    Enabled = False
    Interval = 50
    OnTimer = tmrBratBTimer
    Left = 144
    Top = 248
  end
  object tmrBratC: TTimer
    Enabled = False
    Interval = 50
    OnTimer = tmrBratCTimer
    Left = 144
    Top = 320
  end
end
