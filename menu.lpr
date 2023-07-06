program menu;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, menu1, un_modulo, un_principal, zcomponent, datetimectrls, unprincipal,
  dados, conexao, SobreMenu, dados1, un_novodrc, UniFuncoes, un_arqret,
  undados2, dados2


  { you can add units after this };

{$R *.res}

begin
  Application.Title:='BRA COB';
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TFrmMenu, FrmMenu);
  Application.Run;
end.

