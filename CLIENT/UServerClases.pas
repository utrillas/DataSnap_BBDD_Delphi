//
// Created by the DataSnap proxy generator.
// 12/06/2024 16:49:55
//

unit UServerClases;

interface

uses System.JSON, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, FireDAC.Comp.Client, Data.DBXJSONReflect;

type
  TServerMethods1Client = class(TDSAdminClient)
  private
    FInsertarEstudianteCommand: TDBXCommand;
    FEliminarEstudianteCommand: TDBXCommand;
    FBuscarIdEstudianteCommand: TDBXCommand;
    FBuscarNombreEstudianteCommand: TDBXCommand;
    FRellenarArrayCommand: TDBXCommand;
    FCargarGridCommand: TDBXCommand;
    FActualizarEstudianteCommand: TDBXCommand;
    FValidarUsuarioCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function InsertarEstudiante(nom: string; dir: string; tel: string; id_ciu: string; fec_nac: string): Boolean;
    function EliminarEstudiante(id: string): Boolean;
    function BuscarIdEstudiante(dato: string): TJSONArray;
    function BuscarNombreEstudiante(dato: string): TJSONArray;
    function RellenarArray(FDQGrid: TFDQuery): TJSONArray;
    function CargarGrid: TJSONArray;
    function ActualizarEstudiante(id: string; nom: string; dir: string; tel: string; id_ciu: string; fec_nac: string): Boolean;
    function ValidarUsuario(login: string; passw: string; rol: string): Boolean;
  end;

implementation

function TServerMethods1Client.InsertarEstudiante(nom: string; dir: string; tel: string; id_ciu: string; fec_nac: string): Boolean;
begin
  if FInsertarEstudianteCommand = nil then
  begin
    FInsertarEstudianteCommand := FDBXConnection.CreateCommand;
    FInsertarEstudianteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FInsertarEstudianteCommand.Text := 'TServerMethods1.InsertarEstudiante';
    FInsertarEstudianteCommand.Prepare;
  end;
  FInsertarEstudianteCommand.Parameters[0].Value.SetWideString(nom);
  FInsertarEstudianteCommand.Parameters[1].Value.SetWideString(dir);
  FInsertarEstudianteCommand.Parameters[2].Value.SetWideString(tel);
  FInsertarEstudianteCommand.Parameters[3].Value.SetWideString(id_ciu);
  FInsertarEstudianteCommand.Parameters[4].Value.SetWideString(fec_nac);
  FInsertarEstudianteCommand.ExecuteUpdate;
  Result := FInsertarEstudianteCommand.Parameters[5].Value.GetBoolean;
end;

function TServerMethods1Client.EliminarEstudiante(id: string): Boolean;
begin
  if FEliminarEstudianteCommand = nil then
  begin
    FEliminarEstudianteCommand := FDBXConnection.CreateCommand;
    FEliminarEstudianteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEliminarEstudianteCommand.Text := 'TServerMethods1.EliminarEstudiante';
    FEliminarEstudianteCommand.Prepare;
  end;
  FEliminarEstudianteCommand.Parameters[0].Value.SetWideString(id);
  FEliminarEstudianteCommand.ExecuteUpdate;
  Result := FEliminarEstudianteCommand.Parameters[1].Value.GetBoolean;
end;

function TServerMethods1Client.BuscarIdEstudiante(dato: string): TJSONArray;
begin
  if FBuscarIdEstudianteCommand = nil then
  begin
    FBuscarIdEstudianteCommand := FDBXConnection.CreateCommand;
    FBuscarIdEstudianteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FBuscarIdEstudianteCommand.Text := 'TServerMethods1.BuscarIdEstudiante';
    FBuscarIdEstudianteCommand.Prepare;
  end;
  FBuscarIdEstudianteCommand.Parameters[0].Value.SetWideString(dato);
  FBuscarIdEstudianteCommand.ExecuteUpdate;
  Result := TJSONArray(FBuscarIdEstudianteCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TServerMethods1Client.BuscarNombreEstudiante(dato: string): TJSONArray;
begin
  if FBuscarNombreEstudianteCommand = nil then
  begin
    FBuscarNombreEstudianteCommand := FDBXConnection.CreateCommand;
    FBuscarNombreEstudianteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FBuscarNombreEstudianteCommand.Text := 'TServerMethods1.BuscarNombreEstudiante';
    FBuscarNombreEstudianteCommand.Prepare;
  end;
  FBuscarNombreEstudianteCommand.Parameters[0].Value.SetWideString(dato);
  FBuscarNombreEstudianteCommand.ExecuteUpdate;
  Result := TJSONArray(FBuscarNombreEstudianteCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TServerMethods1Client.RellenarArray(FDQGrid: TFDQuery): TJSONArray;
begin
  if FRellenarArrayCommand = nil then
  begin
    FRellenarArrayCommand := FDBXConnection.CreateCommand;
    FRellenarArrayCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRellenarArrayCommand.Text := 'TServerMethods1.RellenarArray';
    FRellenarArrayCommand.Prepare;
  end;
  if not Assigned(FDQGrid) then
    FRellenarArrayCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FRellenarArrayCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRellenarArrayCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(FDQGrid), True);
      if FInstanceOwner then
        FDQGrid.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FRellenarArrayCommand.ExecuteUpdate;
  Result := TJSONArray(FRellenarArrayCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TServerMethods1Client.CargarGrid: TJSONArray;
begin
  if FCargarGridCommand = nil then
  begin
    FCargarGridCommand := FDBXConnection.CreateCommand;
    FCargarGridCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FCargarGridCommand.Text := 'TServerMethods1.CargarGrid';
    FCargarGridCommand.Prepare;
  end;
  FCargarGridCommand.ExecuteUpdate;
  Result := TJSONArray(FCargarGridCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TServerMethods1Client.ActualizarEstudiante(id: string; nom: string; dir: string; tel: string; id_ciu: string; fec_nac: string): Boolean;
begin
  if FActualizarEstudianteCommand = nil then
  begin
    FActualizarEstudianteCommand := FDBXConnection.CreateCommand;
    FActualizarEstudianteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FActualizarEstudianteCommand.Text := 'TServerMethods1.ActualizarEstudiante';
    FActualizarEstudianteCommand.Prepare;
  end;
  FActualizarEstudianteCommand.Parameters[0].Value.SetWideString(id);
  FActualizarEstudianteCommand.Parameters[1].Value.SetWideString(nom);
  FActualizarEstudianteCommand.Parameters[2].Value.SetWideString(dir);
  FActualizarEstudianteCommand.Parameters[3].Value.SetWideString(tel);
  FActualizarEstudianteCommand.Parameters[4].Value.SetWideString(id_ciu);
  FActualizarEstudianteCommand.Parameters[5].Value.SetWideString(fec_nac);
  FActualizarEstudianteCommand.ExecuteUpdate;
  Result := FActualizarEstudianteCommand.Parameters[6].Value.GetBoolean;
end;

function TServerMethods1Client.ValidarUsuario(login: string; passw: string; rol: string): Boolean;
begin
  if FValidarUsuarioCommand = nil then
  begin
    FValidarUsuarioCommand := FDBXConnection.CreateCommand;
    FValidarUsuarioCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FValidarUsuarioCommand.Text := 'TServerMethods1.ValidarUsuario';
    FValidarUsuarioCommand.Prepare;
  end;
  FValidarUsuarioCommand.Parameters[0].Value.SetWideString(login);
  FValidarUsuarioCommand.Parameters[1].Value.SetWideString(passw);
  FValidarUsuarioCommand.Parameters[2].Value.SetWideString(rol);
  FValidarUsuarioCommand.ExecuteUpdate;
  Result := FValidarUsuarioCommand.Parameters[3].Value.GetBoolean;
end;

constructor TServerMethods1Client.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;

constructor TServerMethods1Client.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;

destructor TServerMethods1Client.Destroy;
begin
  FInsertarEstudianteCommand.DisposeOf;
  FEliminarEstudianteCommand.DisposeOf;
  FBuscarIdEstudianteCommand.DisposeOf;
  FBuscarNombreEstudianteCommand.DisposeOf;
  FRellenarArrayCommand.DisposeOf;
  FCargarGridCommand.DisposeOf;
  FActualizarEstudianteCommand.DisposeOf;
  FValidarUsuarioCommand.DisposeOf;
  inherited;
end;

end.
