program ServerColegio;

uses
  FMX.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  UServidor in 'UServidor.pas' {frmServidor},
  ServerMethodsUnit1 in 'ServerMethodsUnit1.pas' {ServerMethods1: TDSServerModule},
  ServerContainerUnit1 in 'ServerContainerUnit1.pas' {ServerContainer1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmServidor, frmServidor);
  Application.CreateForm(TServerContainer1, ServerContainer1);
  Application.Run;
end.

