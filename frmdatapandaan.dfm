object frdatapandaan: Tfrdatapandaan
  Left = 0
  Top = 0
  Caption = 'frdatapandaan'
  ClientHeight = 256
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DTTGL: TcxDateEdit
    Left = 136
    Top = 40
    Properties.DisplayFormat = 'dd/mm/yyyy'
    Properties.EditFormat = 'dd/mm/yyyy'
    TabOrder = 0
    Width = 121
  end
  object KMPOH: TcxButton
    Left = 136
    Top = 97
    Width = 75
    Height = 25
    Caption = 'KMPOH'
    TabOrder = 1
    OnClick = KMPOHClick
  end
  object cxButton1: TcxButton
    Left = 136
    Top = 128
    Width = 75
    Height = 25
    Caption = 'KMBELIH'
    TabOrder = 2
    OnClick = cxButton1Click
  end
  object cxButton4: TcxButton
    Left = 136
    Top = 159
    Width = 75
    Height = 25
    Caption = 'CLHAMBILBRG'
    TabOrder = 3
    OnClick = cxButton4Click
  end
  object cxButton5: TcxButton
    Left = 136
    Top = 190
    Width = 75
    Height = 25
    Caption = 'KMRTRBELIH'
    TabOrder = 4
    OnClick = cxButton5Click
  end
  object cxButton2: TcxButton
    Left = 40
    Top = 97
    Width = 75
    Height = 25
    Caption = 'PO BTB'
    TabOrder = 5
    OnClick = cxButton2Click
  end
  object txtpo: TcxTextEdit
    Left = 136
    Top = 70
    TabOrder = 6
    Width = 121
  end
  object PANDAAN: TMyConnection
    Database = 'pandan'
    Username = 'root'
    Server = 'localhost'
    Connected = True
    Left = 296
    Top = 8
    EncryptedPassword = 'CEFFCDFFCCFFCBFFCAFFC9FF'
  end
  object hero: TMyQuery
    Connection = kmbs
    Left = 344
    Top = 64
  end
  object COM: TMyQuery
    Connection = PANDAAN
    Left = 344
    Top = 8
  end
  object kmbs: TMyConnection
    Database = 'pandan'
    Username = 'root'
    Server = 'localhost'
    Connected = True
    Left = 296
    Top = 64
    EncryptedPassword = 'CEFFCDFFCCFFCBFFCAFFC9FF'
  end
  object comd: TMyQuery
    Connection = PANDAAN
    Left = 384
    Top = 8
  end
  object herod: TMyQuery
    Connection = kmbs
    Left = 384
    Top = 64
  end
end
