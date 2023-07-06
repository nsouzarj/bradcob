unit un_principal;

{$mode objfpc}{$H+}

interface

uses       Classes, SysUtils, db, FileUtil, DateTimePicker, Forms, Controls,
  Graphics, Dialogs, DBGrids, Buttons, ComCtrls, StdCtrls, ExtCtrls, MaskEdit,
  DbCtrls, PopupNotifier, LazHelpHTML, un_modulo, Types, process,UniFuncoes;

type

  { TFrmdsps }

  TFrmdsps = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    btCancelarGeral: TBitBtn;
    btAlterarGeral: TBitBtn;
    btAdioionar: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BtExcluir: TBitBtn;
    Button1: TButton;
    CbAto: TComboBox;
    CbTaxaRef: TComboBox;
    CbAcordo: TComboBox;
    CbMeioPagto: TComboBox;
    CbIndAcordo: TComboBox;
    EdtEstadoCli: TComboBox;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DBText2: TDBText;
    dtDataAlteraParcela: TDateTimePicker;
    DBGrid2: TDBGrid;
    DtAcordo: TDateTimePicker;
    DtaDataVenc: TDateTimePicker;
    DtaDataVencParc: TDateTimePicker;
    DtUltimoVenc: TDateTimePicker;
    DtAprovacao: TDateTimePicker;
    DBGrid1: TDBGrid;
    EdtValorHonorario: TEdit;
    edtFilAval2: TEdit;
    edtFilAval1: TEdit;
    edtCrtl2: TEdit;
    edtCrtl1: TEdit;
    edtAtualizarParcelas: TEdit;
    EdtValorConfessado: TEdit;
    EdtCpfAva2: TEdit;
    EdtNomeAvalista2: TEdit;
    EdtCpfAva1: TEdit;
    EdtNomeAvalista1: TEdit;
    EdtObservacao: TEdit;
    EdtComplemnto: TEdit;
    EdtCepComp: TEdit;
    EdtNomeOperador: TEdit;
    EdtTaxaJuros: TEdit;
    EdtCpfCpjFilialCliente: TEdit;
    EdtConCpfCnpjClie: TEdit;
    EdtCpfCnpjClie: TEdit;
    EdtParcPag: TEdit;
    EdtTelefone: TEdit;
    edtddd: TEdit;
    EdtCep: TEdit;
    EdtMunicipioCli: TEdit;
    EdtBairro: TEdit;
    EdtNumEnd: TEdit;
    EdtNomeCliente: TEdit;
    EdtEnderecoCliente: TEdit;
    EdtNumContrato: TEdit;
    EdtNumCarteira: TEdit;
    EdtContaCorrente: TEdit;
    EdtCodJuncao: TEdit;
    EdtQunatParcela: TEdit;
    EdtQunt: TEdit;
    EdtNumAcordo: TEdit;
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
    Label51: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MkValorParcela: TMaskEdit;
    MkValorIof: TMaskEdit;
    MkValorTotalAcordo: TMaskEdit;
    OpenDialog1: TOpenDialog;
    ArquivoArq: TOpenDialog;
    PageControl1: TPageControl;
    Panel2: TPanel;
    SelectDirectoryDialog1: TSelectDirectoryDialog;
    StaticText1: TStaticText;
    Agencia: TStaticText;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
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
                   StrToInt(EdtConCpfCnpjClie.Text),StrToInt(CbMeioPagto.Text),StrToFloat(MkValorIof.Text),StrToCurr(EdtTaxaJuros.Text), CbAcordo.Text,DateToStr(DtAprovacao.Date),EdtNomeOperador.Text,EdtNomeAvalista1.text,EdtCpfAva1.text,EdtNomeAvalista2.Text,EdtCpfAva2.text,StrToCurr(EdtValorConfessado.text),CbIndAcordo.ItemIndex+1,edtFilAval1.Text,edtFilAval2.Text,edtCrtl1.Text,edtCrtl2.Text,id_contrato);
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
                   StrToInt(EdtConCpfCnpjClie.Text),StrToInt(CbMeioPagto.Text),StrToFloat(MkValorIof.Text),StrToCurr(EdtTaxaJuros.Text), CbAcordo.Text,DateToStr(DtAprovacao.Date),EdtNomeOperador.Text,EdtNomeAvalista1.text,EdtCpfAva1.text,EdtNomeAvalista2.Text,EdtCpfAva2.text,StrToCurr(EdtValorConfessado.text),CbIndAcordo.ItemIndex+1,edtFilAval1.Text,edtFilAval2.Text,edtCrtl1.Text,edtCrtl2.Text,id_contrato);
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
         
         valparc:=(StrToFloat(MkValorTotalAcordo.Text)/cont);
         valor:=(valparc*(StrToFloat(EdtTaxaJuros.text)/100));
         valparc:=valparc+valor;
         DtmDsps.SalvarRegistro(CbAto.Text,StrToInt(EdtNumAcordo.Text),DateToStr(DtAcordo.Date),StrToInt(EdtQunt.Text),StrToInt(EdtQunatParcela.Text),
         StrToInt(EdtCodJuncao.text),StrToInt(EdtContaCorrente.Text),EdtNumCarteira.text,StrToInt(EdtNumContrato.text),DateToStr(DtaDataVenc.Date),DateToStr(DtaDataVencParc.Date),
         valparc,StrToFloat(EdtValorHonorario.Text),CbTaxaRef.Text,EdtObservacao.text,EdtNomeCliente.text,EdtEnderecoCliente.text,
         EdtNumEnd.Text,EdtComplemnto.Text,EdtBairro.Text,EdtMunicipioCli.text,EdtEstadoCli.Text,StrToInt(EdtCep.Text),StrToInt(EdtCepComp.Text), edtddd.text,StrToInt(EdtTelefone.text),StrToFloat(MkValorTotalAcordo.Text),DateToStr(DtUltimoVenc.date),
         StrToInt(EdtParcPag.Text),StrToInt(EdtCpfCnpjClie.Text),StrToInt(EdtCpfCpjFilialCliente.Text),
         StrToInt(EdtConCpfCnpjClie.Text),StrToInt(CbMeioPagto.Text),StrToFloat(MkValorIof.Text),StrToCurr(EdtTaxaJuros.Text), CbAcordo.Text,DateToStr(DtAprovacao.Date),EdtNomeOperador.Text,EdtNomeAvalista1.text,EdtCpfAva1.text,EdtNomeAvalista2.Text,EdtCpfAva2.text,StrToCurr(EdtValorConfessado.text),CbIndAcordo.ItemIndex+1,edtFilAval1.Text,edtFilAval2.Text,edtCrtl1.Text,edtCrtl2.Text,id_contrato);
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
         StrToInt(EdtConCpfCnpjClie.Text),StrToInt(CbMeioPagto.Text),StrToFloat(MkValorIof.Text),StrToCurr(EdtTaxaJuros.Text), CbAcordo.Text,DateToStr(DtAprovacao.Date),EdtNomeOperador.Text,EdtNomeAvalista1.text,EdtCpfAva1.text,EdtNomeAvalista2.Text,EdtCpfAva2.text,StrToCurr(EdtValorConfessado.text),CbIndAcordo.ItemIndex+1,edtFilAval1.Text,edtFilAval2.Text,edtCrtl1.Text,edtCrtl2.Text,id_contrato);
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

procedure TFrmdsps.EdtEstadoCliChange(Sender: TObject);
begin

end;

end.

