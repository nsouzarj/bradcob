unit un_principal;

{$mode objfpc}{$H+}

interface

uses       Classes, SysUtils, db, FileUtil, DateTimePicker, Forms, Controls,
  Graphics, Dialogs, DBGrids, Buttons, ComCtrls, StdCtrls, ExtCtrls, MaskEdit,
  DbCtrls, PopupNotifier, LazHelpHTML, Calendar, EditBtn, un_modulo, Types,
  process, UniFuncoes;

type

  { TFrmdsps }

  TFrmdsps = class(TForm)
    Agencia: TStaticText;
    ArquivoArq: TOpenDialog;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    btAdioionar: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    btAlterarGeral: TBitBtn;
    btCancelarGeral: TBitBtn;
    BtExcluir: TBitBtn;
    Button1: TButton;
    CbAcordo: TComboBox;
    CbAto: TComboBox;
    CbGarantiasBems: TComboBox;
    CbGarantiasOutros: TComboBox;
    CbGarantiasImovel: TComboBox;
    CbIndAcordo: TComboBox;
    CbMeioPagto: TComboBox;
    CbTaxaRef: TComboBox;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DBGrid2: TDBGrid;
    DBText2: TDBText;
    DtAcordo: TDateTimePicker;
    DtaDataVenc: TDateTimePicker;
    DtaDataVencParc: TDateTimePicker;
    DtAprovacao: TDateTimePicker;
    DBGrid1: TDBGrid;
    dtDataAlteraParcela: TDateTimePicker;
    DtUltimoVenc: TDateTimePicker;
    edtCompEnd: TEdit;
    EdtEstadoCliVeic: TComboBox;
    EdtEstadoCliVeicLic: TComboBox;
    edtMarcaVeic: TEdit;
    edtModVeic: TEdit;
    edtNumLivro: TEdit;
    edtNumFolha: TEdit;
    edtRegImovel: TEdit;
    edtCodRegBens: TEdit;
    edtGartBens: TEdit;
    edtDescBem: TEdit;
    edtValBem: TEdit;
    edtCodRegOutros: TEdit;
    edtGarantOutros: TEdit;
    edtBairroImovel: TEdit;
    edtValorGarantOutros: TEdit;
    edtCepImovel: TEdit;
    edtCircusImovel: TEdit;
    edtComarcaImovel: TEdit;
    edtMatImovel: TEdit;
    edtNumRegistroImovel: TEdit;
    edtAvervImovel: TEdit;
    edtNumImovel: TEdit;
    edtCodRegImovel: TEdit;
    edtTipoGarant: TEdit;
    edtValGarantia: TEdit;
    edtEndImovel: TEdit;
    edtProdContratadoVeic: TEdit;
    edtContraRenociado: TEdit;
    edtCorVeic: TEdit;
    edtPorteVeic: TEdit;
    edtNumChassiVeic: TEdit;
    edtChassi1Veic: TEdit;
    edtAnoModVeic: TEdit;
    edtAnoFabVeic: TEdit;
    edtPlacaVeiculo: TEdit;
    edtRenavanVeic: TEdit;
    edtValorGarantVeic: TEdit;
    EdtTipoGaratiaVeic: TEdit;
    edtCodRegistroVeic: TEdit;
    Label52: TLabel;
    edtQuantGarantiaVeic: TEdit;
    edtAtualizarParcelas: TEdit;
    EdtBairro: TEdit;
    EdtCep: TEdit;
    EdtCepComp: TEdit;
    EdtCodJuncao: TEdit;
    EdtComplemnto: TEdit;
    EdtConCpfCnpjClie: TEdit;
    EdtContaCorrente: TEdit;
    EdtCpfAva1: TEdit;
    EdtCpfAva2: TEdit;
    EdtCpfCnpjClie: TEdit;
    EdtCpfCpjFilialCliente: TEdit;
    edtCrtl1: TEdit;
    edtCrtl2: TEdit;
    edtddd: TEdit;
    EdtEnderecoCliente: TEdit;
    EdtEstadoCli: TComboBox;
    edtFilAval1: TEdit;
    edtFilAval2: TEdit;
    EdtMunicipioCli: TEdit;
    EdtNomeAvalista1: TEdit;
    EdtNomeAvalista2: TEdit;
    EdtNomeCliente: TEdit;
    EdtNomeOperador: TEdit;
    EdtNumAcordo: TEdit;
    EdtNumCarteira: TEdit;
    EdtNumContrato: TEdit;
    EdtNumEnd: TEdit;
    EdtObservacao: TEdit;
    EdtParcPag: TEdit;
    EdtQunatParcela: TEdit;
    EdtQunt: TEdit;
    EdtTaxaJuros: TEdit;
    EdtTelefone: TEdit;
    EdtValorConfessado: TEdit;
    EdtValorHonorario: TEdit;
    GroupBox1: TGroupBox;
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
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label4: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label5: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label6: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label7: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label8: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label9: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    MkValorIof: TMaskEdit;
    MkValorParcela: TMaskEdit;
    MkValorTotalAcordo: TMaskEdit;
    OpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    PageControl2: TPageControl;
    Panel2: TPanel;
    SelectDirectoryDialog1: TSelectDirectoryDialog;
    StaticText1: TStaticText;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btAlterarGeralClick(Sender: TObject);
    procedure btCancelarGeralClick(Sender: TObject);
    procedure btAdioionarClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CbIndAcordoChange(Sender: TObject);
    procedure edtChassi1VeicChange(Sender: TObject);
    procedure EdtContaCorrenteChange(Sender: TObject);
    procedure EdtEstadoCliChange(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure DataSource2DataChange(Sender: TObject; Field: TField);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBListBox1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure GroupBox1Click(Sender: TObject);
    procedure Label15Click(Sender: TObject);
    procedure OpenDialog1FolderChange(Sender: TObject);
    procedure OpenDialog1SelectionChange(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure PopupNotifier1Close(Sender: TObject; var CloseAction: TCloseAction
      );

    procedure ProgressBar1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure StaticText2Click(Sender: TObject);
    procedure TabSheet4ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure ZQtabelaCalcFields(DataSet: TDataSet);
  private
    { private declarations }
  public

    { public declarations }
  end;

var
  Frmdsps: TFrmdsps;
  arquivo:string;
  Func:TFunc;

implementation

{$R *.lfm}

{ TFrmdsps }

procedure TFrmdsps.FormCreate(Sender: TObject);
begin
  DtmDsps:=TDtmDsps.Create(Self);
  //DataModule1.ZConnection1.Connect;
  DtmDsps.ZQContrato.Open;
  DtmDsps.ZQtabela.Open;
  Func:=TFunc.Create;
  DtAcordo.Date:=Now;
  DtaDataVenc.Date:=Now;
  DtaDataVencParc.Date:=Now;
  DtAprovacao.Date:=Now;

end;

procedure TFrmdsps.GroupBox1Click(Sender: TObject);
begin

end;

procedure TFrmdsps.Label15Click(Sender: TObject);
begin

end;

procedure TFrmdsps.OpenDialog1FolderChange(Sender: TObject);
begin

end;

procedure TFrmdsps.OpenDialog1SelectionChange(Sender: TObject);
begin
  arquivo:=OpenDialog1.FileName;
end;

procedure TFrmdsps.PageControl1Change(Sender: TObject);
begin

end;

procedure TFrmdsps.PopupNotifier1Close(Sender: TObject;
  var CloseAction: TCloseAction);
begin

end;




procedure TFrmdsps.ProgressBar1ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin

end;

procedure TFrmdsps.StaticText2Click(Sender: TObject);
begin

end;

procedure TFrmdsps.TabSheet4ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin

end;

procedure TFrmdsps.ZQtabelaCalcFields(DataSet: TDataSet);
begin

end;

procedure TFrmdsps.DataSource1DataChange(Sender: TObject; Field: TField);
begin

end;

procedure TFrmdsps.DataSource2DataChange(Sender: TObject; Field: TField);
begin

end;

procedure TFrmdsps.DBGrid2DblClick(Sender: TObject);
begin
  if (DBGrid2.Columns[1].Field.AsString <> '') then
     DtmDsps.buscaparcelas(DBgrid2.Columns[1].Field.AsString)
end;

procedure TFrmdsps.DBListBox1Click(Sender: TObject);
begin

end;

procedure TFrmdsps.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin

   Frmdsps.Close;

end;

procedure TFrmdsps.BitBtn1Click(Sender: TObject);
Var
  datatexto:String;


begin
     try

       datatexto:=DateToStr(now);
       arquivo:='acordo_CRA_'+copy(datatexto,1,2)+copy(datatexto,4,2)+copy(datatexto,9,10)+ Func.RPad(IntToStr(DtmDsps.ZQContratoidcontrato.AsInteger),'0',2)+'.txt';

       ArquivoArq.FileName:=arquivo;
       ArquivoArq.Title:='SALVE O ARQUIVO NO LOCAL ESCOLHIDO';
       ArquivoArq.Execute;

       DtmDsps.GravarArquivo(ArquivoArq.FileName);

        ShowMessage('Arquivo gerado com sucesso !!!');
     except
        ShowMessage('Arquivo não gerado com sucesso !!!');
     end;


end;

procedure TFrmdsps.BitBtn2Click(Sender: TObject);
begin
      EdtNumAcordo.Text:= IntToStr(DtmDsps.ZQtabelanumacordo.AsInteger);
      DtAcordo.Date:=DtmDsps.ZQtabeladataacordo.AsDateTime;
      EdtQunt.Text:=IntToStr(DtmDsps.ZQtabelaquantped.AsInteger);
      EdtQunatParcela.text:=IntToStr(DtmDsps.ZQtabelaquantparc.AsInteger);
      EdtCodJuncao.Text:=IntToStr(DtmDsps.ZQtabelacodjun.AsInteger);
      EdtContaCorrente.Text:=IntToStr(DtmDsps.ZQtabelacontacorrente.AsInteger);
      EdtNumCarteira.Text:=DtmDsps.ZQtabelanumcarteira.AsString;
      EdtNumContrato.Text:=DtmDsps.ZQtabelanumcontrato.AsString;
      DtaDataVenc.Date:=DtmDsps.ZQtabeladatavecimento.AsDateTime;
      DtaDataVencParc.Date:=DtmDsps.ZQtabeladatavencparc.AsDateTime;
      EdtValorHonorario.Text:=FloatToStr(DtmDsps.ZQtabelavalhonor.AsFloat);
      EdtObservacao.text:=DtmDsps.ZQtabelaobs.AsString;
      EdtNomeCliente.Text:=DtmDsps.ZQtabelanomecliente.AsString;
      EdtEnderecoCliente.Text:=DtmDsps.ZQtabelaendcliente.AsString;
      EdtNumEnd.Text:=DtmDsps.ZQtabelanum.AsString;
      EdtComplemnto.Text:=DtmDsps.ZQtabelacomplemnto.AsString;
      EdtBairro.Text:=DtmDsps.ZQtabelabairro.AsString;
      EdtMunicipioCli.Text:=DtmDsps.ZQtabelamunicipio.AsString;
      EdtEstadoCli.Text:=DtmDsps.ZQtabelaunidadefed.AsString;
      EdtCep.Text:=IntToStr(DtmDsps.ZQtabelacepcliente.AsInteger);
      EdtCepComp.Text:=IntToStr(DtmDsps.ZQtabelacomplecep.AsInteger);
      edtddd.Text:=DtmDsps.ZQtabeladddcliente.AsString;
      EdtTelefone.Text:=IntToStr(DtmDsps.ZQtabelatelcliente.AsInteger);
      DtUltimoVenc.Date:=DtmDsps.ZQtabeladatavencult.AsDateTime;
      EdtParcPag.Text:=IntToStr(DtmDsps.ZQtabelaparcelaplanoultimopag.AsInteger);
      EdtCpfCnpjClie.Text:=IntToStr(DtmDsps.ZQtabelacpfcnpjcliente.AsInteger);
      EdtCpfCpjFilialCliente.Text:=IntToStr(DtmDsps.ZQtabelacpfcnpjfilialcliente.AsInteger); ;
      EdtConCpfCnpjClie.Text:=IntToStr(DtmDsps.ZQtabelacontrolecpfcnpjcliente.AsInteger);
      CbMeioPagto.ItemIndex:=DtmDsps.ZQtabelacodmeiopagamento.AsInteger;
      EdtTaxaJuros.Text:=IntToStr(DtmDsps.ZQtabelataxajuros.AsInteger);
      CbAcordo.Text:=DtmDsps.ZQtabelaacordoaprovadopelodarc.AsString;
      DtAprovacao.Date:=DtmDsps.ZQtabeladataaprovacao.AsDateTime;
      EdtNomeOperador.Text:=DtmDsps.ZQtabelanomeoperador.AsString;
      MkValorTotalAcordo.Text:= FloatToStr(DtmDsps.ZQtabelavaloracordo.AsFloat);
      MkValorParcela.Text:=FloatToStr(DtmDsps.ZQtabelavalparc.AsFloat);
      MkValorIof.Text:=FloatToStr(DtmDsps.ZQtabelavaloriof.AsFloat);
      EdtNomeAvalista1.Text:=DtmDsps.ZQtabelanomeavalista1.Text;
      EdtCpfAva1.Text:=DtmDsps.ZQtabelacpfavalista1.AsString;
      edtCrtl1.Text:=DtmDsps.ZQtabelactrlav1.AsString;
      edtFilAval1.Text:=DtmDsps.ZQtabelafilav1.AsString;

      EdtNomeAvalista2.Text:=DtmDsps.ZQtabelanomeavalista2.Text;
      EdtCpfAva2.Text:=DtmDsps.ZQtabelacpfavalista2.AsString;
      edtCrtl2.Text:=DtmDsps.ZQtabelactrlav2.AsString;
      edtFilAval2.Text:=DtmDsps.ZQtabelafilav2.AsString;
      EdtValorConfessado.Text:=FloatToStr(DtmDsps.ZQtabelavalorconfessado.AsFloat);
      CbIndAcordo.Text:=IntToStr(DtmDsps.ZQtabelaindacordo.AsInteger);

      btAlterarGeral.Visible:=true;
      btCancelarGeral.Visible:=true;
      btAdioionar.Visible:=false;;


end;

procedure TFrmdsps.btAlterarGeralClick(Sender: TObject);
Var
  cont,a,mes,id_contrato:Integer;
  valparc,valor:Real;
  dataproxima:TDate;
  parcelaatualizada:Real;
begin
    case MessageDlg('Realmente deseja alterar os registro?', mtConfirmation, [mbOK, mbCancel], 0) of
  mrOk:

         begin

            DtmDsps.alteradados(DBgrid2.Columns[0].Field.AsInteger,DBgrid2.Columns[1].Field.AsInteger);
            DtmDsps.buscaparcelas(EdtNumContrato.Text);

            cont:=StrToInt(EdtQunatParcela.Text);
            id_contrato:=DBgrid2.Columns[0].Field.AsInteger;
            a:=0;
            mes:=0;

            //Aqui adciona mais registro
            if (cont > 1) then

               // valparc:=(StrToFloat(MkValorTotalAcordo.Text)/cont);
               // valor:=(valparc*(StrToFloat(EdtTaxaJuros.text)/100));

               // valparc:=valparc+valor;
            for a:=1 to cont do
             begin
               if a=1 then
               begin
                   // Calcular a parcela com o percentual

                   valparc:=(StrToFloat(MkValorTotalAcordo.Text)/cont);
                   valor:=(valparc*(StrToFloat(EdtTaxaJuros.text)/100));
                   valparc:=valparc+valor;

                   DtmDsps.SalvarRegistro(CbAto.Text,StrToInt(EdtNumAcordo.Text),DateToStr(DtAcordo.Date),StrToInt(EdtQunt.Text),StrToInt(EdtQunatParcela.Text),
                   StrToInt(EdtCodJuncao.text),StrToInt(EdtContaCorrente.Text),EdtNumCarteira.text,StrToInt(EdtNumContrato.text),DateToStr(DtaDataVenc.Date),DateToStr(DtaDataVencParc.Date),
                   valparc,StrToFloat(EdtValorHonorario.Text),CbTaxaRef.Text,EdtObservacao.text,EdtNomeCliente.text,EdtEnderecoCliente.text,
                   EdtNumEnd.Text,EdtComplemnto.Text,EdtBairro.Text,EdtMunicipioCli.text,EdtEstadoCli.text,StrToInt(EdtCep.Text),StrToInt(EdtCepComp.Text), edtddd.text,StrToInt(EdtTelefone.text),StrToFloat(MkValorTotalAcordo.Text),DateToStr(DtUltimoVenc.date),
                   StrToInt(EdtParcPag.Text),StrToInt(EdtCpfCnpjClie.Text),StrToInt(EdtCpfCpjFilialCliente.Text),
                   StrToInt(EdtConCpfCnpjClie.Text),StrToInt(CbMeioPagto.Text),StrToFloat(MkValorIof.Text),StrToCurr(EdtTaxaJuros.Text), CbAcordo.Text,
                   DateToStr(DtAprovacao.Date),EdtNomeOperador.Text,EdtNomeAvalista1.text,EdtCpfAva1.text,EdtNomeAvalista2.Text,EdtCpfAva2.text,StrToCurr(EdtValorConfessado.text),
                   CbIndAcordo.ItemIndex+1,edtFilAval1.Text,edtFilAval2.Text,edtCrtl1.Text,edtCrtl2.Text,id_contrato,
                   edtCodRegistroVeic.Text,StrToInt(edtQuantGarantiaVeic.Text), StrToInt(EdtTipoGaratiaVeic.Text),StrToFloat(edtValorGarantVeic.Text),
                   StrToInt(edtRenavanVeic.Text), edtPlacaVeiculo.Text, EdtEstadoCliVeic.Text, StrToInt(edtAnoFabVeic.Text), StrToInt(edtAnoModVeic.Text),
                    EdtEstadoCliVeicLic.Text,StrToInt(edtChassi1Veic.Text),edtNumChassiVeic.Text, StrToInt(edtProdContratadoVeic.Text), StrToInt(edtContraRenociado.Text),
                   edtMarcaVeic.Text, edtModVeic.Text,edtCorVeic.Text,StrToInt(edtPorteVeic.Text),edtCodRegImovel.Text, StrToInt(edtTipoGarant.Text),
                   StrToFloat(edtValGarantia.Text),edtEndImovel.Text,StrToInt(edtNumImovel.Text),edtCompEnd.Text,edtBairroImovel.Text,StrToInt(edtCepImovel.Text),StrToInt(edtCircusImovel.Text),edtComarcaImovel.Text,
                   StrToInt(edtMatImovel.Text),StrToInt(edtNumRegistroImovel.Text),edtAvervImovel.Text,edtNumLivro.Text,edtNumFolha.Text,edtRegImovel.Text,edtCodRegBens.Text,StrToInt(edtGartBens.Text),
                   edtDescBem.Text,StrToFloat(edtValBem.Text), edtCodRegOutros.Text, StrToInt(edtGarantOutros.Text),StrToFloat(edtValorGarantOutros.Text));
               end;
               if(a > 1) then
               begin
                   mes:=mes+1;
                   dataproxima:=IncMonth(DtaDataVencParc.Date,mes);
                   valparc:=(StrToFloat(MkValorTotalAcordo.Text)/cont);
                   valor:=(valparc*(StrToFloat(EdtTaxaJuros.text)/100));
                   valparc:=valparc+valor;

                   //Insere na tabela os dados capturados da tabela
                   DtmDsps.SalvarRegistro('N',StrToInt(EdtNumAcordo.Text),DateToStr(DtAcordo.Date),StrToInt(EdtQunt.Text),StrToInt(EdtQunatParcela.Text),
                   StrToInt(EdtCodJuncao.text),StrToInt(EdtContaCorrente.Text),EdtNumCarteira.text,StrToInt(EdtNumContrato.text),DateToStr(DtaDataVenc.Date),DateToStr(dataproxima),
                   valparc,StrToCurr(EdtValorHonorario.Text),CbTaxaRef.Text,EdtObservacao.text,EdtNomeCliente.text,EdtEnderecoCliente.text,
                   EdtNumEnd.Text,EdtComplemnto.Text,EdtBairro.Text,EdtMunicipioCli.text,EdtEstadoCli.text,StrToInt(EdtCep.Text),StrToInt(EdtCepComp.Text), edtddd.text,StrToInt(EdtTelefone.text),StrToCurr(MkValorTotalAcordo.Text),DateToStr(DtUltimoVenc.date),
                   StrToInt(EdtParcPag.Text),StrToInt(EdtCpfCnpjClie.Text),StrToInt(EdtCpfCpjFilialCliente.Text),
                   StrToInt(EdtConCpfCnpjClie.Text),StrToInt(CbMeioPagto.Text),StrToFloat(MkValorIof.Text),StrToCurr(EdtTaxaJuros.Text), CbAcordo.Text,
                   DateToStr(DtAprovacao.Date),EdtNomeOperador.Text,EdtNomeAvalista1.text,EdtCpfAva1.text,EdtNomeAvalista2.Text,EdtCpfAva2.text,StrToCurr(EdtValorConfessado.text),
                   CbIndAcordo.ItemIndex+1,edtFilAval1.Text,edtFilAval2.Text,edtCrtl1.Text,edtCrtl2.Text,id_contrato,
                   edtCodRegistroVeic.Text,StrToInt(edtQuantGarantiaVeic.Text), StrToInt(EdtTipoGaratiaVeic.Text),StrToFloat(edtValorGarantVeic.Text),
                   StrToInt(edtRenavanVeic.Text), edtPlacaVeiculo.Text, EdtEstadoCliVeic.Text, StrToInt(edtAnoFabVeic.Text), StrToInt(edtAnoModVeic.Text),
                   EdtEstadoCliVeicLic.Text,StrToInt(edtChassi1Veic.Text),edtNumChassiVeic.Text, StrToInt(edtProdContratadoVeic.Text), StrToInt(edtContraRenociado.Text),
                   edtMarcaVeic.Text, edtModVeic.Text,edtCorVeic.Text,StrToInt(edtPorteVeic.Text),edtCodRegImovel.Text, StrToInt(edtTipoGarant.Text),
                   StrToFloat(edtValGarantia.Text),edtEndImovel.Text,StrToInt(edtNumImovel.Text),edtCompEnd.Text,edtBairroImovel.Text,StrToInt(edtCepImovel.Text),StrToInt(edtCircusImovel.Text),edtComarcaImovel.Text,
                   StrToInt(edtMatImovel.Text),StrToInt(edtNumRegistroImovel.Text),edtAvervImovel.Text,edtNumLivro.Text,edtNumFolha.Text,edtRegImovel.Text,edtCodRegBens.Text,StrToInt(edtGartBens.Text),
                   edtDescBem.Text,StrToFloat(edtValBem.Text), edtCodRegOutros.Text, StrToInt(edtGarantOutros.Text),StrToFloat(edtValorGarantOutros.Text));
               end;
             end;
             ShowMessage('Opreção concluída com sucesso !!!');
             btAdioionar.Visible:=true;
             btAlterarGeral.Visible:=false;
             btCancelarGeral.Visible:=false;;
           end;

  mrCancel:
    begin
    // Write code here for pressing button Cancel
    ShowMessage('Operação cancelada!!.');
    end;
     // DataModule1.ExcluirContrato(DBgrid2.Columns[0].Field.AsInteger);
  end;
end;

procedure TFrmdsps.btCancelarGeralClick(Sender: TObject);
begin
  btAdioionar.Visible:=true;
  btCancelarGeral.Visible:=false;
  btAlterarGeral.Visible:=false;
end;

procedure TFrmdsps.btAdioionarClick(Sender: TObject);
Var
  cont,a,mes,id_contrato:Integer;
  valparc,valor:Real;
  dataproxima:TDate;
  parcelaatualizada:Real;
begin
  if (EdtNomeCliente.Text<>'') then
  begin

  DtmDsps.SalvarAcordo(StrToInt(EdtNumContrato.Text),DtAcordo.Date,StrToCurr(MkValorTotalAcordo.Text));



  DtmDsps.buscaparcelas(EdtNumContrato.Text);
  cont:=StrToInt(EdtQunatParcela.Text);
  id_contrato:=DtmDsps.ZQContratoidcontrato.AsInteger;
  a:=0;
  mes:=0;

  //Aqui adciona mais registro
  if (cont >= 1) then

     // valparc:=(StrToFloat(MkValorTotalAcordo.Text)/cont);
     // valor:=(valparc*(StrToFloat(EdtTaxaJuros.text)/100));

     // valparc:=valparc+valor;
  for a:=1 to cont do
   begin
     if a=1 then
     begin
         // Calcular a parcela com o percentual
         //Insere na tabela os dados capturados da tela de entrada
         
         valparc:=(StrToFloat(MkValorTotalAcordo.Text)/cont);
         valor:=(valparc*(StrToFloat(EdtTaxaJuros.text)/100));
         valparc:=valparc+valor;
         DtmDsps.SalvarRegistro(CbAto.Text,StrToInt(EdtNumAcordo.Text),DateToStr(DtAcordo.Date),StrToInt(EdtQunt.Text),StrToInt(EdtQunatParcela.Text),
         StrToInt(EdtCodJuncao.text),StrToInt(EdtContaCorrente.Text),EdtNumCarteira.text,StrToInt(EdtNumContrato.text),DateToStr(DtaDataVenc.Date),DateToStr(DtaDataVencParc.Date),
         valparc,StrToFloat(EdtValorHonorario.Text),CbTaxaRef.Text,EdtObservacao.text,EdtNomeCliente.text,EdtEnderecoCliente.text,
         EdtNumEnd.Text,EdtComplemnto.Text,EdtBairro.Text,EdtMunicipioCli.text,EdtEstadoCli.Text,StrToInt(EdtCep.Text),StrToInt(EdtCepComp.Text), edtddd.text,StrToInt(EdtTelefone.text),StrToFloat(MkValorTotalAcordo.Text),DateToStr(DtUltimoVenc.date),
         StrToInt(EdtParcPag.Text),StrToInt(EdtCpfCnpjClie.Text),StrToInt(EdtCpfCpjFilialCliente.Text),
         StrToInt(EdtConCpfCnpjClie.Text),StrToInt(CbMeioPagto.Text),StrToFloat(MkValorIof.Text),StrToCurr(EdtTaxaJuros.Text),
         CbAcordo.Text,DateToStr(DtAprovacao.Date),EdtNomeOperador.Text,EdtNomeAvalista1.text,EdtCpfAva1.text,EdtNomeAvalista2.Text,
         EdtCpfAva2.text,StrToCurr(EdtValorConfessado.text),CbIndAcordo.ItemIndex+1,edtFilAval1.Text,edtFilAval2.Text,edtCrtl1.Text,edtCrtl2.Text,id_contrato,
         edtCodRegistroVeic.Text,StrToInt(edtQuantGarantiaVeic.Text), StrToInt(EdtTipoGaratiaVeic.Text),StrToFloat(edtValorGarantVeic.Text),
         StrToInt(edtRenavanVeic.Text), edtPlacaVeiculo.Text, EdtEstadoCliVeic.Text, StrToInt(edtAnoFabVeic.Text), StrToInt(edtAnoModVeic.Text),
         EdtEstadoCliVeicLic.Text,StrToInt(edtChassi1Veic.Text),edtNumChassiVeic.Text, StrToInt(edtProdContratadoVeic.Text), StrToInt(edtContraRenociado.Text),
         edtMarcaVeic.Text, edtModVeic.Text,edtCorVeic.Text,StrToInt(edtPorteVeic.Text),edtCodRegImovel.Text, CbGarantiasImovel.ItemIndex,
         StrToFloat(edtValGarantia.Text),edtEndImovel.Text,StrToInt(edtNumImovel.Text),edtCompEnd.Text,edtBairroImovel.Text,StrToInt(edtCepImovel.Text),StrToInt(edtCircusImovel.Text),edtComarcaImovel.Text,
         StrToInt(edtMatImovel.Text),StrToInt(edtNumRegistroImovel.Text),edtAvervImovel.Text,edtNumLivro.Text,edtNumFolha.Text,edtRegImovel.Text,edtCodRegBens.Text,CbGarantiasBems.ItemIndex ,
         edtDescBem.Text,StrToFloat(edtValBem.Text), edtCodRegOutros.Text, CbGarantiasOutros.ItemIndex ,StrToFloat(edtValorGarantOutros.Text));
         // StrToInt(edtTipoGarant.Text)
         //StrToInt(edtGartBens.Text)
         //StrToInt(edtGarantOutros.Text)

     end;
     if(a > 1) then
     begin
         mes:=mes+1;
         dataproxima:=IncMonth(DtaDataVencParc.Date,mes);
         valparc:=(StrToFloat(MkValorTotalAcordo.Text)/cont);
         valor:=(valparc*(StrToFloat(EdtTaxaJuros.text)/100));
         valparc:=valparc+valor;

         //Insere na tabela os dados capturados da tela de entrada
         DtmDsps.SalvarRegistro('N',StrToInt(EdtNumAcordo.Text),DateToStr(DtAcordo.Date),StrToInt(EdtQunt.Text),StrToInt(EdtQunatParcela.Text),
         StrToInt(EdtCodJuncao.text),StrToInt(EdtContaCorrente.Text),EdtNumCarteira.text,StrToInt(EdtNumContrato.text),DateToStr(DtaDataVenc.Date),DateToStr(dataproxima),
         valparc,StrToCurr(EdtValorHonorario.Text),CbTaxaRef.Text,EdtObservacao.text,EdtNomeCliente.text,EdtEnderecoCliente.text,
         EdtNumEnd.Text,EdtComplemnto.Text,EdtBairro.Text,EdtMunicipioCli.text,EdtEstadoCli.text,StrToInt(EdtCep.Text),StrToInt(EdtCepComp.Text), edtddd.text,StrToInt(EdtTelefone.text),StrToCurr(MkValorTotalAcordo.Text),DateToStr(DtUltimoVenc.date),
         StrToInt(EdtParcPag.Text),StrToInt(EdtCpfCnpjClie.Text),StrToInt(EdtCpfCpjFilialCliente.Text),
         StrToInt(EdtConCpfCnpjClie.Text),StrToInt(CbMeioPagto.Text),StrToFloat(MkValorIof.Text),StrToCurr(EdtTaxaJuros.Text),
         CbAcordo.Text,DateToStr(DtAprovacao.Date),EdtNomeOperador.Text,EdtNomeAvalista1.text,EdtCpfAva1.text,EdtNomeAvalista2.Text,EdtCpfAva2.text,
         StrToCurr(EdtValorConfessado.text),CbIndAcordo.ItemIndex+1,edtFilAval1.Text,edtFilAval2.Text,edtCrtl1.Text,edtCrtl2.Text,id_contrato,
         edtCodRegistroVeic.Text,StrToInt(edtQuantGarantiaVeic.Text), StrToInt(EdtTipoGaratiaVeic.Text),StrToFloat(edtValorGarantVeic.Text),
         StrToInt(edtRenavanVeic.Text), edtPlacaVeiculo.Text, EdtEstadoCliVeic.Text, StrToInt(edtAnoFabVeic.Text), StrToInt(edtAnoModVeic.Text),
         EdtEstadoCliVeicLic.Text,StrToInt(edtChassi1Veic.Text),edtNumChassiVeic.Text, StrToInt(edtProdContratadoVeic.Text), StrToInt(edtContraRenociado.Text),
         edtMarcaVeic.Text, edtModVeic.Text,edtCorVeic.Text,StrToInt(edtPorteVeic.Text),edtCodRegImovel.Text, CbGarantiasImovel.ItemIndex,
         StrToFloat(edtValGarantia.Text),edtEndImovel.Text,StrToInt(edtNumImovel.Text),edtCompEnd.Text,edtBairroImovel.Text,StrToInt(edtCepImovel.Text),StrToInt(edtCircusImovel.Text),edtComarcaImovel.Text,
         StrToInt(edtMatImovel.Text),StrToInt(edtNumRegistroImovel.Text),edtAvervImovel.Text,edtNumLivro.Text,edtNumFolha.Text,edtRegImovel.Text,edtCodRegBens.Text,CbGarantiasBems.ItemIndex,
         edtDescBem.Text,StrToFloat(edtValBem.Text), edtCodRegOutros.Text, CbGarantiasOutros.ItemIndex,StrToFloat(edtValorGarantOutros.Text));
     end;
   end;
    DtmDsps.ZQContrato.Refresh;
    DtmDsps.ZQtabela.Refresh;
    ShowMessage('Parcelas lançadas !!!');

  end

  else
   ShowMessage('Nome do cliente não pode estar vazio !!!');

end;

procedure TFrmdsps.BitBtn3Click(Sender: TObject);
begin
  DtmDsps.abrir;
end;

//Esta procedure ler o aruivo de retorno
procedure TFrmdsps.BitBtn4Click(Sender: TObject);
Var nome:String;
begin

  case MessageDlg('Realmente deseja ler o arquivo de retorno?', mtConfirmation, [mbOK, mbCancel], 0) of
  mrOk:
    begin
     OpenDialog1.Execute;
     DtmDsps.LerArquivo(arquivo,DBgrid2.Columns[1].Field.AsInteger);
      ShowMessage('Arquivo lido com sucesso!!.');

    end;
  mrCancel:
    begin
    // Write code here for pressing button Cancel
    ShowMessage('Operação cancelada!!.');
    end;

  end;




end;
//Atualiza as parcelas do contrato
procedure TFrmdsps.BitBtn5Click(Sender: TObject);
begin
  case MessageDlg('Realmente deseja atualizar as parcelas?', mtConfirmation, [mbOK, mbCancel], 0) of
  mrOk:
    begin
      if StrToFloat(edtAtualizarParcelas.text) > 0  then
      begin
         DtmDsps.atualizaparcelas(DBgrid2.Columns[0].Field.AsInteger,DBgrid2.Columns[1].Field.AsInteger,StrToFloat(edtAtualizarParcelas.Text));
         ShowMessage('Parcelas atualizadas com sucesso!!.');
         edtAtualizarParcelas.text:='0';
      end
      else
        ShowMessage('Parcelas não podem ser atualizadas com valor 0!!.');

    end;
  mrCancel:
    begin
    // Write code here for pressing button Cancel
     ShowMessage('Operação cancelada!!.');
     edtAtualizarParcelas.text:='0';
     Frmdsps.Refresh;
    end;

  end;



end;

procedure TFrmdsps.BitBtn6Click(Sender: TObject);
begin
  try



     DtmDsps.ZQtabela.ApplyUpdates;
     DtmDsps.ZQtabela.Refresh;
     ShowMessage('Valor alterado con sucesso.');
  except
     ShowMessage('Erro ao alterar o registro.');

  end;




end;

//Exclui os registro d
procedure TFrmdsps.BtExcluirClick(Sender: TObject);
begin
  case MessageDlg('Realmente deseja excluir os registro?', mtConfirmation, [mbOK, mbCancel], 0) of
  mrOk:
    begin
    // Write code here for pressing button OK
    DtmDsps.ExcluirContrato(DBgrid2.Columns[0].Field.AsInteger,DBgrid2.Columns[1].Field.AsInteger);
    ShowMessage('Excluído com sucesso!!.');
    end;
  mrCancel:
    begin
    // Write code here for pressing button Cancel
    ShowMessage('Operação cancelada!!.');
    end;
     // DataModule1.ExcluirContrato(DBgrid2.Columns[0].Field.AsInteger);
  end;

end;

procedure TFrmdsps.Button1Click(Sender: TObject);
Var
  dataproxima:TDate;
  contador,mes:Integer;
begin
  contador:=0;
  mes:=0;
  while not (DtmDsps.ZQtabela.Eof) and (DtmDsps.ZQtabelanumcontrato.AsInteger=DBgrid2.Columns[1].Field.AsInteger) do
  begin
     DtmDsps.ZQtabela.Edit;

     if contador=0 then
     begin
        DtmDsps.ZQtabeladatavencparc.AsString:=DateToStr(dtDataAlteraParcela.DateTime);
        DtmDsps.ZQtabela.ApplyUpdates;
     end
     else
        begin
         mes:=mes+1;
         dataproxima:=IncMonth(dtDataAlteraParcela.DateTime,mes);
         DtmDsps.ZQtabeladatavencparc.AsString:=DateToStr(dataproxima);
         DtmDsps.ZQtabela.ApplyUpdates;
        end;
     contador:=contador+1;
     DtmDsps.ZQtabela.Next;
  end;
  ShowMessage('Data atualizada com sucesso');
end;

procedure TFrmdsps.CbIndAcordoChange(Sender: TObject);
begin

end;

procedure TFrmdsps.edtChassi1VeicChange(Sender: TObject);
begin

end;

procedure TFrmdsps.EdtContaCorrenteChange(Sender: TObject);
begin

end;

procedure TFrmdsps.EdtEstadoCliChange(Sender: TObject);
begin

end;

end.

