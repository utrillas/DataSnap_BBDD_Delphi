object ServerMethods1: TServerMethods1
  Height = 600
  Width = 800
  object Conexion: TFDConnection
    Params.Strings = (
      'Database=colegio'
      'User_Name=SA'
      'Password=GRUPOCIE'
      'Server=PACO-CORCOLES\SQLEXPRESS2019'
      'OSAuthent=No'
      'ApplicationName=Enterprise/Architect/Ultimate'
      'Workstation=PACO-CORCOLES'
      'MARS=yes'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Left = 714
    Top = 21
  end
  object FDQInsert: TFDQuery
    Connection = Conexion
    SQL.Strings = (
      
        'insert into estudiantes(nombre, direccion, telefono, id_ciudad, ' +
        'fecha_de_nacimiento)'
      'values ('#39'Manuel'#39', '#39'Onil'#39', '#39'123 123 123'#39', 03430, '#39'1990-12-10'#39')')
    Left = 714
    Top = 125
  end
  object FDQDelete: TFDQuery
    Connection = Conexion
    Left = 720
    Top = 240
  end
  object FDQEstudiantes: TFDQuery
    Connection = Conexion
    SQL.Strings = (
      'Select * from estudiantes')
    Left = 592
    Top = 120
  end
  object FDQGrid: TFDQuery
    Connection = Conexion
    Left = 584
    Top = 24
  end
  object FDQActualizar: TFDQuery
    Connection = Conexion
    Left = 720
    Top = 349
  end
  object FDQLogin: TFDQuery
    Connection = Conexion
    SQL.Strings = (
      'select * from login')
    Left = 58
    Top = 58
  end
  object DSP_estudiantes: TDataSetProvider
    DataSet = FDQEstudiantes
    Left = 408
    Top = 24
  end
end
