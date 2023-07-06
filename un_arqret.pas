unit un_arqret;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, DBGrids,
  DbCtrls, Buttons, StdCtrls, undados2, db;

type

  { TFrmArqRet }

  TFrmArqRet = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    OpenDialog1: TOpenDialog;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  FrmArqRet: TFrmArqRet;

implementation

{$R *.lfm}

{ TFrmArqRet }

procedure TFrmArqRet.FormCreate(Sender: TObject);
begin
   DtaModArqRet:=TDtaModArqRet.Create(Self);
   DtaModArqRet.TbArqRet.Open;
end;

procedure TFrmArqRet.DataSource1DataChange(Sender: TObject; Field: TField);
begin

end;

procedure TFrmArqRet.DBGrid1TitleClick(Column: TColumn);
begin
   DtaModArqRet.TbArqRet.IndexFieldNames:=Column.FieldName;
end;


procedure TFrmArqRet.BitBtn1Click(Sender: TObject);
Var
arquivo:String;
begin
   case MessageDlg('Realmente deseja ler o arquivo de retorno?', mtConfirmation, [mbOK, mbCancel], 0) of
  mrOk:
    begin
      OpenDialog1.Execute;
      arquivo:=OpenDialog1.FileName;
      DtaModArqRet.lerarquivo(arquivo);
      ShowMessage('Arquivo lido com sucesso!!.');

    end;
  mrCancel:
    begin
    // Write code here for pressing button Cancel
    ShowMessage('Operação cancelada!!.');
    end;

  end;
end;

procedure TFrmArqRet.BitBtn2Click(Sender: TObject);
Var
arquivo:String;
begin
   case MessageDlg('Realmente deseja salvar a planilha?', mtConfirmation, [mbOK, mbCancel], 0) of
  mrOk:
    begin
      OpenDialog1.Execute;
      arquivo:=OpenDialog1.FileName;
      DtaModArqRet.gerarplanilha(arquivo);
      ShowMessage('Planilha gerada com sucesso !!!');
    end;
  mrCancel:
    begin
    // Write code here for pressing button Cancel
    ShowMessage('Operação cancelada!!.');
    end;
  end;
end;

procedure TFrmArqRet.BitBtn5Click(Sender: TObject);
begin
  DtaModArqRet.excluirlote;
end;

end.

