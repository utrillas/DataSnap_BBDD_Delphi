unit UServidor;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Types,
  FMX.Effects, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo;

type
  TfrmServidor = class(TForm)
    StyleBook1: TStyleBook;
    Label1: TLabel;
    Switch1: TSwitch;
    btnSalir: TButton;
    ShadowEffect1: TShadowEffect;
    ShadowEffect2: TShadowEffect;
    ShadowEffect3: TShadowEffect;
    MServerColegio: TMemo;
    Panel1: TPanel;
    procedure Switch1Switch(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmServidor: TfrmServidor;

implementation

{$R *.fmx}

uses ServerContainerUnit1;

//Bot�n salir
procedure TfrmServidor.btnSalirClick(Sender: TObject);
begin
  Application.Terminate;
end;

//Encendido/Apagado de switch
procedure TfrmServidor.Switch1Switch(Sender: TObject);
begin
  if Switch1.IsChecked = True then
    begin
      ServerContainerUnit1.ServerContainer1.DSServer1.Start;
      ShadowEffect1.Enabled := True;
      ShadowEffect2.Enabled := True;
      ShadowEffect3.Enabled := True;
      label1.Text:= 'ENCENDIDO';
    end
  else
    begin
      ServerContainerUnit1.ServerContainer1.DSServer1.Stop;
      ShadowEffect1.Enabled := False;
      ShadowEffect2.Enabled := False;
      ShadowEffect3.Enabled := False;
      label1.Text:= 'APAGADO';
    end;
end;

end.
