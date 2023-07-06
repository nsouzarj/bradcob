unit dados1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, conexao, db, ZDataset, ZSqlUpdate, UniFuncoes,
  Menus, fpspreadsheetctrls, fpsallformats, laz_fpspreadsheet, fpstypes;

type

  { TDtmDrcNovo }

  TDtmDrcNovo = class(TDataModule)
    QueryHeader: TZQuery;
    QueryHeaderdatarepasse: TDateField;
    QueryHeaderfixo1: TStringField;
    QueryHeaderfixo2: TStringField;
    QueryHeaderfixo3: TStringField;
    QueryHeadernomeempresa: TStringField;
    QueryHeadernumlote: TLongintField;
    QueryRegistros: TZQuery;
    QueryRegistrosagencia: TFloatField;
    QueryRegistroscarteira: TStringField;
    QueryRegistrosconta: TFloatField;
    QueryRegistroscontrato: TFloatField;
    QueryRegistrosdtpagamento: TDateField;
    QueryRegistrosdtremessa: TDateField;
    QueryRegistrosdtvencimento: TDateField;
    QueryRegistrosid_mo_lp: TStringField;
    QueryRegistrosnumagenciaecontacedente: TStringField;
    QueryRegistrosnumeroboleto: TStringField;
    QueryRegistrosnumlote: TLongintField;
    QueryRegistrosregistro: TLongintField;
    QueryRegistrossiglaempresa: TStringField;
    QueryRegistrostipopc: TStringField;
    QueryRegistrosvaloratualizado: TFloatField;
    QueryRegistrosvalordebito: TFloatField;
    QueryRegistrosvalordespesas: TFloatField;
    QueryRegistrosvalorecebidocli: TFloatField;
    QueryRegistrosvalorhonorario: TFloatField;
    QueryRegistrosvalorinicial: TFloatField;
    QueryRegistrosvalorjuros: TFloatField;
    QueryRegistrosvalormulta: TFloatField;
    QueryRegistrosvalorrecebido: TFloatField;
    QueryRegistrosvalorrepasse: TFloatField;
    QueryRegistrosvalortemp: TCurrencyField;
    QuerySomavalorhonototal: TFloatField;
    QuerySomavalorrectotal: TFloatField;
    QuerySomavalorreptotal: TFloatField;
    QueryTrailler: TZQuery;
    QueryTraillerdatarepasse: TDateField;
    QueryTraillerfixo1: TStringField;
    QueryTraillerfixo2: TStringField;
    QueryTraillerfixo3: TStringField;
    QueryTraillernumerolote: TFloatField;
    QueryTraillerquantregistros: TFloatField;
    QueryTraillertotalrepassado: TFloatField;
    QueryExcluiReg: TZQuery;
    QueryExcluirLote: TZQuery;
    QuerySoma: TZReadOnlyQuery;
    ZUpdateSQL1: TZUpdateSQL;
    ZUpdateSQL2: TZUpdateSQL;
    procedure DataModuleCreate(Sender: TObject);
    {Salva o header do arquico}
    procedure AdcionarHeader(data:TDate;  nomeempresa:String);
    {Insedere o registro do arquivo}
    procedure AdcionarRegistro(agencia,conta,carteira,contrato:Integer;dtvencimento,dtremessa:TDate;id:integer;dtpagamento:Tdate;vlinicial,vlatualizado,vlrecibo,
      vljuros,vlmulta,vlhonorario,vldespesas,vldebito,vlrepasse:real;sigla,tipopc,numagencia,nossonum,vlrecebido:Integer);
    {Adciona o trailler do arquivo}
    procedure AdcionarTrailler(datarepasse:Tdate;quantregistros:Integer;totatalrepassado:real);
    {Procedure abre tabela de registros com chave estrangeira}
    procedure abrirregistosdrc(numlote:Integer);
    {Ler arquivo de CNAB}
    procedure LeArquivocnab(nomedoarquivo:String;dtrepasse:Tdate);
    {Ler os dados do arquivo ou registro}
    procedure Leregistroscnab(nomearquivo,sigla,tipopc,idmolp:String;numlote,agencia,conta,carteira,numcontrato:Integer;vlinicial,vlatualizado,vlhonorarios,vldespessas:real;dtvencimnto,dtremessa:Tdate);
    {Gera arquivo de remessa}
    procedure GeraArquivoRemessa(data:String;lote, produto:Integer;arquivo:String;valRec:String);
    {Excluir o lote}
    procedure ExcluirLote(lote:integer);
    {Excluir registros do lote}
    procedure ExcluirRegistro(lote:integer);
    {Adcion planilha ja gerando o cabeslho}
    procedure IncluirPlanilha(data:TDate;origem:String);





  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DtmDrcNovo: TDtmDrcNovo;

implementation

{$R *.lfm}

{ TDtmDrcNovo }

procedure TDtmDrcNovo.DataModuleCreate(Sender: TObject);
begin
  QueryHeader.Open;
  QueryRegistros.Open;

end;

procedure TDtmDrcNovo.AdcionarHeader(data: TDate; nomeempresa:String);
begin

  QueryHeader.Insert;
  QueryHeader.FieldByName('datarepasse').AsDateTime:=data;
  QueryHeader.FieldByName('nomeempresa').AsString:=nomeempresa;
  QueryHeader.ApplyUpdates;
end;

procedure TDtmDrcNovo.AdcionarRegistro(agencia, conta, carteira,
  contrato: Integer; dtvencimento, dtremessa: TDate; id: integer;
  dtpagamento: Tdate; vlinicial, vlatualizado, vlrecibo, vljuros, vlmulta,
  vlhonorario,vldespesas, vldebito, vlrepasse: real; sigla, tipopc, numagencia,
  nossonum, vlrecebido: Integer);
begin
  QueryRegistros.Insert;
  QueryRegistros.FieldByName('agencia').AsInteger:=agencia;
  QueryRegistros.FieldByName('conta').AsInteger:=conta;
  QueryRegistros.FieldByName('carteira').AsInteger:=carteira;
  QueryRegistros.FieldByName('contrato').AsInteger:=contrato;
  QueryRegistros.FieldByName('dtvencimento').AsDateTime:=dtvencimento;
  QueryRegistros.FieldByName('dtremessa').AsDateTime:=dtremessa;
  QueryRegistros.FieldByName('id_mo_lp').AsInteger:=id;
  QueryRegistros.FieldByName('dtpagamento').AsDateTime:=dtpagamento;
  QueryRegistros.FieldByName('valorinicial').AsFloat:=vlinicial;
  QueryRegistros.FieldByName('valoratualizado').AsFloat:=vlatualizado;
  QueryRegistros.FieldByName('valorrecebido').AsFloat:=vlrecibo;
  QueryRegistros.FieldByName('valorjuros').AsFloat:=vljuros;
  QueryRegistros.FieldByName('valormulta').AsFloat:=vlmulta;
  QueryRegistros.FieldByName('valorhonorario').AsFloat:=vlhonorario;
  QueryRegistros.FieldByName('valordespesas').AsFloat:=vldespesas;
  QueryRegistros.FieldByName('valordebito').AsFloat:=vldebito;
  QueryRegistros.FieldByName('valorrepasse').AsFloat:=vlrepasse;
  QueryRegistros.FieldByName('siglaempresa').AsInteger:=sigla;
  QueryRegistros.FieldByName('tipopc').AsInteger:=tipopc;
  QueryRegistros.FieldByName('numagenciaecontacedente').AsInteger:=numagencia;
  QueryRegistros.FieldByName('numeroboleto').AsInteger:=nossonum;
  QueryRegistros.FieldByName('valorrecebidocli').AsInteger:=vlrecebido;
  QueryRegistros.ApplyUpdates;
end;

procedure TDtmDrcNovo.AdcionarTrailler(datarepasse: Tdate;
  quantregistros: Integer; totatalrepassado: real);
begin
  QueryTrailler.Insert;
  QueryTrailler.FieldByName('datarepasse').AsDateTime:=datarepasse;
  QueryTrailler.FieldByName('quantregistros').AsInteger:=quantregistros;
  QueryTrailler.FieldByName('totarepassado').AsFloat:=totatalrepassado;
  QueryTrailler.ApplyUpdates;





end;

procedure TDtmDrcNovo.abrirregistosdrc(numlote:Integer);
begin
  QueryRegistros.Close;
  QueryRegistros.ParamByName('numlote').AsInteger:=numlote;
  QueryRegistros.Open;
  QueryRegistros.Refresh;

  QuerySoma.close;
  QuerySoma.ParamByName('numlote').AsInteger:=numlote;
  QuerySoma.Open;
  QuerySoma.Refresh;
end;

procedure TDtmDrcNovo.LeArquivocnab(nomedoarquivo:String;dtrepasse:Tdate);
var
arquivo:TextFile;
linha:String;
contador:Integer;

begin
  try
     contador:=0;
     AssignFile(arquivo,nomedoarquivo);
     {Abre o  arquivo para leitura}
     Reset(arquivo);
     while(not eof(arquivo)) do
      begin
      {Le a minha do mesmo}
      ReadLn(arquivo,linha);
      contador:=contador+1;
      if (contador=1) then
      begin
         QueryHeader.Insert;
         QueryHeader.FieldByName('datarepasse').AsDateTime:=dtrepasse;
         QueryHeader.FieldByName('nomeempresa').AsString:=copy(linha,47,30);
         QueryHeader.ApplyUpdates;

      end;


    end;

    {Fecha o arquivo}
    CloseFile(arquivo);

  except

  end;




end;

procedure TDtmDrcNovo.Leregistroscnab(nomearquivo,sigla,tipopc,idmolp:String;numlote,agencia,conta,carteira,numcontrato:Integer;vlinicial,vlatualizado,vlhonorarios,vldespessas:real;dtvencimnto,dtremessa:Tdate);
var
arquivo:TextFile;
linha,teste:String;
vlhono,vlrecebido:real;

contador:Integer;
begin
  try
     contador:=0;
     AssignFile(arquivo,nomearquivo);
     {Abre o  arquivo para leitura}
     Reset(arquivo);
     while(not eof(arquivo)) do
      begin
      {Le a minha do mesmo}
      ReadLn(arquivo,linha);


      contador:=contador+1;
      if (contador>1) and (copy(linha,1,1)<>'9') then
      begin

         QueryRegistros.Insert;
         QueryRegistros.FieldByName('agencia').AsInteger:=agencia;
         QueryRegistros.FieldByName('conta').AsInteger:=conta;
         QueryRegistros.FieldByName('carteira').AsInteger:=carteira;
         QueryRegistros.FieldByName('contrato').AsInteger:=numcontrato;
         QueryRegistros.FieldByName('dtvencimento').AsDateTime:=StrToDate(copy(linha,147,2)+'/'+copy(linha,149,2)+'/'+copy(linha,151,2));
         QueryRegistros.FieldByName('dtremessa').AsDateTime:=dtremessa;
         QueryRegistros.FieldByName('id_mo_lp').AsString:=idmolp;

         if(copy(linha,296,2)<> '  ') then
           QueryRegistros.FieldByName('dtpagamento').AsDateTime:= StrToDate(copy(linha,296,2)+'/'+copy(linha,298,2)+'/'+copy(linha,300,2));
         //else
         //  QueryRegistros.FieldByName('dtpagamento').AsDateTime:=null;


         QueryRegistros.FieldByName('valorinicial').AsFloat:=vlinicial;
         QueryRegistros.FieldByName('valoratualizado').AsFloat:=vlatualizado;
         QueryRegistros.FieldByName('valorrecebido').AsFloat:=StrToFloat(copy(linha,254,12))/10;

         if (vlinicial-vlatualizado) < 0 then
         QueryRegistros.FieldByName('valorjuros').AsFloat:=0
         else
          QueryRegistros.FieldByName('valorjuros').AsFloat:=(vlinicial-vlatualizado);

          QueryRegistros.FieldByName('valormulta').AsFloat:=0;
         QueryRegistros.FieldByName('valorhonorario').AsFloat:=vlhonorarios;//StrToFloat(copy(linha,138,17));
         QueryRegistros.FieldByName('valordespesas').AsFloat:=vldespessas;
         vlrecebido:=StrToFloat(copy(linha,254,12))/10;

         QueryRegistros.FieldByName('valordebito').AsFloat:=(vlrecebido-vlhonorarios);
         QueryRegistros.FieldByName('valorrepasse').AsFloat:=StrToFloat(copy(linha,254,12))/10-vlhonorarios-vldespessas;
         QueryRegistros.FieldByName('siglaempresa').AsString:=sigla;
         QueryRegistros.FieldByName('tipopc').AsString:=tipopc;

          QueryRegistros.FieldByName('numagenciaecontacedente').AsString:=copy(linha,25,12);
          QueryRegistros.FieldByName('numeroboleto').AsString:=copy(linha,71,12);
          QueryRegistros.FieldByName('valorecebidocli').AsFloat:=StrToFloat(copy(linha,254,12))/10;
          QueryRegistros.FieldByName('numlote').AsInteger:=numlote;
          QueryRegistros.ApplyUpdates;


      end;


    end;





  except
       ReadLn(arquivo,linha);
      contador:=contador+1;

  end;
       {Fecha o arquivo}
    CloseFile(arquivo);

end;


procedure TDtmDrcNovo.GeraArquivoRemessa(data:String;lote,produto: Integer; arquivo: String; valRec:String);
Var
  arq:TextFile;
  i,c,tb,n,cont:integer;
  somatotal:Currency;
  valorinicial:String;
  valoratualizado:string;
  valorrecebido:String;
  valorjuros:String;
  valormulta:String;
  valorhonorario:String;
  valordespesas:String;
  valordebito:String;
  valorrespasse:String;
  vlorrecebido:String;
  valordoarquivo:String;
  valorrecidocli:String;
  valortotalrecebdido:Currency;
  valorec:String;
  totalregistro:Integer;
  valorExterno:String;

  Func:TFunc;
  agecia_cedente:String;
  conta_cedente,datavazia:String;

begin
   Func:=TFunc.Create;
  try
    AssignFile(arq,arquivo);
    Rewrite(arq);
    valorExterno:=valRec;
    {Verifica o tipo de conta antes de gerar o arquvo}
    if (produto=0) then
        begin
          agecia_cedente:='4130';
          conta_cedente:='202398';
        end
    else if (produto=1) then
    begin
      agecia_cedente:='4130';
      conta_cedente:='202401';
    end;

    WriteLn(arq,Func.LPad('HCAVALCANTE RAMOS ADVOGADOS',' ',41)+Func.LPad(StringReplace(data,'/','',[rfReplaceAll]),' ',8)+Func.LPad(QueryHeaderfixo2.AsString,' ',19)+Func.RPad(IntToStr(QueryHeadernumlote.AsInteger),'0',6)+Func.LPad('',' ',178));

    cont:=QueryRegistros.RecordCount;
    somatotal:=0.00;
    totalregistro:=0;

    for c:=1 to cont do
    begin
    datavazia:=DateToStr(QueryRegistrosdtpagamento.AsDateTime);
    if (QueryRegistrosdtpagamento.AsDateTime > StrToDate('30/12/1899') )then
     begin
           //Formata as casas decimas dos campos para ser escrito arquivo
           valorinicial:= FormatFloat('#0.00',QueryRegistrosvalorinicial.AsCurrency);
           valoratualizado :=FormatFloat('#0.00',QueryRegistrosvaloratualizado.AsCurrency);
           valorrecebido :=FormatFloat('#0.00',QueryRegistrosvalorrecebido.AsCurrency);
           valorjuros:=FormatFloat('#0.00',QueryRegistrosvalorjuros.AsCurrency);
           valormulta:=FormatFloat('#0.00',QueryRegistrosvalormulta.AsCurrency);
           valorhonorario:=FormatFloat('#0.00',QueryRegistrosvalorhonorario.AsCurrency);
           valordespesas:=FormatFloat('#0.00',QueryRegistrosvalordespesas.AsCurrency);
           valordebito:=FormatFloat('#0.00',QueryRegistrosvalordebito.AsCurrency);
           valorrespasse:= FormatFloat('#0.00',QueryRegistrosvalorrepasse.AsCurrency);
           valorrecidocli:=FormatFloat('#0.00',QueryRegistrosvalorecebidocli.AsCurrency);

           {Define aqui o tipo de prestacao de contas vindo da tabela}
           if (QueryRegistrostipopc.AsString='PC') then
           begin
            valortotalrecebdido:= StrToCurr(valormulta)+StrToCurr(valorhonorario)+StrToCurr(valordespesas)+StrToCurr(valorrespasse);
            valorec:=FormatFloat('#0.00',valortotalrecebdido);
           end;

           if(QueryRegistrostipopc.AsString='HO') then
           begin
             valortotalrecebdido:= StrToCurr(valorhonorario)+StrToCurr(valordespesas)+StrToCurr(valorrespasse);
             valorec:=FormatFloat('#0.00',valortotalrecebdido);
           end;

           //Pega a agencia cedente e a conta do arquivo de receebimento
           agecia_cedente:=Func.RPad(IntToStr(QueryRegistrosagencia.AsInteger),'0',4);
           conta_cedente:=Func.Rpad(IntToStr(QueryRegistrosconta.AsInteger),'0' ,7);

           WriteLn(arq,Func.Rpad(agecia_cedente,'0',4)+Func.Rpad(conta_cedente,'0',6)+Func.RPad(QueryRegistroscarteira.AsString,'0',3)+
            Func.RPad(IntToStr(QueryRegistroscontrato.AsInteger),'0',7)+Func.RPad(StringReplace(DateToStr(QueryRegistrosdtvencimento.AsDateTime),'/','',[rfReplaceAll]),' ',8)+Func.RPad(StringReplace(DateToStr(QueryRegistrosdtremessa.AsDateTime),'/','',[rfReplaceAll]),' ',8)
            +QueryRegistrosid_mo_lp.AsString+Func.RPad(StringReplace(DateToStr(QueryRegistrosdtpagamento.AsDateTime),'/','',[rfReplaceAll]),' ',8)+Func.RPad(StringReplace(valorinicial,',','',[rfReplaceAll]),'0',18)
            +Func.RPad(StringReplace(valoratualizado,',','',[rfReplaceAll]),'0',18)+Func.RPad(StringReplace(valorrecebido,',','',[rfReplaceAll]),'0',18)
            +Func.RPad(StringReplace(valorjuros,',','',[rfReplaceAll]),'0',18)+Func.RPad(StringReplace( valormulta,',','',[rfReplaceAll]),'0',18)
            +Func.RPad(StringReplace(valorhonorario,',','',[rfReplaceAll]),'0',18)+Func.RPad(StringReplace(valordespesas,',','',[rfReplaceAll]),'0',18)
            +Func.RPad(StringReplace(valordebito,',','',[rfReplaceAll]),'0',18)+Func.RPad(StringReplace(valorrespasse,',','',[rfReplaceAll]),'0',18)+QueryRegistrossiglaempresa.asString
            +Func.Rpad(QueryRegistrostipopc.AsString,'0',2)+Func.RPad(QueryRegistrosnumagenciaecontacedente.AsString,'0',13)+Func.RPad(QueryRegistrosnumeroboleto.AsString,'0',12) +Func.RPad(StringReplace(valorec,',','',[rfReplaceAll]),'0',13));

     end;
       totalregistro:=totalregistro+1;
       somatotal:=somatotal+ valortotalrecebdido;
       QueryRegistros.Next;
    end;
      valordoarquivo:=FormatFloat('#0.00',StrToCurr(valorExterno));
      WriteLn(arq,'T'+Func.RPad(IntToStr(QueryHeadernumlote.AsInteger),'0',6)+Func.RPad(StringReplace(data,'/','',[rfReplaceAll]),' ',8)+Func.RPad(QueryHeaderfixo2.AsString,'0',19)
      +Func.RPad(IntToStr(totalregistro),'0',9)+ Func.RPad(StringReplace(valordoarquivo,',','',[rfReplaceAll]),'0',15)+Func.RPad(' ',' ',194));
  except
  end;
  CloseFile(arq);
end;

procedure TDtmDrcNovo.ExcluirRegistro(lote: integer);
Var
  recebe:String;
begin
   recebe:=IntToStr(lote);
   QueryExcluiReg.Close;
   QueryExcluiReg.SQL.Clear;
   QueryExcluiReg.SQL.Add('DELETE FROM "TB_DRC_REG"  WHERE numlote='+recebe+'');
   QueryExcluiReg.ExecSQL;
   QueryExcluiReg.Close;
   QueryRegistros.Refresh;
end;

procedure TDtmDrcNovo.IncluirPlanilha(data: TDate;origem:String);
var
PlanilhaLeitura:TsWorkbookSource;
contador:Integer;
ci:String;
datavenc:TDateTime;
formatodata:String;
valormoeda:Currency;
lote:Integer;
begin
  {Primeiro insere o lote}
  QueryHeader.Insert;
  QueryHeader.FieldByName('datarepasse').AsDateTime:=data;
  QueryHeader.FieldByName('nomeempresa').AsString:='CAVALCANTE RAMOS ADVOGADOS' ;
  QueryHeader.ApplyUpdates;
  lote:=QueryHeadernumlote.AsInteger;

  contador:=1;


  {Cria a planilha}
  PlanilhaLeitura:=TsWorkbookSource.Create(Self);
  PlanilhaLeitura.Workbook.Clear;
  PlanilhaLeitura.Workbook.ReadFromFile(origem);
  PlanilhaLeitura.Workbook.GetFirstWorksheet;


  while (Trim(PlanilhaLeitura.Worksheet.ReadAsText(contador,1))<> '') do
  begin
         QueryRegistros.Insert;
         QueryRegistros.FieldByName('agencia').AsInteger:=StrToInt(PlanilhaLeitura.Worksheet.ReadAsText(contador,0));
         QueryRegistros.FieldByName('conta').AsInteger:=StrToInt(PlanilhaLeitura.Worksheet.ReadAsText(contador,1));
         QueryRegistros.FieldByName('carteira').AsString:=PlanilhaLeitura.Worksheet.ReadAsText(contador,2);
         QueryRegistros.FieldByName('contrato').AsInteger:=StrToInt(PlanilhaLeitura.Worksheet.ReadAsText(contador,3));

         ci:=PlanilhaLeitura.Worksheet.ReadAsText(contador,4);
         formatodata:=DateToStr(StrtoInt(ci));
         QueryRegistros.FieldByName('dtvencimento').AsDateTime:= StrToDate(formatodata);


         ci:=PlanilhaLeitura.Worksheet.ReadAsText(contador,5);
         formatodata:=DateToStr(StrtoInt(ci));
         QueryRegistros.FieldByName('dtremessa').AsDateTime:=StrToDate(formatodata);

         QueryRegistros.FieldByName('id_mo_lp').AsString:=PlanilhaLeitura.Worksheet.ReadAsText(contador,6);

         ci:=PlanilhaLeitura.Worksheet.ReadAsText(contador,7);
         formatodata:=DateToStr(StrtoInt(ci));
         QueryRegistros.FieldByName('dtpagamento').AsDateTime:=StrToDate(formatodata);
         QueryRegistros.FieldByName('valorinicial').AsFloat:=StrToFloat(PlanilhaLeitura.Worksheet.ReadAsText(contador,8));
         QueryRegistros.FieldByName('valoratualizado').AsFloat:=StrToFloat(PlanilhaLeitura.Worksheet.ReadAsText(contador,9));
         QueryRegistros.FieldByName('valorrecebido').AsFloat:=StrToFloat(PlanilhaLeitura.Worksheet.ReadAsText(contador,10));
         QueryRegistros.FieldByName('valorjuros').AsFloat:=StrToFloat(PlanilhaLeitura.Worksheet.ReadAsText(contador,11));
         QueryRegistros.FieldByName('valormulta').AsFloat:=StrToFloat(PlanilhaLeitura.Worksheet.ReadAsText(contador,12));
         QueryRegistros.FieldByName('valorhonorario').AsFloat:=StrToFloat(PlanilhaLeitura.Worksheet.ReadAsText(contador,13));
         QueryRegistros.FieldByName('valordespesas').AsFloat:=StrToFloat(PlanilhaLeitura.Worksheet.ReadAsText(contador,14));
         QueryRegistros.FieldByName('valordebito').AsFloat:=StrToFloat(PlanilhaLeitura.Worksheet.ReadAsText(contador,15));
         QueryRegistros.FieldByName('valorrepasse').AsFloat:=StrToFloat(PlanilhaLeitura.Worksheet.ReadAsText(contador,16));
         QueryRegistros.FieldByName('numagenciaecontacedente').AsString:=PlanilhaLeitura.Worksheet.ReadAsText(contador,17);
         QueryRegistros.FieldByName('siglaempresa').AsString:=Trim(PlanilhaLeitura.Worksheet.ReadAsText(contador,18));
         QueryRegistros.FieldByName('numeroboleto').AsString:=Trim(PlanilhaLeitura.Worksheet.ReadAsText(contador,19));
         QueryRegistros.FieldByName('valorecebidocli').AsFloat:=StrToFloat(PlanilhaLeitura.Worksheet.ReadAsText(contador,10));
         QueryRegistros.FieldByName('tipopc').AsString:='PC';

         //QueryRegistros.FieldByName('numagenciaecontacedente').AsString:=copy(linha,25,12);
         //QueryRegistros.FieldByName('numeroboleto').AsString:=copy(linha,71,12);
         //QueryRegistros.FieldByName('valorecebidocli').AsFloat:=StrToFloat(copy(linha,254,12))/10;
         QueryRegistros.FieldByName('numlote').AsInteger:=lote;

         QueryRegistros.ApplyUpdates;


         contador:=contador+1;






  end;

     PlanilhaLeitura.Free;





end;



procedure TDtmDrcNovo.ExcluirLote(lote: integer);
Var
  recebe:String;
begin
   {Apaga primeiro os registros}
   ExcluirRegistro(lote);
   {Apaga depois o header}
   recebe:=IntToStr(lote);
   QueryExcluirLote.Close;
   QueryExcluirLote.SQL.Clear;
   QueryExcluirLote.SQL.Add(' DELETE FROM "TB_DRC_HEADER"   WHERE numlote='+recebe+'');
   QueryExcluirLote.ExecSQL;
   QueryExcluirLote.Close;
   QueryHeader.Refresh;
end;


end.

