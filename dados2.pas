unit dados2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, ZDataset, ZSqlUpdate,conexao, db ;

type

  { TDtmModule2 }

  TDtmModule2 = class(TDataModule)
    zQHeader: TZQuery;
    zQHeaderdatarepasse: TStringField;
    zQHeaderfixo: TStringField;
    zQHeaderfixobranco: TStringField;
    zQHeaderidheader: TLongintField;
    zQHeadernomempresa: TStringField;
    zQHeadernumlote: TStringField;
    zQHeaderpretcontas: TStringField;
    zQtrailler: TZQuery;
    zQtraillerdatarepasse: TStringField;
    zQtraillerfixo: TStringField;
    zQtraillerfixobranco: TStringField;
    zQtrailleridheader: TLongintField;
    zQtraillernomempresa: TStringField;
    zQtraillernumlote: TStringField;
    zQtraillerpretcontas: TStringField;
    zQrec: TZQuery;
    zQrecagencia: TStringField;
    zQreccarteira: TStringField;
    zQrecconta: TStringField;
    zQreccontrato: TStringField;
    zQrecdtpagto: TStringField;
    zQrecdtremessa: TStringField;
    zQrecdtvencimento: TStringField;
    zQrecidmolp: TStringField;
    zQrecidreg: TLongintField;
    zQrecnossonumboleto: TStringField;
    zQrecnumagencia: TStringField;
    zQrecsiglaempresa: TStringField;
    zQrectipopc: TStringField;
    zQrecvlratualizado: TStringField;
    zQrecvlrdebito: TStringField;
    zQrecvlrdespesas: TStringField;
    zQrecvlrhonorarios: TStringField;
    zQrecvlrinicial: TStringField;
    zQrecvlrjuros: TStringField;
    zQrecvlrmulta: TStringField;
    zQrecvlrrecebido: TStringField;
    zQrecvlrrecebido1: TStringField;
    zQrecvlrrespasse: TStringField;
    ZUpdateSQL1: TZUpdateSQL;
    ZUpdateSQL2: TZUpdateSQL;
    ZUpdateSQL3: TZUpdateSQL;
    procedure DataModuleCreate(Sender: TObject);
    procedure Inserir();
  private

  public

  end;

var
  DtmModule2: TDtmModule2;

implementation

{$R *.lfm}

{ TDtmModule2 }

procedure TDtmModule2.DataModuleCreate(Sender: TObject);
begin
  zQHeader.Open;
  zQtrailler.Open;
  zQrec.Open;

end;

procedure TDtmModule2.Inserir();
Var
  //Cabeçaho
  fixo_header:String;
  nomeempresa:String;
  dt_repasse1:String;
  prestacao_constas1:String;
  num_lote1:String;

  //Registros
  agencia:String;
  conta:String;
  carteira:String;
  contrato:String;
  dtvencimento:String;
  dtremessa:String;
  id_mo_lp:String;
  dtpagto:String;
  vlr_inicial:String;
  vlr_atualizado:String;
  vlr_recebido1:String;
  vlr_juros:String;
  vlr_multa:String;
  vlr_honorarios:String;
  vlr_despesas:String;
  vlr_debito:String;
  vlr_repasse:String;
  sigla_empresa:String;
  tipo_pc:String;
  num_agencia_conta_cedente:String;
  num_boleto:String;
  vlr_recebido2:String;

  //Trailler
  fixo_trailler:String;
  num_lote2:String;
  dt_repasse2:String;
  prestacao_constas3:String;
  qtd_reg_transmitidos:String;
  total_repassado:String;




begin



end;

end.

