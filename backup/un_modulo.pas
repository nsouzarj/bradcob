{%RunWorkingDir C:\bradcob}
unit un_modulo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, ZConnection, ZDataset, conexao, ZSqlUpdate,
  ZStoredProcedure, UniFuncoes;

type

  { TDtmDsps }

  TDtmDsps = class(TDataModule)
    ZQContratodataelaboracao: TDateField;
    ZQContratoidcontrato: TLongintField;
    ZQContratonumcontrato: TLongintField;
    ZQContratoretornolido: TBooleanField;
    ZQContratovalortotalacordo: TFloatField;
    ZQtabela: TZQuery;
    ZQContrato: TZQuery;
    ZQtabelaacordoaprovadopelodarc: TStringField;
    ZQtabelaanofabveic: TFloatField;
    ZQtabelaanomodveic: TFloatField;
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
    ZQtabelachaveprim: TLongintField;
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
    ZQtabelavgarntimov: TFloatField;
    ZQtabelavgrantbens: TFloatField;
    ZQtabelavgrantveic: TFloatField;
    ZQuery1acordoaprovadopelodarc: TStringField;
    ZQuery1anofabveic: TFloatField;
    ZQuery1anomodveic: TFloatField;
    ZQuery1antprodtveic: TFloatField;
    ZQuery1ato: TStringField;
    ZQuery1averbacaoimov: TStringField;
    ZQuery1bairro: TStringField;
    ZQuery1camporetarq: TStringField;
    ZQuery1cepcliente: TFloatField;
    ZQuery1cgarntbens: TFloatField;
    ZQuery1cgarntimov: TFloatField;
    ZQuery1cgarntoutros: TFloatField;
    ZQuery1cgarntveic: TFloatField;
    ZQuery1chassirmarc: TFloatField;
    ZQuery1chassiveic: TStringField;
    ZQuery1chaveprim: TFloatField;
    ZQuery1codigoregistrobens: TStringField;
    ZQuery1codigoregistroimoveis: TStringField;
    ZQuery1codigoregistrooutros: TStringField;
    ZQuery1codigoregistroveiculo: TStringField;
    ZQuery1codjun: TFloatField;
    ZQuery1codmeiopagamento: TFloatField;
    ZQuery1comarcaimov: TStringField;
    ZQuery1complecep: TFloatField;
    ZQuery1complemnto: TStringField;
    ZQuery1contacorrente: TFloatField;
    ZQuery1contrantveic: TFloatField;
    ZQuery1controlecpfcnpjcliente: TFloatField;
    ZQuery1corveic: TStringField;
    ZQuery1cpfadmescrirtorio: TFloatField;
    ZQuery1cpfavalista1: TStringField;
    ZQuery1cpfavalista2: TStringField;
    ZQuery1cpfcnpjcliente: TFloatField;
    ZQuery1cpfcnpjfilialcliente: TFloatField;
    ZQuery1ctrlav1: TStringField;
    ZQuery1ctrlav2: TStringField;
    ZQuery1dataacordo: TStringField;
    ZQuery1dataaprovacao: TStringField;
    ZQuery1datavecimento: TStringField;
    ZQuery1datavencparc: TStringField;
    ZQuery1datavencult: TStringField;
    ZQuery1dddcliente: TStringField;
    ZQuery1dddescritorio: TFloatField;
    ZQuery1dregimov: TStringField;
    ZQuery1endcliente: TStringField;
    ZQuery1filav1: TStringField;
    ZQuery1filav2: TStringField;
    ZQuery1garntbairrologdr: TStringField;
    ZQuery1garntcepimov: TFloatField;
    ZQuery1garntcompllogdr: TStringField;
    ZQuery1garntdescrbens: TStringField;
    ZQuery1garntlogdr: TStringField;
    ZQuery1garntnrologdr: TFloatField;
    ZQuery1garntvgarntoutros: TFloatField;
    ZQuery1idcontrato: TFloatField;
    ZQuery1indacordo: TFloatField;
    ZQuery1marcaveic: TStringField;
    ZQuery1mcircunsimov: TFloatField;
    ZQuery1modeloveic: TStringField;
    ZQuery1municipio: TStringField;
    ZQuery1nfolhaimov: TStringField;
    ZQuery1nlivroimov: TStringField;
    ZQuery1nmatrimov: TFloatField;
    ZQuery1nomeavalista1: TStringField;
    ZQuery1nomeavalista2: TStringField;
    ZQuery1nomecliente: TStringField;
    ZQuery1nomeescritorio: TStringField;
    ZQuery1nomeoperador: TStringField;
    ZQuery1nregimov: TFloatField;
    ZQuery1num: TStringField;
    ZQuery1numacordo: TFloatField;
    ZQuery1numcarteira: TStringField;
    ZQuery1numcontrato: TFloatField;
    ZQuery1obs: TStringField;
    ZQuery1parcelaplanoultimopag: TFloatField;
    ZQuery1placaveic: TStringField;
    ZQuery1porteveic: TFloatField;
    ZQuery1quantidadedegarantias: TFloatField;
    ZQuery1quantparc: TFloatField;
    ZQuery1quantped: TFloatField;
    ZQuery1renanveic: TFloatField;
    ZQuery1taxajuros: TFloatField;
    ZQuery1taxaref: TStringField;
    ZQuery1telcliente: TFloatField;
    ZQuery1telescritorio: TFloatField;
    ZQuery1tepreg: TStringField;
    ZQuery1uffabveic: TStringField;
    ZQuery1uflicveic: TStringField;
    ZQuery1unidadefed: TStringField;
    ZQuery1valhonor: TFloatField;
    ZQuery1valoracordo: TFloatField;
    ZQuery1valorconfessado: TFloatField;
    ZQuery1valoriof: TFloatField;
    ZQuery1valparc: TFloatField;
    ZQuery1vgarntimov: TFloatField;
    ZQuery1vgrantbens: TFloatField;
    ZQuery1vgrantveic: TFloatField;
    ZQueryAtualiza: TZQuery;
    ZQueryExclui: TZQuery;
    ZquerySoma: TZReadOnlyQuery;
    ZquerySomatotal: TFloatField;
    ZUpdateSQL1: TZUpdateSQL;
    ZUpdateSQL2: TZUpdateSQL;
    procedure abrir;
    procedure DataModuleCreate(Sender: TObject);
    procedure ZConnection1AfterConnect(Sender: TObject);
    procedure GravarArquivo(nome:String;tipolayout:Integer);
  //  function LPad(S: string; Ch: Char; Len: Integer):string;
  //  function RPad(S: string; Ch: Char; Len: Integer): string;
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
   indacordo:Integer;filav1:String;filav2:String;ctrlav1:String;crtlav2:String;idcontrato:Integer;
   codregveic:String;quantgrantia:Integer;tipogarantia:Integer;valorveic:real;renavan:Integer;placaveic:String;
   ufveic:String;anofabveic:Integer;anomodveic:Integer; uflincveic:String;chassiveic:Integer;nunchassiveic:String;
   prodcontratado:Integer;contratorenegociado:Integer;marcaveic:String;modeloveic:String;corveic:String;porteveic:Integer;
   codregimovel:String;tipogarantimovel:Integer;valorimovel:real;enderecoimovel:String;numimovel:Integer;complimovel:String;
   bairroimovel:String;cepimovel:Integer;circunsimovel:Integer;comarcaimovel:String;matimovel:Integer;numregistro:Integer;
   averbimovel:String;mumlivro:String;numfolha:String;regimovel:String;
   cordregbens:String;tipogarantbens:Integer;descbem:String;valorbem:real;
   codregoutros:String;tipogarantoutrosd:Integer;valoutros:real);



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

procedure TDtmDsps.GravarArquivo(nome:String;tipolayout:Integer);
Var
  arq:TextFile;
  i,c,tb,n:integer;
  recebe:String;
  tipo:Integer;
  cpf_escritorio,nome_escritorio,ddd_escritorio,tel_escritorio,cpf_adm_esc:String;
begin
   cpf_escritorio:='071149144000159';
   cpf_adm_esc:='047814177'; //Cpf do adm do escritorio
   nome_escritorio:='CAVALCANTE RAMOS ADVOGADOS';
   ddd_escritorio:='0021';
   tel_escritorio:='022033250';
   tipo:=tipolayout;
  try

   AssignFile(arq,nome);

   Rewrite(arq);
     ZQtabela.Open;
     tb:=ZQtabela.RecordCount-1;

     for c:=0 to tb do

     begin

          if (tipo = 0) then
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
                   Func.LPad(ZQtabelacpfavalista2.AsString,'0',9),Func.LPad(ZQtabelafilav2.AsString,'0',4),Func.LPad(ZQtabelactrlav2.AsString,'0',2), Func.RPad(StringReplace(FormatCurr('0.00',ZQtabelavalorconfessado.AsCurrency) ,',','',[rfReplaceAll]),'0',17),Func.RPad(IntToStr(ZQtabelaindacordo.AsInteger),'0',2));
                     //Recebe total
                   recebe:=  Func.RPad(StringReplace(FormatCurr('0.00',ZQtabelavalorconfessado.AsCurrency) ,',','',[rfReplaceAll]),'0',17); //Func.RPad(StringReplace(FormatCurr('0.00',Round(ZQtabelavalparc.AsCurrency)) ,',','',[rfReplaceAll]),'0',17);
                   ZQtabela.Next;
               end;

          if (tipo = 1) then
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
                   Func.LPad(ZQtabelacpfavalista2.AsString,'0',9),Func.LPad(ZQtabelafilav2.AsString,'0',4),Func.LPad(ZQtabelactrlav2.AsString,'0',2), Func.RPad(StringReplace(FormatCurr('0.00',ZQtabelavalorconfessado.AsCurrency) ,',','',[rfReplaceAll]),'0',17),Func.RPad(IntToStr(ZQtabelaindacordo.AsInteger),'0',2)+

                   //Veiculo
                   Func.LPad(IntToStr(ZQtabelaquantidadedegarantias.AsInteger),'0',2)+
                   ZQtabelacodigoregistroveiculo.AsString+Func.Rpad(IntToStr(ZQtabelacgarntveic.AsInteger),'0',3)+
                   Func.RPad(StringReplace(FormatCurr('0.00',ZQtabelavgrantveic.AsCurrency) ,',','',[rfReplaceAll]),'0',18)+
                   Func.RPad(IntToStr(ZQtabelarenanveic.AsInteger),'0',11)+
                   Func.LPad(ZQtabelaplacaveic.AsString,' ',7)+
                   ZQtabelauffabveic.AsString+Func.RPad(IntToStr(ZQtabelaanofabveic.AsInteger),'0',4)+
                   Func.RPad(IntToStr(ZQtabelaanomodveic.AsInteger),'0',4)+
                   ZQtabelauflicveic.AsString+
                   Func.Lpad(IntToStr(ZQtabelachassirmarc.AsInteger),'0',1)+
                   Func.LPad(ZQtabelachassiveic.AsString,' ',20)+
                   Func.Lpad(IntToStr(ZQtabelaantprodtveic.AsInteger),'0',3)+
                   Func.Lpad(IntToStr(ZQtabelacontrantveic.AsInteger),'0',9)+
                   Func.LPad(ZQtabelamarcaveic.AsString,' ',20)+
                   Func.LPad(ZQtabelamodeloveic.AsString,' ',20)+
                   Func.LPad(ZQtabelacorveic.AsString,' ',20)+
                   Func.Lpad(IntToStr(ZQtabelaporteveic.AsInteger),'0',1)+

                   //Imoveis
                   ZQtabelacodigoregistroimoveis.AsString+
                   Func.Lpad(IntToStr(ZQtabelacgarntimov.AsInteger),'0',3)+
                   Func.RPad(StringReplace(FormatCurr('0.0000000',ZQtabelavgarntimov.AsCurrency),',','',[rfReplaceAll]),'0',18)+
                   Func.LPad(ZQtabelagarntlogdr.AsString,' ',38)+
                   Func.Lpad(IntToStr(ZQtabelagarntnrologdr.AsInteger),'0',5)+
                   Func.LPad(ZQtabelagarntcompllogdr.AsString,' ',10)+
                   Func.LPad(ZQtabelagarntbairrologdr.AsString,' ',20)+
                   Func.Lpad(IntToStr(ZQtabelagarntcepimov.AsInteger),'0',8)+
                   Func.Lpad(IntToStr(ZQtabelamcircunsimov.AsInteger),'0',3)+
                   Func.LPad(ZQtabelacomarcaimov.AsString,' ',41)+
                   Func.Lpad(IntToStr(ZQtabelanmatrimov.AsInteger),'0',7)+
                   Func.Lpad(IntToStr(ZQtabelanregimov.AsInteger),'0',10)+
                   Func.LPad(ZQtabelaaverbacaoimov.AsString,' ',11)+
                   Func.LPad(ZQtabelanlivroimov.AsString,' ',5)+
                   Func.LPad(ZQtabelanfolhaimov.AsString,' ',3)+
                   Func.LPad(ZQtabeladregimov.AsString,' ',8)+

                   //Bens
                   ZQtabelacodigoregistrobens.AsString+
                   Func.LPad(IntToStr(ZQtabelacgarntbens.AsInteger),'0',3)+
                   Func.RPad(ZQtabelagarntdescrbens.AsString,' ',50)+
                   Func.RPad(StringReplace(FormatCurr('0.00',ZQtabelavgrantbens.AsCurrency) ,',','',[rfReplaceAll]),'0',18)+

                   //Outros
                   ZQtabelacodigoregistrooutros.AsString+
                   Func.LPad(IntToStr(ZQtabelacgarntoutros.AsInteger),'0',3)+
                   Func.RPad(StringReplace(FormatCurr('0.00',ZQtabelagarntvgarntoutros.AsCurrency) ,',','',[rfReplaceAll]),'0',18));
                   //Recebe total
                   recebe:=  Func.RPad(StringReplace(FormatCurr('0.00',ZQtabelavalorconfessado.AsCurrency) ,',','',[rfReplaceAll]),'0',17); //Func.RPad(StringReplace(FormatCurr('0.00',Round(ZQtabelavalparc.AsCurrency)) ,',','',[rfReplaceAll]),'0',17);
                   ZQtabela.Next;
           end;

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
  valorconfessado: real; indacordo: Integer;filav1:String;filav2:String;ctrlav1:String;crtlav2:String;idcontrato:Integer;
  codregveic:String;quantgrantia:Integer;tipogarantia:Integer;valorveic:real;renavan:Integer;placaveic:String;ufveic:String;
  anofabveic:Integer;anomodveic:Integer;uflincveic:String;chassiveic:Integer;nunchassiveic:String;prodcontratado:Integer;
  contratorenegociado:Integer;marcaveic:String;modeloveic:String;corveic:String;porteveic:Integer;
  codregimovel:String;tipogarantimovel:Integer;valorimovel:real;enderecoimovel:String;numimovel:Integer;complimovel:String;
  bairroimovel:String;cepimovel:Integer;circunsimovel:Integer;comarcaimovel:String;matimovel:Integer;numregistro:Integer;
  averbimovel:String;mumlivro:String;numfolha:String;regimovel:String;
  cordregbens:String;tipogarantbens:Integer;descbem:String;valorbem:real;
  codregoutros:String;tipogarantoutrosd:Integer;valoutros:real);
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
       //Veiculos
       ZQtabela.FieldByName('codigoregistroveiculo').AsString:=codregveic;
       ZQtabela.FieldByName('quantidadedegarantias').AsInteger:=quantgrantia;
       ZQtabela.FieldByName('cgarntveic').AsInteger:=tipogarantia;
       ZQtabela.FieldByName('vgrantveic').AsFloat:=valorveic;
       ZQtabela.FieldByName('renanveic').AsInteger:=renavan;
       ZQtabela.FieldByName('placaveic').AsString:=placaveic;
       ZQtabela.FieldByName('uffabveic').AsString:=ufveic;
       ZQtabela.FieldByName('anofabveic').AsInteger:=anofabveic;
       ZQtabela.FieldByName('anomodveic').AsInteger:=anomodveic;
       ZQtabela.FieldByName('uflicveic').AsString:=uflincveic;
       ZQtabela.FieldByName('chassirmarc').AsInteger:=chassiveic;
       ZQtabela.FieldByName('chassiveic').AsString:=nunchassiveic;
       ZQtabela.FieldByName('antprodtveic').AsInteger:=prodcontratado;
       ZQtabela.FieldByName('contrantveic').AsInteger:=contratorenegociado;
       ZQtabela.FieldByName('marcaveic').AsString:=marcaveic;
       ZQtabela.FieldByName('modeloveic').AsString:=modeloveic;
       ZQtabela.FieldByName('corveic').AsString:=corveic;
       ZQtabela.FieldByName('porteveic').AsInteger:=porteveic;
       //Imoveis
       ZQtabela.FieldByName('codigoregistroimoveis').AsString:=codregimovel;
       ZQtabela.FieldByName('cgarntimov').AsInteger:=tipogarantimovel;
       ZQtabela.FieldByName('vgarntimov').AsFloat:=valorimovel;
       ZQtabela.FieldByName('garntlogdr').AsString:=enderecoimovel;
       ZQtabela.FieldByName('garntnrologdr').AsInteger:=numimovel;
       ZQtabela.FieldByName('garntcompllogdr').AsString:=complimovel;
       ZQtabela.FieldByName('garntbairrologdr').AsString:=bairroimovel;
       ZQtabela.FieldByName('garntcepimov').AsInteger:=cepimovel;
       ZQtabela.FieldByName('mcircunsimov').AsInteger:=circunsimovel;
       ZQtabela.FieldByName('comarcaimov').AsString:=comarcaimovel;
       ZQtabela.FieldByName('nmatrimov').AsInteger:=matimovel;
       ZQtabela.FieldByName('nregimov').AsInteger:=numregistro;
       ZQtabela.FieldByName('averbacaoimov').AsString:=averbimovel;
       ZQtabela.FieldByName('nlivroimov').AsString:=mumlivro;
       ZQtabela.FieldByName('nfolhaimov').AsString:=numfolha;
       ZQtabela.FieldByName('dregimov').AsString:=regimovel;
       //Bens
       ZQtabela.FieldByName('codigoregistrobens').AsString:=cordregbens;
       ZQtabela.FieldByName('cgarntbens').AsInteger:=tipogarantbens;
       ZQtabela.FieldByName('garntdescrbens').AsString:=descbem;
       ZQtabela.FieldByName('vgrantbens').AsFloat:=valorbem;
       //Outros
       ZQtabela.FieldByName('codigoregistrooutros').AsString:=codregoutros;
       ZQtabela.FieldByName('cgarntoutros').AsInteger:=tipogarantoutrosd;
       ZQtabela.FieldByName('garntvgarntoutros').AsFloat:=valoutros;


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

