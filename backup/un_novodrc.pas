unit un_novodrc;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls,
  DBGrids, StdCtrls, Buttons, DbCtrls, ActnList, ExtDlgs, ExtCtrls, DBExtCtrls,
  dados1, DateTimePicker, db, Types;

type

  { TFrmDrcNovo }

  TFrmDrcNovo = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    cbtiporepasse: TComboBox;
    cbid: TComboBox;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    DBNavigator1: TDBNavigator;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    dtGeracaoArquivo: TDateTimePicker;
    dtPagamento: TDateTimePicker;
    dtRemessa: TDateTimePicker;
    dtVencimento: TDateTimePicker;
    DBGrid2: TDBGrid;
    dtrepasse: TDateTimePicker;
    DBGrid1: TDBGrid;
    edtNumContrato: TEdit;
    edtSiglaEmpresa: TEdit;
    edtValorDespesas: TEdit;
    edtValorHonorarios: TEdit;
    edtValorAtualizado: TEdit;
    edtValorInicial: TEdit;
    edtCarteira: TEdit;
    edtConta: TEdit;
    edtAgencia: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label27: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    AbrirArquivo: TOpenDialog;
    Arquvodsps: TOpenDialog;
    PageControl1: TPageControl;
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure DataSource2DataChange(Sender: TObject; Field: TField);
    procedure DataSource3DataChange(Sender: TObject; Field: TField);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBText1Click(Sender: TObject);
    procedure DBText2Click(Sender: TObject);
    procedure DBText3Click(Sender: TObject);
    procedure edtSiglaEmpresaChange(Sender: TObject);
    procedure edtValorAtualizadoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label15Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure TabSheet1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure TabSheet2ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure TabSheet2Enter(Sender: TObject);
    procedure TabSheet2Resize(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
  private
    { private declarations }
  public


    { public declarations }
  end;

var
  FrmDrcNovo: TFrmDrcNovo;

implementation

{$R *.lfm}

{ TFrmDrcNovo }

procedure TFrmDrcNovo.FormCreate(Sender: TObject);
begin
DtmDrcNovo:=TDtmDrcNovo.Create(Self);
TabSheet2.Enabled:=false;
dtPagamento.Date:=now();
dtVencimento.Date:=now();

end;

procedure TFrmDrcNovo.Label15Click(Sender: TObject);
begin

end;

procedure TFrmDrcNovo.Label1Click(Sender: TObject);
begin

end;

procedure TFrmDrcNovo.Label3Click(Sender: TObject);
begin

end;

procedure TFrmDrcNovo.PageControl1Change(Sender: TObject);
begin

end;

procedure TFrmDrcNovo.Panel1Click(Sender: TObject);
begin

end;

procedure TFrmDrcNovo.RadioGroup1Click(Sender: TObject);
begin

end;

procedure TFrmDrcNovo.TabSheet1ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin

end;

procedure TFrmDrcNovo.TabSheet2ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin

end;
{Abre a tab so se estiver selecioando  registro}
procedure TFrmDrcNovo.TabSheet2Enter(Sender: TObject);
begin

end;

procedure TFrmDrcNovo.TabSheet2Resize(Sender: TObject);
begin
  if TabSheet2.Enabled=false then
     begin
      ShowMessage('Selecione um lote para continuar dando um duplo click no lote desejado.');
      PageControl1.ActivePageIndex:=0;
     end;
end;

procedure TFrmDrcNovo.TabSheet2Show(Sender: TObject);
begin
  if TabSheet2.Enabled=false then
       begin
        ShowMessage('Selecione um lote para continuar dando um duplo click no lote desejado.');
        PageControl1.ActivePageIndex:=0;
       end;

end;

procedure TFrmDrcNovo.DataSource1DataChange(Sender: TObject; Field: TField);
begin

end;

procedure TFrmDrcNovo.DataSource2DataChange(Sender: TObject; Field: TField);
begin

end;

procedure TFrmDrcNovo.DataSource3DataChange(Sender: TObject; Field: TField);
begin

end;

procedure TFrmDrcNovo.DBGrid1DblClick(Sender: TObject);
Var lote:Integer;

begin
   lote:=DBGrid1.Columns[4].Field.AsInteger;
   DtmDrcNovo.abrirregistosdrc(lote);
   TabSheet2.Enabled:=True;
   PageControl1.ActivePageIndex:=1;
   Label2.Caption:='LOTE N: '+IntToStr(DBGrid1.Columns[4].Field.AsInteger);
   Label4.Caption:='NOME DA EMPRESA: '+DBGrid1.Columns[1].Field.AsString;
    //DtmDsps.buscaparcelas(DBgrid2.Columns[0].Field.AsString);
   Label21.Caption:='R$ '+CurrToStr(DtmDrcNovo.QuerySomavalorreptotal.AsCurrency+DtmDrcNovo.QuerySomavalorhonototal.AsCurrency);


end;

procedure atualizaTela;
begin
   DtmDrcNovo.abrirregistosdrc(FrmDrcNovo.DBGrid1.Columns[4].Field.AsInteger);
   FrmDrcNovo.TabSheet2.Enabled:=True;
   FrmDrcNovo.PageControl1.ActivePageIndex:=1;
   FrmDrcNovo.Label2.Caption:='LOTE N: '+IntToStr(FrmDrcNovo.DBGrid1.Columns[4].Field.AsInteger);
   FrmDrcNovo.Label4.Caption:='NOME DA EMPRESA: '+FrmDrcNovo.DBGrid1.Columns[1].Field.AsString;
    //DtmDsps.buscaparcelas(DBgrid2.Columns[0].Field.AsString);
   FrmDrcNovo.Label21.Caption:='R$ '+CurrToStr(DtmDrcNovo.QuerySomavalorhonototal.AsCurrency+DtmDrcNovo.QuerySomavalorreptotal.AsCurrency);


end;


procedure checavalores;
Var rec:Integer; a:Integer;
Var vl1:Currency; vl2:Currency; vl3:Currency;
begin
  rec:=DtmDrcNovo.QueryRegistros.RecordCount;
  DtmDrcNovo.QueryRegistros.First;
  for a:=1 to rec do
  begin
  vl1:= FormatFloat('#0.00',DtmDrcNovo.QueryRegistrosvalorhonorario.AsCurrency).ToDouble;
  vl2:= FormatFloat('#0.00',DtmDrcNovo.QueryRegistrosvalorrepasse.AsCurrency).ToDouble;
  vl3:= FormatFloat('#0.00',DtmDrcNovo.QueryRegistrosvalorrecebido.AsCurrency).ToDouble;

  if (vl1+vl2<>vl3) then
      begin
       ShowMessage('O valor do Honorário '+CurrToStr(vl1)+' somando com valor de repasse '+CurrToStr(vl2) +' è diferente do valor recebido '+ CurrToStr(vl3)+'  Na linha '+a.toString);

       DtmDrcNovo.QueryRegistros.Next;
      end
  else

     DtmDrcNovo.QueryRegistros.Next;

  end;
end;

procedure corrigeSoma;
Var rec:Integer; a:Integer;
Var vl1:Currency; vl2:Currency; vl3:Currency;
begin
  rec:=DtmDrcNovo.QueryRegistros.RecordCount;
  DtmDrcNovo.QueryRegistros.First;
  for a:=0 to rec do
  begin
    vl1:= DtmDrcNovo.QueryRegistrosvalorhonorario.AsCurrency; // FormatFloat('#0.00',DtmDrcNovo.QueryRegistrosvalorhonorario.AsCurrency).ToDouble;
    vl2:= DtmDrcNovo.QueryRegistrosvalorrepasse.AsCurrency; //FormatFloat('#0.00',DtmDrcNovo.QueryRegistrosvalorrepasse.AsCurrency).ToDouble;
    vl3:= DtmDrcNovo.QueryRegistrosvalorrecebido.AsCurrency; //FormatFloat('#0.00',DtmDrcNovo.QueryRegistrosvalorrecebido.AsCurrency).ToDouble;
    DtmDrcNovo.QueryRegistros.Edit;
    DtmDrcNovo.QueryRegistrosvalorrecebido.AsCurrency:=vl1+vl2;
    DtmDrcNovo.QueryRegistros.ApplyUpdates;
    DtmDrcNovo.QueryRegistros.Next;
  end;
  ShowMessage('Valores atualizados com sucesso.');
end;


procedure TFrmDrcNovo.DBText1Click(Sender: TObject);
begin
end;

procedure TFrmDrcNovo.DBText2Click(Sender: TObject);
begin

end;

procedure TFrmDrcNovo.DBText3Click(Sender: TObject);
begin

end;

procedure TFrmDrcNovo.edtSiglaEmpresaChange(Sender: TObject);
begin

end;

procedure TFrmDrcNovo.edtValorAtualizadoChange(Sender: TObject);
begin

end;

procedure TFrmDrcNovo.BitBtn1Click(Sender: TObject);
var
  arquivo:String;
begin
  try

       AbrirArquivo.Execute;
       arquivo:=AbrirArquivo.FileName;
       DtmDrcNovo.LeArquivocnab(arquivo,dtrepasse.Date);
       ShowMessage('Inserido com sucesso.');


  except
       ShowMessage('Erro ao inserir dados.');
  end;
end;



procedure TFrmDrcNovo.BitBtn3Click(Sender: TObject);
var
  arquivo,diretorio,nomecompleto,datatexto:String;


begin


     datatexto:=DateToStr(dtGeracaoArquivo.Date);
     arquivo:='PC_CRA_DRCCJ_'+copy(datatexto,7,4)+copy(datatexto,4,2)+copy(datatexto,1,2)+'_'+IntToStr(DBGrid1.Columns[4].Field.AsInteger)+'.txt';



     AbrirArquivo.Title:='NOME DO ARQUIVO';
     AbrirArquivo.FileName:=arquivo;
     AbrirArquivo.Execute;
     nomecompleto:=AbrirArquivo.FileName;

     DtmDrcNovo.GeraArquivoRemessa(datatexto, DBGrid1.Columns[4].Field.AsInteger,RadioGroup1.ItemIndex,nomecompleto,CurrToStr(DtmDrcNovo.QuerySomavalorhonototal.AsCurrency+DtmDrcNovo.QuerySomavalorreptotal.AsCurrency));
      ShowMessage('Arquivo gerado com sucesso.');
end;

procedure TFrmDrcNovo.BitBtn4Click(Sender: TObject);
begin
  case MessageDlg('Realmente deseja excluir os registros?', mtConfirmation, [mbOK, mbCancel], 0) of
  mrOk:
    try
     DtmDrcNovo.ExcluirRegistro(DBGrid1.Columns[4].Field.AsInteger);
     DtmDrcNovo.QueryRegistros.Refresh;

     ShowMessage('Registros excluidos com sucesso !!');

   except
      ShowMessage('Erro ao excluir os registros');
   end;
  mrCancel:
    begin
    // Write code here for pressing button Cancel
    ShowMessage('Operação cancelada!!.');
    end;
     // DataModule1.ExcluirContrato(DBgrid2.Columns[0].Field.AsInteger);
  end;

end;

procedure TFrmDrcNovo.BitBtn5Click(Sender: TObject);
begin
   case MessageDlg('Realmente deseja excluir o lote?', mtConfirmation, [mbOK, mbCancel], 0) of
  mrOk:
    try
     DtmDrcNovo.ExcluirLote(DBGrid1.Columns[4].Field.AsInteger);
     DtmDrcNovo.QueryRegistros.Refresh;
     DtmDrcNovo.QueryHeader.Refresh;
     ShowMessage('Lote excluido com sucesso !!');

   except
      ShowMessage('Erro ao exclui o lote');
   end;
  mrCancel:
    begin
    // Write code here for pressing button Cancel
    ShowMessage('Operação cancelada!!.');
    end;
     // DataModule1.ExcluirContrato(DBgrid2.Columns[0].Field.AsInteger);
  end;
end;

procedure TFrmDrcNovo.BitBtn6Click(Sender: TObject);
var
  arquivo:String;
begin
  try
    AbrirArquivo.Execute;
    arquivo:=AbrirArquivo.FileName;

    //arquabivo,dtrepasse.Date
    DtmDrcNovo.IncluirPlanilha(dtrepasse.Date,arquivo);
    DtmDrcNovo.QueryHeader.Refresh;
    DtmDrcNovo.QueryRegistros.Refresh;
    ShowMessage('Planillha importada com sucesso.');
  except

    ShowMessage('ERROR AO EXPORTAR A PLANILHA!!!, Verifique se os valores estão certos ou o tamanho dos dados estão de acordo com o LAYOUT do arquivo');
  end;

end;

procedure TFrmDrcNovo.Button1Click(Sender: TObject);
begin
  atualizaTela;
  FrmDrcNovo.Refresh;

end;

procedure TFrmDrcNovo.Button2Click(Sender: TObject);
begin
checavalores;
end;

procedure TFrmDrcNovo.Button3Click(Sender: TObject);
begin
    corrigeSoma;
    atualizaTela;
end;



end.

