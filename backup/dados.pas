unit dados;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, ZConnection, ZDataset, ZSqlUpdate,conexao;

type

  { TDtmDrc }

  TDtmDrc = class(TDataModule)
    tbdrccnpjcpf: TFloatField;
    tbdrc: TZQuery;
    tbdrcabatconcedido: TFloatField;
    tbdrcagenciacobradora: TFloatField;
    tbdrcbancocobrador: TFloatField;
    tbdrcbrancos1: TStringField;
    tbdrcbrancos2: TStringField;
    tbdrcbrancos3: TStringField;
    tbdrcbrancos4: TFloatField;
    tbdrccarteira: TFloatField;
    tbdrcchequebradesco: TFloatField;
    tbdrcdatacredito: TFloatField;
    tbdrcdataocorencia: TFloatField;
    tbdrcdatavenctitulo: TFloatField;
    tbdrcdescconcedido: TFloatField;
    tbdrcdespesascontrole: TFloatField;
    tbdrcespecietitulo: TStringField;
    tbdrcidocorrencia: TFloatField;
    tbdrcidReg: TFloatField;
    tbdrcidtituloabanco: TStringField;
    tbdrcidtitulobanco: TStringField;
    tbdrcindempre: TStringField;
    tbdrcindrateio: TStringField;
    tbdrciofdevido: TFloatField;
    tbdrcjuromora: TFloatField;
    tbdrcjurosatraso: TFloatField;
    tbdrcmotivoocorrencia: TStringField;
    tbdrcmotivorejeicao: TFloatField;
    tbdrcnumcontrole: TStringField;
    tbdrcnumerodoc: TStringField;
    tbdrcnumprotocolo: TStringField;
    tbdrcnumsequencial: TLongintField;
    tbdrcnuncartorio: TFloatField;
    tbdrcorigempagamento: TFloatField;
    tbdrcoutrasdespesas: TFloatField;
    tbdrcoutrocreditos: TFloatField;
    tbdrcprecn1: TStringField;
    tbdrcprenc2: TFloatField;
    tbdrcprenc3: TFloatField;
    tbdrcTipoInscEmpresa: TFloatField;
    tbdrcusobanco1: TFloatField;
    tbdrcusobanco2: TStringField;
    tbdrcvalorpago: TFloatField;
    tbdrcvalortitulo: TFloatField;
    ZUpdateSQL1: TZUpdateSQL;
    procedure DataModuleCreate(Sender: TObject);
    function LPad(S: string; Ch: Char; Len: Integer):string;
    function RPad(S: string; Ch: Char; Len: Integer): string;
    {Esta procedure salav os dados na tabela de banco de dado}
    procedure SalvarDados(idreg,tipoinsc:Integer;numinsc,numcont,idtitulo,idrateio:String;carteira,idcorrencia,dtocorrencia,numdoc,idenTituloBanco,
      dtvenctitulo:String;vltitulo:real;bcobrador, agcob:Integer;esptitulo:String; vlcusto:real;juros,iof,abat,desconcdiod,vlpago,jurosmora,
      outcreditos:Integer;motcorre:String;dtcredito:String;origpagto,qdcheqforbrad,motrejeicao,numcartorio:Integer;numprot:String;seq:Integer);

    {Esta procedure grava o arquivo texto apartir da tabela}
    procedure GravarArquivo;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DtmDrc: TDtmDrc;

implementation


{$R *.lfm}

{ TDtmDrc }

procedure TDtmDrc.DataModuleCreate(Sender: TObject);
begin

end;

function TDtmDrc.LPad(S: string; Ch: Char; Len: Integer): string;
var   RestLen: Integer;
begin   Result  := S;
  RestLen := Len - Length(s);
  if RestLen < 1 then Exit;
  Result := S + StringOfChar(Ch, RestLen);
end;

function TDtmDrc.RPad(S: string; Ch: Char; Len: Integer): string;
var   RestLen: Integer;
begin   Result  := S;
  RestLen := Len - Length(s);
  if RestLen < 1 then Exit;
  Result := StringOfChar(Ch, RestLen) + S;
end;

procedure TDtmDrc.SalvarDados(idreg,tipoinsc:Integer;numinsc,numcont,idtitulo,idrateio:String;carteira,idcorrencia,dtocorrencia,numdoc,idenTituloBanco,
      dtvenctitulo:String;vltitulo:real;bcobrador, agcob:Integer;esptitulo:String; vlcusto:real;juros,iof,abat,desconcdiod,vlpago,jurosmora,
      outcreditos:Integer;motcorre:String;dtcredito:String;origpagto,qdcheqforbrad,motrejeicao,numcartorio:Integer;numprot:String;seq:Integer);
Var
  datarecebe:String;
begin
        tbdrc.Open;
        tbdrc.Insert;
        tbdrc.FieldByName('idReg').AsInteger:=idreg;
        tbdrc.FieldByName('TipoInscEmpresa').AsInteger:=tipoinsc;
        tbdrc.FieldByName('cnpjcpf').AsString:=numinsc;
        tbdrc.FieldByName('indempre').AsInteger:=0;
        tbdrc.FieldByName('numcontrole').AsString:=numcont;
        tbdrc.FieldByName('idtitulobanco').AsString:=idtitulo;
        tbdrc.FieldByName('indrateio').AsString:=idrateio;
        tbdrc.FieldByName('carteira').AsInteger:=StrToInt(carteira);
        tbdrc.FieldByName('idocorrencia').AsInteger:=StrToInt(idcorrencia);

        datarecebe:=StringReplace(dtocorrencia,'/','',[rfReplaceAll]);
        Delete(datarecebe,5,2);

        tbdrc.FieldByName('dataocorencia').AsInteger:=  StrToInt(datarecebe);
        tbdrc.FieldByName('numerodoc').AsString:=numdoc;
        tbdrc.FieldByName('idtitulobanco').AsString:='';
        datarecebe:=StringReplace(dtvenctitulo,'/','',[rfReplaceAll]);
        Delete(datarecebe,5,2);
        tbdrc.FieldByName('datavenctitulo').asInteger:= StrToInt(datarecebe);
        tbdrc.FieldByName('valortitulo').AsFloat:=vltitulo;
        tbdrc.FieldByName('bancocobrador').AsInteger:=bcobrador;
        tbdrc.FieldByName('agenciacobradora').AsInteger:=agcob;
        tbdrc.FieldByName('especietitulo').AsString:=esptitulo;
        tbdrc.FieldByName('outrasdespesas').AsFloat:=vlcusto;
        tbdrc.FieldByName('jurosatraso').AsInteger:=juros;
        tbdrc.FieldByName('iofdevido').AsInteger:=iof;
        tbdrc.FieldByName('abatconcedido').AsInteger:=abat;
        tbdrc.FieldByName('descconcedido').AsInteger:=desconcdiod;
        tbdrc.FieldByName('valorpago').AsInteger:=vlpago;
        tbdrc.FieldByName('juromora').AsInteger:=jurosmora;
        tbdrc.FieldByName('outrocreditos').AsInteger:=outcreditos;
        tbdrc.FieldByName('motivoocorrencia').AsString:='';
        datarecebe:=StringReplace(dtcredito,'/','',[rfReplaceAll]);
        Delete(datarecebe,5,2);
        tbdrc.FieldByName('datacredito').AsInteger:=StrToInt(datarecebe);
        tbdrc.FieldByName('origempagamento').AsInteger:=origpagto;
        tbdrc.FieldByName('chequebradesco').AsInteger:=qdcheqforbrad;
        tbdrc.FieldByName('motivorejeicao').AsInteger:=motrejeicao;
        tbdrc.FieldByName('nuncartorio').AsInteger:=numcartorio;
        tbdrc.FieldByName('numprotocolo').AsString:=numprot;

        tbdrc.ApplyUpdates;



end;

procedure TDtmDrc.GravarArquivo;
var
  arquivo:TextFile;
  cnt,a:Integer;
  teste:String;
begin
  try
    AssignFile(arquivo,'C:\\bradcob\\arquivodrc.text');
    Rewrite(arquivo);
     tbdrc.Open;
     cnt:=tbdrc.RecordCount-1;
     for a:=0 to  cnt  do
     begin
     teste:=IntToStr(tbdrccnpjcpf.AsInteger);



     WriteLn(arquivo,IntToStr(tbdrcidReg.AsInteger)+IntToStr(tbdrcTipoInscEmpresa.AsInteger)+Lpad(tbdrccnpjcpf.AsString,'0',14)+'000'+Rpad(IntToStr(tbdrcindempre.AsInteger),'0',17)
     +Lpad(IntToStr(tbdrcnumcontrole.AsInteger),'0',25)+'00000000'+LPad(tbdrcidtituloabanco.AsString,' ',12)+'0000000000000000000000'
     +tbdrcindrateio.AsString+'00'+LPad(IntToStr(tbdrccarteira.AsInteger),'0',1)+LPad(IntToStr(tbdrcidocorrencia.AsInteger),'0',2)+IntToStr(tbdrcdataocorencia.AsInteger)
     +Rpad(tbdrcnumerodoc.AsString,' ',10)+RPad(tbdrcidtituloabanco.AsString,' ',20)+IntToStr(tbdrcdatavenctitulo.AsInteger) +LPad(FloatToStr(tbdrcvalortitulo.AsFloat),'0',13)+LPad(IntToStr(tbdrcbancocobrador.AsInteger),'0',3)
     +LPad(IntToStr(tbdrcagenciacobradora.AsInteger),'0',5)+RPad(tbdrcespecietitulo.AsString,' ',2)+LPad(IntToStr(tbdrcoutrasdespesas.AsInteger),'0',13)+LPad(IntToStr(tbdrcjurosatraso.AsInteger),'0',13)+LPad(IntToStr(tbdrciofdevido.AsInteger),'0',13)
     +LPad(IntToStr(tbdrcabatconcedido.AsInteger),'0',13)+LPad(IntToStr(tbdrcdescconcedido.AsInteger),'0',13)+LPad(IntToStr(tbdrcvalorpago.AsInteger),'0',13)
     +LPad(IntToStr(tbdrcjuromora.AsInteger),'0',13)+LPad(IntToStr(tbdrcoutrocreditos.AsInteger),'0',13)+'  '+tbdrcmotivoocorrencia.AsString
     +LPad(IntToStr(tbdrcdatacredito.AsInteger),'0',6)+LPad(IntToStr(tbdrcorigempagamento.AsInteger),'0',3)+RPad('',' ',10)+LPad(IntToStr(tbdrcchequebradesco.AsInteger),'0',4)
     +LPad(IntToStr(tbdrcmotivorejeicao.AsInteger),'0',10)+RPad('',' ',40)+LPad(IntToStr(tbdrcnuncartorio.AsInteger),'0',2)+RPad(tbdrcnumprotocolo.AsString,' ',10)
     +RPad('',' ',14)+RPad(IntToStr(tbdrcnumsequencial.AsInteger),'0',6));
     tbdrc.Next;
     end;

    CloseFile(arquivo);
   except
  end;

end;


end.

