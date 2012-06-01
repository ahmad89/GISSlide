program PDemoDjikstra;

uses
  Forms,
  UDemoDjikstra in 'UDemoDjikstra.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
