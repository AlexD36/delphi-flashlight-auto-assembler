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
  object lblStatus: TLabel
    Left = 464
    Top = 143
    Width = 3
    Height = 15
  end
  object shpBulb: TShape
    Left = 8
    Top = 221
    Width = 73
    Height = 74
    Shape = stCircle
  end
  object shpCarcasa: TShape
    Left = 8
    Top = 79
    Width = 65
    Height = 65
  end
  object shpBaterie: TShape
    Left = 8
    Top = 150
    Width = 65
    Height = 65
  end
  object imgCapac: TImage
    Left = 8
    Top = 343
    Width = 105
    Height = 105
  end
  object shpBase: TShape
    Left = 8
    Top = 8
    Width = 65
    Height = 65
  end
  object imgConveyor: TImage
    Left = 128
    Top = 343
    Width = 105
    Height = 105
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
    Left = 200
    Top = 248
  end
  object tmrConveyor: TTimer
    Interval = 50
    Left = 200
    Top = 192
  end
end
