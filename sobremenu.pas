unit SobreMenu;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TSobreMenu }

  TSobreMenu = class(TForm)
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  SobreMenu1:TSobreMenu;

implementation

{$R *.lfm}

{ TSobreMenu }

procedure TSobreMenu.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin

end;

end.

