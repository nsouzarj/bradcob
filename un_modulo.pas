{%RunWorkingDir C:\bradcob}
unit un_modulo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, ZConnection, ZDataset, conexao, ZSqlUpdate,UniFuncoes;

type

  { TDtmDsps }

  TDtmDsps = class(TDataModule)
    ZQContratodataelaboracao: TDateField;
    ZQContratoidcontrato: TLongintField;
    ZQContratonumcontrato: TLongintField;
    ZQContratoretornolido: TBooleanField;
    ZQContratovalortotalacordo: TFloatField;
    ZQtabela: TZQuery;
    ZQtabelaacordoaprovadopelodarc: TStringField;
    ZQtabelaanofabveic: TFloatField;
    ZQtabelaantprodtveic: TFloatField;
    ZQtabelaato: TStringField;
    ZQtabelaaverbacaoimov: TStringField;
    ZQtabelabairro: TStringField;
    ZQtabelacamporetarq: TStringField;
    ZQtabelacepcliente: TFloatField;
    ZQtabelacgarntbens: TFloatField;
    ZQtabelacgarntimov: TFloatField;
    ZQtabelacgarntoutros: TFloatField;
    ZQtabelacgarntveic: TFloatField;
    ZQtabelachassirmarc: TFloatField;
    ZQtabelachassiveic: TStringField;
    ZQtabelachaveprim: TFloatField;
    ZQtabelacodigoregistrobens: TStringField;
    ZQtabelacodigoregistroimoveis: TStringField;
    ZQtabelacodigoregistrooutros: TStringField;
    ZQtabelacodigoregistroveiculo: TStringField;
    ZQtabelacodjun: TFloatField;
    ZQtabelacodmeiopagamento: TFloatField;
    ZQtabelacomarcaimov: TStringField;
    ZQtabelacomplecep: TFloatField;
    ZQtabelacomplemnto: TStringField;
    ZQtabelacontacorrente: TFloatField;
    ZQtabelacontrantveic: TFloatField;
    ZQtabelacontrolecpfcnpjcliente: TFloatField;
    ZQtabelacorveic: TStringField;
    ZQtabelacpfadmescrirtorio: TFloatField;
    ZQtabelacpfavalista1: TStringField;
    ZQtabelacpfavalista2: TStringField;
    ZQtabelacpfcnpjcliente: TFloatField;
    ZQtabelacpfcnpjfilialcliente: TFloatField;
    ZQtabelactrlav1: TStringField;
    ZQtabelactrlav2: TStringField;
    ZQtabeladataacordo: TStringField;
    ZQtabeladataaprovacao: TStringField;
    ZQtabeladatavecimento: TStringField;
    ZQtabeladatavencparc: TStringField;
    ZQtabeladatavencult: TStringField;
    ZQtabeladddcliente: TStringField;
    ZQtabeladddescritorio: TFloatField;
    ZQtabeladregimov: TStringField;
    ZQtabelaendcliente: TStringField;
    ZQtabelafilav1: TStringField;
    ZQtabelafilav2: TStringField;
    ZQtabelagarntbairrologdr: TStringField;
    ZQtabelagarntcepimov: TFloatField;
    ZQtabelagarntcompllogdr: TStringField;
    ZQtabelagarntdescrbens: TStringField;
    ZQtabelagarntlogdr: TStringField;
    ZQtabelagarntnrologdr: TFloatField;
    ZQtabelagarntvgarntoutros: TFloatField;
    ZQtabelaidcontrato: TFloatField;
    ZQtabelaindacordo: TFloatField;
    ZQtabelamarcaveic: TStringField;
    ZQtabelamcircunsimov: TFloatField;
    ZQtabelamodeloveic: TStringField;
    ZQtabelamunicipio: TStringField;
    ZQtabelanfolhaimov: TStringField;
    ZQtabelanlivroimov: TStringField;
    ZQtabelanmatrimov: TFloatField;
    ZQtabelanomeavalista1: TStringField;
    ZQtabelanomeavalista2: TStringField;
    ZQtabelanomecliente: TStringField;
    ZQtabelanomeescritorio: TStringField;
    ZQtabelanomeoperador: TStringField;
    ZQtabelanregimov: TFloatField;
    ZQtabelanum: TStringField;
    ZQtabelanumacordo: TFloatField;
    ZQtabelanumcarteira: TStringField;
    ZQtabelanumcontrato: TFloatField;
    ZQtabelaobs: TStringField;
    ZQtabelaparcelaplanoultimopag: TFloatField;
    ZQtabelaplacaveic: TStringField;
    ZQtabelaporteveic: TFloatField;
    ZQtabelaquantidadedegarantias: TFloatField;
    ZQtabelaquantparc: TFloatField;
    ZQtabelaquantped: TFloatField;
    ZQtabelarenanveic: TFloatField;
    ZQtabelataxajuros: TFloatField;
    ZQtabelataxaref: TStringField;
    ZQtabelatelcliente: TFloatField;
    ZQtabelatelescritorio: TFloatField;
    ZQtabelatepreg: TStringField;
    ZQtabelatotal: TCurrencyField;
    ZQtabelauffabveic: TStringField;
    ZQtabelauflicveic: TStringField;
    ZQtabelaunidadefed: TStringField;
    ZQtabelavalhonor: TFloatField;
    ZQtabelavaloracordo: TFloatField;
    ZQtabelavalorconfessado: TFloatField;
    ZQtabelavaloriof: TFloatField;
    ZQtabelavalparc: TFloatField;
    ZQContrato: TZQuery;
    ZQtabelavgarntimov: TFloatField;
    ZQtabelavgrantveic: TFloatField;
    ZQueryAtualiza: TZQuery;
    ZQueryExclui: TZQuery;
    ZquerySoma: TZReadOnlyQuery;
    ZquerySomatotal: TFloatField;
    ZUpdateSQL1: TZUpdateSQL;
    ZUpdateSQL2: TZUpdateSQL;
    procedure abrir;
    procedure DataModuleCreate(Sender: TObject);
    procedure ZConnection1AfterConnect(Sender: TObject);
    procedure GravarArquivo(nome:String);
   // function LPad(S: string; Ch: Char; Len: Integer):string;
   // function RPad(S: string; Ch: Char; Len: Integer): string;
    procedure SalvarRegistro(ato: String; numacordo: Integer;


   datacordo: String; quantpend, quantpacelas, codjuncao,
   contacorrente: Integer; numcarteira: String; numcontrato: Integer; dataVenc,
   DataVencParc: String; valorparc,valorhono: real;
   taxaref, observacao, nomecliente, endcliente, numend, complementoed,
   bairrocliente, municipiocli, estado: String; cepcliente, complcep: Integer;
   dddcliente: String; telcliente:Integer;valoracordo: real; datavencultimaparc: String;
   parcelaplano, cpfcnpjcliente, cpfcnpjfilialcli, controlecpf, codpag:integer;
   valoriof, taxajuros: real; acordo, dataaprv, nomeoperador,
   avalista1:String;cpfavalista1:String;avalista2:String;cpfavalista2:String;valorconfessado:real;
      indacordo:Integer;filav1:String;filav2:String;ctrlav1:String;crtlav2:String;idcontrato:Integer);


 //Salva o acordo
 procedure SalvarAcordo(acordo:Integer;dataelaboracao:TDate;valortotalacordo:real);

 //Procedure ler o arquivo de retorno do sky line
 procedure LerArquivo(arquivo:String;numcontrato:Integer);

 //Excluir o contrato

 procedure ExcluirContrato(idcontrato:Integer; numcontrato:integer);

  //Procedure de busca

  procedure buscaparcelas(numcontrato:String);

 //Procedure atualiza a tabela
 procedure atualizaparcelas(idcontrato:Integer; numcontrato:Integer;valor:real);

 //Procedure Altera data das parcelas
 procedure AlteraDataParcelas(data:Tdate;numcontrato:Integer);

 procedure alteradados(idcontrato:Integer; numcontrato:integer);
 procedure ZQtabelaCalcFields(DataSet: TDataSet);
 procedure ZQtabelaPostError(DataSet: TDataSet; E: EDatabaseError;
   var DataAction: TDataAction);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DtmDsps: TDtmDsps;

implementation

{$R *.lfm}

{ TDtmDsps }

procedure TDtmDsps.abrir;
begin
  if (ZQtabela.Active=false) then
      ZQtabela.Open;
end;

procedure TDtmDsps.DataModuleCreate(Sender: TObject);
begin
  Func:=TFunc.Create;
end;

procedure TDtmDsps.ZConnection1AfterConnect(Sender: TObject);
begin

end;

procedure TDtmDsps.GravarArquivo(nome:String);
Var
  arq:TextFile;
  i,c,tb,n:integer;
  recebe:String;
  cpf_escritorio,nome_escritorio,ddd_escritorio,tel_escritorio,cpf_adm_esc:String;
begin
   cpf_escritorio:='071149144000159';
   cpf_adm_esc:='047814177'; //Cpf do adm do escritorio
   nome_escritorio:='CAVALCANTE RAMOS ADVOGADOS';
   ddd_escritorio:='0021';
   tel_escritorio:='022033250';
  try

   AssignFile(arq,nome);

   Rewrite(arq);
     ZQtabela.Open;
     tb:=ZQtabela.RecordCount-1;

     for c:=0 to tb do

     begin

           WriteLn(arq,'A'+ZQtabelaato.AsString+ cpf_adm_esc+Func.RPad(IntToStr(ZQtabelanumacordo.AsInteger),'0',11)+  StringReplace(ZQtabeladataacordo.AsString,'/','.',[rfReplaceAll]),
           Func.RPad(IntToStr(ZQtabelaquantped.AsInteger),'0',4)+ Func.Rpad(IntToStr(ZQtabelaquantparc.AsInteger),'0',4)+Func.RPad(IntToStr(ZQtabelacodjun.AsInteger),'0',4)+Func.RPad(IntToStr(ZQtabelacontacorrente.AsInteger),'0',7)+
           Func.RPad(ZQtabelanumcarteira.AsString,'0',5)+Func.RPad(IntToStr(ZQtabelanumcontrato.AsInteger),'0',9)+StringReplace(ZQtabeladatavecimento.AsString,'/','.',[rfReplaceAll])+StringReplace(ZQtabeladatavencparc.AsString,'/','.',[rfReplaceAll])+
           Func.RPad(StringReplace(FormatCurr('0.00',ZQtabelavalparc.AsCurrency) ,',','',[rfReplaceAll]),'0',17) +Func.RPad(StringReplace(FormatCurr('0.00',ZQtabelavalhonor.AsCurrency),',','',[rfReplaceAll]),'0',17)+ZQtabelataxaref.AsString+Func.Lpad(' ',' ',104)+Func.LPad(nome_escritorio,' ',40)+ddd_escritorio+tel_escritorio+
           Func.LPad(ZQtabelanomecliente.AsString,' ',40)+Func.LPad(ZQtabelaendcliente.AsString,' ',40)+Func.LPad(ZQtabelanum.AsString,' ',7)+Func.LPad(ZQtabelacomplemnto.AsString,' ',20)+Func.LPad(ZQtabelabairro.AsString,' ',20)+Func.LPad(ZQtabelamunicipio.AsString,' ',30)+
           Func.LPad(ZQtabelaunidadefed.AsString,' ',2)+Func.RPad(IntToStr(ZQtabelacepcliente.AsInteger),'0',5)+Func.RPad(IntToStr(ZQtabelacomplecep.AsInteger),'0',3)+Func.LPad(ZQtabeladddcliente.AsString,'0',4)+Func.LPad(IntToStr(ZQtabelatelcliente.AsInteger),'0',9)+
           Func.RPad(StringReplace(FormatCurr('0.00',ZQtabelavaloracordo.AsCurrency),',','',[rfReplaceAll]),'0',17)+ StringReplace(ZQtabeladatavencult.AsString,'/','.',[rfReplaceAll])+Func.Rpad(InttoStr(ZQtabelaparcelaplanoultimopag.AsInteger),'0',4)+Func.RPad(IntToStr(ZQtabelacpfcnpjcliente.AsInteger),'0',9)+
           Func.RPad(IntToStr(ZQtabelacpfcnpjfilialcliente.AsInteger),'0',4)+Func.RPad(IntToStr(ZQtabelacontrolecpfcnpjcliente.AsInteger),'0',2)+Func.RPad(IntToStr(ZQtabelacodmeiopagamento.AsInteger),'0',3)+ Func.RPad(StringReplace(FormatCurr('0.00',ZQtabelavaloriof.AsCurrency),',','',[rfReplaceAll]),'0',17)+
           Func.RPad(StringReplace(FormatCurr('0.0000000',ZQtabelataxajuros.AsCurrency),',','',[rfReplaceAll]),'0',17)+ZQtabelaacordoaprovadopelodarc.AsString+StringReplace(ZQtabeladataaprovacao.AsString,'/','.',[rfReplaceAll])+Func.LPad(ZQtabelanomeoperador.AsString,' ',15),
           Func.LPad(ZQtabelanomeavalista1.AsString,' ',40),  Func.LPad(ZQtabelanomeavalista2.AsString,' ',40),  Func.LPad(ZQtabelacpfavalista1.AsString,'0',9),Func.RPad(ZQtabelafilav1.AsString,'0',4),Func.LPad(ZQtabelactrlav1.AsString,'0',2),
           Func.lPad(ZQtabelacpfavalista2.AsString,'0',9),Func.LPad(ZQtabelafilav2.AsString,'0',4),Func.LPad(ZQtabelactrlav2.AsString,'0',2), Func.RPad(StringReplace(FormatCurr('0.00',ZQtabelavalorconfessado.AsCurrency) ,',','',[rfReplaceAll]),'0',17),Func.RPad(IntToStr(ZQtabelaindacordo.AsInteger),'0',2) );
           recebe:=  Func.RPad(StringReplace(FormatCurr('0.00',ZQtabelavalorconfessado.AsCurrency) ,',','',[rfReplaceAll]),'0',17); //Func.RPad(StringReplace(FormatCurr('0.00',Round(ZQtabelavalparc.AsCurrency)) ,',','',[rfReplaceAll]),'0',17);
           ZQtabela.Next;
     end;

   //Fecha o arquivo
   CloseFile(arq);
  except

  end;





end;
{
function TDtmDsps.LPad(S: string; Ch: Char; Len: Integer): string;
var   RestLen: Integer;
begin   Result  := S;
  RestLen := Len - Length(s);
  if RestLen < 1 then Exit;
  Result := S + StringOfChar(Ch, RestLen);
end;

function TDtmDsps.RPad(S: string; Ch: Char; Len: Integer): string;
var   RestLen: Integer;
begin   Result  := S;
  RestLen := Len - Length(s);
  if RestLen < 1 then Exit;
  Result := StringOfChar(Ch, RestLen) + S;
end;
}

{
Procedure de salvar o registro;
}
procedure TDtmDsps.SalvarRegistro(ato: String; numacordo: Integer;
  datacordo: String; quantpend, quantpacelas, codjuncao,
  contacorrente: Integer; numcarteira: String; numcontrato: Integer; dataVenc,
  DataVencParc: String; valorparc, valorhono: real; taxaref, observacao,
  nomecliente, endcliente, numend, complementoed, bairrocliente, municipiocli,
  estado: String; cepcliente, complcep: Integer; dddcliente: String;
  telcliente: Integer; valoracordo: real; datavencultimaparc: String;
  parcelaplano, cpfcnpjcliente, cpfcnpjfilialcli, controlecpf, codpag: integer;
  valoriof, taxajuros: real; acordo, dataaprv, nomeoperador, avalista1: String;
  cpfavalista1: String; avalista2: String; cpfavalista2: String;
  valorconfessado: real; indacordo: Integer;filav1:String;filav2:String;ctrlav1:String;crtlav2:String;idcontrato:Integer);
begin
   try
       ZQtabela.Open;
       ZQtabela.Insert;
       if (ato='SIM') then
         ZQtabela.FieldByName('ato').AsString:='S'
       else
         ZQtabela.FieldByName('ato').AsString:='N';

       ZQtabela.FieldByName('numacordo').AsInteger:=numacordo;
       ZQtabela.FieldByName('cpfadmescrirtorio').AsInteger:=StrToInt('04784177');
       ZQtabela.FieldByName('dataacordo').AsString:=datacordo;
       ZQtabela.FieldByName('nomeoperador').AsString:=nomeoperador;
       ZQtabela.FieldByName('quantped').AsInteger:=quantpend;
       ZQtabela.FieldByName('quantparc').AsInteger:=quantpacelas;
       ZQtabela.FieldByName('codjun').AsInteger:=codjuncao;
       ZQtabela.FieldByName('contacorrente').AsInteger:=contacorrente;
       ZQtabela.FieldByName('numcarteira').AsString:=numcarteira;
       ZQtabela.FieldByName('numcontrato').AsInteger:=numcontrato;
       ZQtabela.FieldByName('datavecimento').AsString:=dataVenc;
       ZQtabela.FieldByName('datavecimento').AsString:=dataVenc;
       ZQtabela.FieldByName('datavencparc').AsString:=DataVencParc;
       ZQtabela.FieldByName('valparc').AsFloat:=valorparc;
       ZQtabela.FieldByName('valhonor').AsFloat:=valorhono;
       if (taxaref='SIM') then
           ZQtabela.FieldByName('taxaref').AsString:='S'
       else
           ZQtabela.FieldByName('taxaref').AsString:='N';

       ZQtabela.FieldByName('obs').AsString:=observacao;
       ZQtabela.FieldByName('nomeescritorio').AsString:='CAVALCANTE RAMOS ADVOGADOS';
       ZQtabela.FieldByName('dddescritorio').AsString:='021';
       ZQtabela.FieldByName('telescritorio').AsString:='22033250';
       ZQtabela.FieldByName('nomecliente').AsString:=nomecliente;
       ZQtabela.FieldByName('endcliente').AsString:=endcliente;
       ZQtabela.FieldByName('num').AsString:=numend;
       ZQtabela.FieldByName('complemnto').AsString:=complementoed;
       ZQtabela.FieldByName('bairro').AsString:=bairrocliente;
       ZQtabela.FieldByName('municipio').AsString:=municipiocli;
       ZQtabela.FieldByName('unidadefed').AsString:=estado;
       ZQtabela.FieldByName('cepcliente').AsInteger:=cepcliente;
       ZQtabela.FieldByName('complecep').AsInteger:=complcep;
       ZQtabela.FieldByName('dddcliente').AsString:=dddcliente;
       ZQtabela.FieldByName('telcliente').AsInteger:=telcliente;
       ZQtabela.FieldByName('valoracordo').Asfloat:=valoracordo;
       ZQtabela.FieldByName('datavencult').AsString:=datavencultimaparc;
       ZQtabela.FieldByName('parcelaplanoultimopag').AsInteger:=parcelaplano;
       ZQtabela.FieldByName('cpfcnpjcliente').AsInteger:=cpfcnpjcliente;
       ZQtabela.FieldByName('cpfcnpjfilialcliente').AsInteger:=cpfcnpjfilialcli;
       ZQtabela.FieldByName('controlecpfcnpjcliente').AsInteger:=controlecpf;
       ZQtabela.FieldByName('codmeiopagamento').AsFloat:=codpag;
       ZQtabela.FieldByName('valoriof').AsFloat:=valoriof;
       ZQtabela.FieldByName('taxajuros').AsFloat:=taxajuros;

       if (acordo='SIM') THEN
          ZQtabela.FieldByName('acordoaprovadopelodarc').AsString:='S'
       else
          ZQtabela.FieldByName('acordoaprovadopelodarc').AsString:='N';

       ZQtabela.FieldByName('dataaprovacao').AsString:=dataaprv;
       ZQtabela.FieldByName('nomeoperador').AsString:=nomeoperador;

       ZQtabela.FieldByName('nomeavalista1').AsString:=avalista1;
       ZQtabela.FieldByName('nomeavalista2').AsString:=avalista2;
       ZQtabela.FieldByName('cpfavalista1').AsString:=cpfavalista1;
       ZQtabela.FieldByName('cpfavalista2').AsString:=cpfavalista2;
       ZQtabela.FieldByName('valorconfessado').AsFloat:=valorconfessado;
       ZQtabela.FieldByName('indacordo').AsInteger:=indacordo;
       ZQtabela.FieldByName('ctrlav1').AsString:=ctrlav1;
       ZQtabela.FieldByName('ctrlav2').AsString:=crtlav2;
       ZQtabela.FieldByName('filav1').AsString:=filav1;
       ZQtabela.FieldByName('filav2').AsString:=filav2;
       ZQtabela.FieldByName('idcontrato').AsInteger:=idcontrato;

       ZQtabela.ApplyUpdates;
   except
       on E: EDatabaseError do
       Writeln(E.Message)


   end;





end;

//Procedure salva o contrato
procedure TDtmDsps.SalvarAcordo(acordo: Integer; dataelaboracao: TDate;
  valortotalacordo: real);
begin
  ZQContrato.open;
  ZQContrato.Insert;
  ZQContratonumcontrato.AsInteger:=acordo;
  ZQContratodataelaboracao.AsDateTime:=dataelaboracao;
  ZQContratovalortotalacordo.AsCurrency:=valortotalacordo;
  ZQContrato.ApplyUpdates;
  ZQContrato.Refresh;
end;

//Ler o arquivo de retorno
procedure TDtmDsps.LerArquivo(arquivo: String; numcontrato:Integer);
var  arq: TextFile; { declarando a variável "arq" do tipo arquivo texto }
     linha,num,observacao,numerocontrato,data,datavencimento: string;
     converte,numrecebe,i,a,ler:Integer;
begin



  AssignFile(arq, arquivo);
  Reset(arq);
  ZQContrato.Filtered:=false;



  a:=ZQContrato.RecordCount;
  ZQContrato.First;

   while (not eof(arq)) do
   begin
      ReadLn(arq,linha);
     observacao:=Trim(Copy(linha,170,58));
     datavencimento:=StringReplace(Copy(linha,54,10),'.','/',[rfReplaceAll]);;
     data:=StringReplace(Copy(linha,256,10),'.','/',[rfReplaceAll]);
     numerocontrato:=Trim(Copy(linha,247,9));
     numrecebe:=StrToInt(numerocontrato);
     ZQueryAtualiza.Close;
     ZQueryAtualiza.SQL.Clear;
     ZQueryAtualiza.SQL.Add('UPDATE "TB_CAD_REM" SET camporetarq = '+''''+observacao+''''+' WHERE NUMCONTRATO='+IntToStr(numrecebe)+' AND DATAVENCPARC='+''''+datavencimento+'''');
     ZQueryAtualiza.ExecSQL;

     ZQueryAtualiza.Close;
     ZQueryAtualiza.SQL.Clear;
     ZQtabela.Filtered:=false;
     ZQueryAtualiza.SQL.Add('UPDATE "TB_CONTRATO" SET retornolido=true WHERE numcontrato='+IntToStr(numrecebe)+'');
     ZQueryAtualiza.ExecSQL;
   end;
     ZQContrato.Filtered:=false;
     ZQContrato.Refresh;
     ZQtabela.Refresh;

  CloseFile(arq);

end;


//Procedure exclui os contratos
procedure TDtmDsps.ExcluirContrato(idcontrato: Integer; numcontrato: integer);
Var
  numcontrecebe:String;
  idrecebe: String;
  rece:String;
begin
   idrecebe:=IntToStr(idcontrato);
   numcontrecebe:=IntToStr(numcontrato);
   rece:='DELETE FROM "TB_CAD_REM" WHERE numcontrato='+numcontrecebe+' and idcontrato='+idrecebe+'';
   ZQueryExclui.Close;
   ZQueryExclui.SQL.Clear;
   ZQueryExclui.SQL.Add('DELETE FROM "TB_CAD_REM" WHERE numcontrato='+numcontrecebe+' and idcontrato='+idrecebe+'');
   //ZQueryExclui.Open;
   ZQueryExclui.ExecSQL;
   ZQtabela.Close;
   ZQtabela.Open;
   ZQtabela.Refresh;


   ZQueryExclui.Close;
   ZQueryExclui.SQL.Clear;
   ZQueryExclui.SQL.Add('DELETE FROM "TB_CONTRATO" WHERE numcontrato='+ numcontrecebe+' and  idcontrato='+idrecebe+'');
 //  ZQueryExclui.Open;
   ZQueryExclui.ExecSQL;
   ZQContrato.Close;
   ZQContrato.Open;
   ZQContrato.Refresh;
end;





//Busca as parcelas
procedure TDtmDsps.buscaparcelas(numcontrato: String);
begin
  ZQtabela.close;
  ZQtabela.Filtered:=false;
  ZQtabela.Filter:='numcontrato='+numcontrato;
  ZQtabela.Filtered:=true;
  ZQtabela.Open;
  ZQtabela.Refresh;

end;

//Atualiza as parcelas
procedure TDtmDsps.atualizaparcelas(idcontrato: Integer; numcontrato: Integer;   valor: real);
Var
  valorcon:String;
  recebeu:String;
  idcontratorecebe:String;
  sql1:String;
begin
   recebeu:=IntToStr(numcontrato);
   valorcon:=CurrToStr(valor);
   idcontratorecebe:=IntToStr(idcontrato);
   valorcon:=StringReplace(valorcon,',','.',[rfReplaceAll]);
   sql1:='UPDATE "TB_CAD_REM" set valparc = '+valorcon+' WHERE numcontrato='+recebeu+' AND idcontrato='+idcontratorecebe+'';
   ZQueryAtualiza.Close;
   ZQueryAtualiza.SQL.Clear;
   ZQueryAtualiza.SQL.Add(sql1);
  // ZQueryAtualiza.Open;
   ZQueryAtualiza.ExecSQL;

   ZQtabela.close;
   ZQtabela.Filtered:=false;
   ZQtabela.Filter:='numcontrato='+IntToStr(numcontrato);
   ZQtabela.Filtered:=true;
   ZQtabela.Open;
   ZQtabela.Refresh;

end;

procedure TDtmDsps.AlteraDataParcelas(data: Tdate;numcontrato:Integer);
Var
   sql1:String;
   recebeu:String;
   dataproxima:TDate;
   a:Integer;
begin
   dataproxima:=IncMonth(dataproxima,1);
   recebeu:=IntToStr(numcontrato);
   sql1:='UPDATE "TB_CAD_REM" set datavencparc = '+DateToStr(dataproxima)+' WHERE numcontrato='+recebeu+'';
   ZQueryAtualiza.Close;
   ZQueryAtualiza.SQL.Clear;
   ZQueryAtualiza.SQL.Add(sql1);
  // ZQueryAtualiza.Open;
   ZQueryAtualiza.ExecSQL;

end;

procedure TDtmDsps.alteradados(idcontrato:Integer; numcontrato:integer);
 Var
  numcontrecebe:String;
  idrecebe: String;
begin
   idrecebe:=IntToStr(idcontrato);
   numcontrecebe:=IntToStr(numcontrato);
   ZQueryExclui.Close;
   ZQueryExclui.SQL.Clear;
   ZQueryExclui.SQL.Add('DELETE FROM "TB_CAD_REM" WHERE numcontrato='+numcontrecebe+' and idcontrato='+idrecebe+'');
  // ZQueryExclui.Open;
   ZQueryExclui.ExecSQL;
   ZQtabela.Refresh;
end;

procedure TDtmDsps.ZQtabelaCalcFields(DataSet: TDataSet);
begin
  ZquerySoma.Close;
  ZquerySoma.ParamByName('numcontrato').AsInteger:=ZQtabelanumcontrato.AsInteger;
  ZquerySoma.Open;
  ZQtabela.FieldByName('total').AsCurrency:=ZquerySoma.FieldByName('total').AsCurrency;
end;

procedure TDtmDsps.ZQtabelaPostError(DataSet: TDataSet; E: EDatabaseError;
  var DataAction: TDataAction);
begin

end;



end.

