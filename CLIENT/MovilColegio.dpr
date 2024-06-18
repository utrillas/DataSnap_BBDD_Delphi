program MovilColegio;

uses
  System.StartUpCopy,
  FMX.Forms,
  UMovil in 'UMovil.pas' {Form1},
  UServerClases in 'UServerClases.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
