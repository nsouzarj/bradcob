unit menu1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  ExtCtrls, ComCtrls, ActnList, Buttons,un_principal,unprincipal,conexao,SobreMenu,un_novodrc,un_arqret;

type

  { TFrmMenu }

  TFrmMenu = class(TForm)
    Action1: TAction;
    ActionList1: TActionList;
    Image1: TImage;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    procedure Action1Execute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure ToolBar1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FrmMenu: TFrmMenu;

implementation

{$R *.lfm}

{ TFrmMenu }

procedure TFrmMenu.MenuItem1Click(Sender: TObject);
begin

end;

procedure TFrmMenu.MenuItem2Click(Sender: TObject);
begin
  FrmDrcNovo:=TFrmDrcNovo.Create(Self);
  FrmDrcNovo.Show;
end;

procedure TFrmMenu.MenuItem3Click(Sender: TObject);
begin

  Frmdsps:= TFrmdsps.Create(Self);
  Frmdsps.Show;

end;

procedure TFrmMenu.MenuItem4Click(Sender: TObject);
begin
    SobreMenu1:=TSobreMenu.Create(Self);
    SobreMenu1.show;
end;

procedure TFrmMenu.MenuItem5Click(Sender: TObject);
begin
  DtmConexao.DbConexaoPg.Connected:=false;
  FrmMenu.Close;
  FrmMenu:=nil;
end;

procedure TFrmMenu.MenuItem6Click(Sender: TObject);
begin
     //DtmConexao.DbConexaoPg.Connected:=false;
     FrmArqRet:=TFrmArqRet.Create(Self);
     FrmArqRet.Show;
end;

procedure TFrmMenu.ToolBar1Click(Sender: TObject);
begin

end;

procedure TFrmMenu.Action1Execute(Sender: TObject);
begin

end;

procedure TFrmMenu.FormCreate(Sender: TObject);
begin
  DtmConexao:=TDtmConexao.Create(Self);
  try
    DtmConexao.DbConexaoPg.Connected:=true;
  except
    ShowMessage('Erro ao conectar no banco de dados!!');
  end;

end;

procedure TFrmMenu.Image1Click(Sender: TObject);
begin

end;

end.

