unit uPadraoCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ComCtrls, ImgList, StdCtrls, Buttons, ActnList, ExtCtrls,
  DBActns;

type
  TfrmPadraoCadastro = class(TForm)
    panelPadrao: TPanel;
    actMenuCadastro: TActionList;
    btnNovo: TBitBtn;
    btnEditar: TBitBtn;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    btnDeletar: TBitBtn;
    btnImprimir: TBitBtn;
    btnPesquisar: TBitBtn;
    btnFechar: TBitBtn;
    imgLista: TImageList;
    stbCadastro: TStatusBar;
    dsCadastro: TDataSource;
    actImprimir: TAction;
    actBuscar: TAction;
    actFechar: TAction;
    actNovo: TAction;
    actEditar: TAction;
    actSalvar: TAction;
    actCancelar: TAction;
    actExcluir: TAction;
    procedure actFecharExecute(Sender: TObject);
    procedure actBuscarExecute(Sender: TObject);
    procedure actImprimirExecute(Sender: TObject);
    procedure actNovoExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPadraoCadastro: TfrmPadraoCadastro;
  acao : Integer;

implementation

{$R *.dfm}

procedure TfrmPadraoCadastro.actFecharExecute(Sender: TObject);
begin
  //fechar a janela de cadastro
  close;
  
end;

procedure TfrmPadraoCadastro.actBuscarExecute(Sender: TObject);
begin
  // abre a tela de busca do sistema
  //
end;

procedure TfrmPadraoCadastro.actImprimirExecute(Sender: TObject);
begin
  // abre a tela de impress�o com os dados informados na tela
end;

procedure TfrmPadraoCadastro.actNovoExecute(Sender: TObject);
begin
  //codigo responsavel por abrir a tabela e colocar em modo de inser��o
  dsCadastro.DataSet.Open;
  dsCadastro.DataSet.Append;
  acao := 1;

  //desabilitando os bot�es
  btnNovo.Enabled := false;
  btnEditar.Enabled := false;
  btnDeletar.Enabled := false;
  btnImprimir.Enabled := false;
  btnPesquisar.Enabled := false;

  //habilitando os bot�es
  btnSalvar.Enabled := true;
  btnCancelar.Enabled := true;

end;

procedure TfrmPadraoCadastro.actEditarExecute(Sender: TObject);
begin
  //codigo responsavel por colocar em modo de edi��o
  dsCadastro.DataSet.Edit;

  //desabilitando os bot�es
  btnNovo.Enabled := false;
  btnEditar.Enabled := false;
  btnDeletar.Enabled := false;
  btnImprimir.Enabled := false;
  btnPesquisar.Enabled := false;

  //habilitando os bot�es
  btnSalvar.Enabled := true;
  btnCancelar.Enabled := true;

end;

procedure TfrmPadraoCadastro.actCancelarExecute(Sender: TObject);
begin
  //codigo responsavel por cancelar a inser��o ou ediu��o
  dsCadastro.DataSet.Cancel;

  //fecha a tabela se cancelado a inser��o
  if acao = 1 then
    dsCadastro.DataSet.Close;

  //desabilitando os bot�es
  btnNovo.Enabled := True;
  btnPesquisar.Enabled := True;

  //habilitando os bot�es
  btnSalvar.Enabled := false;
  btnCancelar.Enabled := false;

  //bot�o de excluir
  if dsCadastro.DataSet.Active then
    begin
      btnDeletar.Enabled := True;
      btnEditar.Enabled := True;
      btnImprimir.Enabled := True;
    end
  else
    begin
      btnDeletar.Enabled := False;
      btnEditar.Enabled := False;
      btnImprimir.Enabled := False;
    end;

end;

procedure TfrmPadraoCadastro.actSalvarExecute(Sender: TObject);
begin
  //codigo responsavel por cancelar a inser��o ou ediu��o
  dsCadastro.DataSet.Post;

  //desabilitando os bot�es
  btnNovo.Enabled := True;
  btnEditar.Enabled := False;
  btnImprimir.Enabled := True;
  btnPesquisar.Enabled := True;

  //habilitando os bot�es
  btnSalvar.Enabled := false;
  btnCancelar.Enabled := false;

  //bot�o de excluir
  if dsCadastro.DataSet.Active then
    btnDeletar.Enabled := True
  else
    btnDeletar.Enabled := False;

end;

procedure TfrmPadraoCadastro.actExcluirExecute(Sender: TObject);
begin
  //confirma��o da a��o
  if messagedlg('Deseja Excluir?',mtconfirmation,mbYesNoCancel,0) = 1 then
    begin
      dsCadastro.DataSet.Delete;
      dsCadastro.DataSet.Close;

      //desabilitando os bot�es
      btnNovo.Enabled := True;
      btnEditar.Enabled := False;
      btnImprimir.Enabled := False;
      btnPesquisar.Enabled := True;
      btnDeletar.Enabled := False;

      //habilitando os bot�es
      btnSalvar.Enabled := false;
      btnCancelar.Enabled := false;
    end


end;

end.
