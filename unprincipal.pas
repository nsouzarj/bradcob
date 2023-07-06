unit unprincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, Forms, Controls, Graphics,
  Dialogs, DBGrids, Buttons, StdCtrls, ComCtrls, ActnList,  db,dados;

type

  { TFrmdrc }

  TFrmdrc = class(TForm)
    ActionList1: TActionList;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    cbIndRegistro: TComboBox;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    dtCredito: TDateTimePicker;
    dtVencTitulo: TDateTimePicker;
    dtOcorrencia: TDateTimePicker;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    edtValorCorreto: TEdit;
    edtOutradespesas: TEdit;
    edtInfCheqBradesco: TEdit;
    edtNumCartorio: TEdit;
    edtSequencial: TEdit;
    edtNumProtocolo: TEdit;
    edtMotRejeicao: TEdit;
    edtOrigemPag: TEdit;
    edtMotivoOcorrencia: TEdit;
    edtOutrosCred: TEdit;
    edtJurosMora: TEdit;
    edtDescConcedido: TEdit;
    edtAbatConcTitulo: TEdit;
    edtIofDevido: TEdit;
    edtJurosAtraso: TEdit;
    edtEspecieTitulo: TEdit;
    edtAgenciaCob: TEdit;
    edtBancoCob: TEdit;
    edtValorTitulo: TEdit;
    edtIndenTituloBAnco: TEdit;
    edtNumDoc: TEdit;
    edtCarteira: TEdit;
    edtOcorrencia: TEdit;
    EdtTipoInsc: TEdit;
    EdtTipoInsc1: TEdit;
    edtNumControle: TEdit;
    edtTituloBanco: TEdit;
    edtIndRatio: TEdit;
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
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;

    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DataSource2DataChange(Sender: TObject; Field: TField);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Label2Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Frmdrc: TFrmdrc;

implementation

{$R *.lfm}

{ TFrmdrc }

procedure TFrmdrc.FormCreate(Sender: TObject);
begin
  DtmDrc:=TDtmDrc.Create(Self);
  //DtmModulo.ZConnection1.Connect;
  DtmDrc.tbdrc.Open;

end;

procedure TFrmdrc.Label2Click(Sender: TObject);
begin

end;

procedure TFrmdrc.DataSource2DataChange(Sender: TObject; Field: TField);
begin

end;

procedure TFrmdrc.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  Frmdrc.Destroy;
end;

procedure TFrmdrc.BitBtn1Click(Sender: TObject);
begin



  dados.DtmDrc.SalvarDados(StrToInt(EdtTipoInsc.text),cbIndRegistro.ItemIndex+1,EdtTipoInsc.text,edtNumControle.text,edtTituloBanco.text,edtIndRatio.Text,edtCarteira.Text,
  edtOcorrencia.text,DateToStr(dtOcorrencia.Date),edtNumDoc.text,edtIndenTituloBAnco.Text,DateToStr(dtVencTitulo.Date),StrToFloat(edtValorTitulo.text),StrToInt(edtBancoCob.text),StrToInt(edtAgenciaCob.Text),edtEspecieTitulo.Text,
  StrToInt(edtOutradespesas.text),StrToInt(edtJurosAtraso.text),StrToInt(edtIofDevido.Text),StrToInt(edtAbatConcTitulo.text),StrToInt(edtDescConcedido.text),StrToInt(edtValorTitulo.Text),StrToInt(edtJurosMora.text),StrToInt(edtOutrosCred.text),edtMotivoOcorrencia.text,
  DateToStr(dtCredito.Date),StrToInt(edtOrigemPag.text),StrToInt(edtInfCheqBradesco.Text),StrToInt(edtMotRejeicao.text),StrToInt(edtNumCartorio.Text),edtNumProtocolo.Text,StrToInt(edtSequencial.Text));





 {
 SalvarDados(idreg,tipoinsc,numinsc:Integer;numcont,idtitulo,idrateio:String;carteira,idcorrencia,dtocorrencia,numdoc,idenTituloBanco,
       dtvenctitulo:String;vltitulo:real;bcobrador, agcob:Integer;esptitulo:String; vlcusto:real;juros,iof,abat,desconcdiod,vlpago,jurosmora,
       outcreditos:Integer;motcorre:String;dtcredito:String;origpagto,qdcheqforbrad,motrejeicao,numcartorio:Integer;numprot:String;seq:Integer);
  }
end;

procedure TFrmdrc.BitBtn3Click(Sender: TObject);
begin
  try
   dados.DtmDrc.GravarArquivo;
   ShowMessage('Arquivo gerado com sucesso.');
  except
  ShowMessage('DEU MERDA!!');

  end;

end;

procedure TFrmdrc.BitBtn4Click(Sender: TObject);
begin


end;

end.

