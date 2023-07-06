unit conexao;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, ZConnection;

type

  { TDtmConexao }

  TDtmConexao = class(TDataModule)
    DbConexaoPg: TZConnection;
    procedure DataModuleCreate(Sender: TObject);
    procedure DbConexaoPgAfterConnect(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DtmConexao: TDtmConexao;

implementation

{$R *.lfm}

{ TDtmConexao }

procedure TDtmConexao.DataModuleCreate(Sender: TObject);
begin

end;

procedure TDtmConexao.DbConexaoPgAfterConnect(Sender: TObject);
begin

end;

end.

