unit undados2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, conexao, db, ZDataset, ZSqlUpdate,fpspreadsheetctrls,fpsallformats, laz_fpspreadsheet,fpstypes;

type

  { TDtaModArqRet }

  TDtaModArqRet = class(TDataModule)
    TbArqRet: TZQuery;
    TbArqRetagencia: TFloatField;
    TbArqRetcarteira: TStringField;
    TbArqRetconta: TFloatField;
    TbArqRetcontrato: TFloatField;
    TbArqRetcpfadvogado: TFloatField;
    TbArqRetdata_baixa: TDateField;
    TbArqRetdvcto_pcela: TDateField;
    TbArqRetidseq: TLongintField;
    TbArqRettipobaixa: TStringField;
    TbArqRetvalorbaixado: TFloatField;
    ZQuery1: TZQuery;
    ZUpdateSQL1: TZUpdateSQL;
    procedure DataModuleCreate(Sender: TObject);
    procedure lerarquivo(nome:string);
    procedure excluirlote;
    procedure gerarplanilha(nome:String);
  private

  public

  end;

var
  DtaModArqRet: TDtaModArqRet;

implementation

{$R *.lfm}

{ TDtaModArqRet }

procedure TDtaModArqRet.DataModuleCreate(Sender: TObject);
begin

end;

procedure TDtaModArqRet.lerarquivo(nome: string);
var
arquivo:TextFile;
linha:String;
contador:Integer;
data_ret:String;
data_baixa:String;
casa_decimal:String;
valor:String;

begin
   try
     contador:=0;
     AssignFile(arquivo,nome);
     {Abre o  arquivo para leitura}
     Reset(arquivo);
     while(not eof(arquivo)) do
      begin
      {Le a minha do mesmo}
      ReadLn(arquivo,linha);

         TbArqRet.Insert;
         TbArqRetagencia.AsInteger:=StrToInt(copy(linha,1,5));
         TbArqRetconta.AsInteger:=StrToInt(copy(linha,6,7));
         TbArqRetcarteira.AsString:=copy(linha,13,3);
         TbArqRetcontrato.AsInteger:=StrToInt(copy(linha,16,8));
         data_ret:=copy(linha,24,2)+'/'+copy(linha,27,2)+'/'+copy(linha,30,4);
         TbArqRetdvcto_pcela.AsDateTime:=StrToDate(data_ret);
         casa_decimal:=copy(linha,47,2);
         valor:=copy(linha,34,13);
         TbArqRetvalorbaixado.AsFloat:=StrToFloat(valor+','+casa_decimal);

         TbArqRettipobaixa.AsString:=copy(linha,49,1);
         data_baixa:=copy(linha,50,2)+'/'+copy(linha,53,2)+'/'+copy(linha,56,4);
         TbArqRetdata_baixa.AsDateTime:=StrToDate(data_baixa);
         TbArqRetcpfadvogado.AsInteger:=StrToInt(copy(linha,60,9));
         TbArqRet.ApplyUpdates;


       end;
    TbArqRet.Refresh;
    {Fecha o arquivo}
    CloseFile(arquivo);

  except

  end;

end;

procedure TDtaModArqRet.excluirlote;
begin
  TbArqRet.First;
  while not TbArqRet.eof do
   begin;
      TbArqRet.Delete;
      TbArqRet.Refresh;
      TbArqRet.Next;
   end;

end;

{Gera a planilha da prestão de contas}
procedure TDtaModArqRet.gerarplanilha(nome: String);
Var
a:Integer;
format:String;
Planilha1: TsWorkbookSource;

begin
  try
     Planilha1:=TsWorkbookSource.Create(Self);
     begin
       //Cabeçalho da Planilha1
       Planilha1.Workbook.Clear;
       Planilha1.Workbook.AddWorksheet('RETORNO');
       Planilha1.Worksheet.WriteText(0,0,'AGENGIA');
       Planilha1.Worksheet.WriteFontStyle(0,0,[fssBold]);
       Planilha1.Worksheet.WriteText(0,1,'CONTA');
       Planilha1.Worksheet.WriteFontStyle(0,1,[fssBold]);
       Planilha1.Worksheet.WriteText(0,2,'CARTEIRA');
       Planilha1.Worksheet.WriteFontStyle(0,2,[fssBold]);
       Planilha1.Worksheet.WriteText(0,3,'CONTRATO');
       Planilha1.Worksheet.WriteFontStyle(0,3,[fssBold]);
       Planilha1.Worksheet.WriteText(0,4,'DATA PARCELA');
       Planilha1.Worksheet.WriteFontStyle(0,4,[fssBold]);
       Planilha1.Worksheet.WriteText(0,5,'VALOR BAIXADO');
       Planilha1.Worksheet.WriteFontStyle(0,5,[fssBold]);
       Planilha1.Worksheet.WriteText(0,6,'TIPO BAIXA');
       Planilha1.Worksheet.WriteFontStyle(0,6,[fssBold]);
       Planilha1.Worksheet.WriteText(0,7,'DATA BAIXA');
       Planilha1.Worksheet.WriteFontStyle(0,7,[fssBold]);
       Planilha1.Worksheet.WriteText(0,8,'CPF ADVOGADO');
       Planilha1.Worksheet.WriteFontStyle(0,8,[fssBold]);
        a:=0;
        format:='DD/MM/YYYY';
       {Preenche o restante da Planilha1 com od dados da tabela de busca}
       while not  TbArqRet.EOF do
       begin
            a:=a+1;
            Planilha1.Worksheet.WriteNumber(a,0,TbArqRetagencia.AsInteger);
            Planilha1.Worksheet.WriteNumber(a,1,TbArqRetconta.AsInteger);
            Planilha1.Worksheet.WriteText(a,2,TbArqRetcarteira.AsString);
            Planilha1.Worksheet.WriteNumber(a,3,TbArqRetcontrato.AsInteger);
            Planilha1.Worksheet.WriteDateTime(a,4,TbArqRetdvcto_pcela.AsDateTime,format);
            Planilha1.Worksheet.WriteCurrency(a,5,TbArqRetvalorbaixado.AsCurrency);
            Planilha1.Worksheet.WriteText(a,6,TbArqRettipobaixa.Text);
            Planilha1.Worksheet.WriteDateTime(a,7,TbArqRetdata_baixa.AsDateTime,format);
            Planilha1.Worksheet.WriteNumber(a,8,TbArqRetcpfadvogado.AsInteger);
            TbArqRet.Next ;
        end;
        a:=a+4;


      Planilha1.Workbook.WriteToFile(nome+'.xls',sfExcel5);

      Planilha1.Free;
     end;
  except

  end;

end;

end.

