unit UnitLoginUsuario;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.Edit, FMX.Layouts, FMX.Objects, FMX.TabControl,
  FMX.StdCtrls, FireDAC.Comp.Client, FireDAC.DApt,
  System.Actions, IdHashSHA, FMX.ActnList;

type
  TFrmLoginUsuario = class(TForm)
    Layout1: TLayout;
    Image1: TImage;
    Layout2: TLayout;
    RoundRectEmail: TRoundRect;
    StyleBook1: TStyleBook;
    Layout3: TLayout;
    RoundRectSenha: TRoundRect;
    EditSenha: TEdit;
    Layout4: TLayout;
    Acessar: TLabel;
    TabControl1: TTabControl;
    TabLogin: TTabItem;
    TabConta: TTabItem;
    Layout5: TLayout;
    Image2: TImage;
    Layout6: TLayout;
    RoundRectNome: TRoundRect;
    EditNomeCad: TEdit;
    Layout7: TLayout;
    RoundRectSenhaCad: TRoundRect;
    EditTelefoneCad: TEdit;
    Layout8: TLayout;
    RoundRectProximo: TRoundRect;
    Proximo: TLabel;
    Layout9: TLayout;
    RoundRectEmailCad: TRoundRect;
    EditEmailCadastro: TEdit;
    TabSenha: TTabItem;
    Layout10: TLayout;
    Image3: TImage;
    Layout12: TLayout;
    RoundRectConfirmarSenha: TRoundRect;
    EditConfirmarSenhaCad: TEdit;
    Layout13: TLayout;
    RoundRectCriarConta: TRoundRect;
    Label1: TLabel;
    Layout14: TLayout;
    RoundRectSenhaCadastro: TRoundRect;
    EditSenhaCad: TEdit;
    Layout11: TLayout;
    Layout15: TLayout;
    LabelLogin: TLabel;
    LblLoginConta: TLabel;
    Rectangle1: TRectangle;
    ActionList1: TActionList;
    ActConta: TChangeTabAction;
    ActSenha: TChangeTabAction;
    ActLogin: TChangeTabAction;
    Layout16: TLayout;
    LblContaLogin: TLabel;
    Lbl_ContaCriar: TLabel;
    Rectangle2: TRectangle;
    Layout17: TLayout;
    Layout19: TLayout;
    Image4: TImage;
    EditEmail: TEdit;
    Layout18: TLayout;
    img_exibir: TImage;
    img_esconder: TImage;
    Layout20: TLayout;
    Img_exibir_senhacad: TImage;
    Img_esconder_senhacad: TImage;
    Layout21: TLayout;
    img_exibir_confsenha: TImage;
    img_esconder_confsenha: TImage;
    RoundRectAcessar: TRoundRect;
    procedure LblLoginContaClick(Sender: TObject);

    procedure LblContaLoginClick(Sender: TObject);

    procedure RoundRectProximoClick(Sender: TObject);
    procedure Img_foto_voltarClick(Sender: TObject);
    procedure RoundRectCriarContaClick(Sender: TObject);

    procedure Img_esconder_senhacadClick(Sender: TObject);
    procedure img_esconderClick(Sender: TObject);
    procedure img_exibirClick(Sender: TObject);

    procedure Img_exibir_senhacadClick(Sender: TObject);
    procedure img_esconder_confsenhaClick(Sender: TObject);
    procedure img_exibir_confsenhaClick(Sender: TObject);
    procedure RoundRectAcessarClick(Sender: TObject);


  private
    { Private declarations }
    procedure GetProdutosBase1;
  public
  idProdutoG: integer;
  idGlobal: integer;
  procedure CarregarListaProdutoss(id: integer; nome: string;
  estoque: String;laboratorio: string; valor: String);
    { Public declarations }

  end;

var
  FrmLoginUsuario: TFrmLoginUsuario;

implementation

uses  UnitDM, UnitPrincipal, UnitFrame;
{$R *.fmx}
{$R *.XLgXhdpiTb.fmx ANDROID}

function SHA1FromString(const AString: string): string;
var
  SHA1: TIdHashSHA1;
begin
  SHA1 := TIdHashSHA1.Create;
  try
    Result := SHA1.HashStringAsHex(AString);
  finally
    SHA1.Free;
  end;
end;

procedure TFrmLoginUsuario.img_esconder_confsenhaClick(Sender: TObject);
begin
  img_esconder_confsenha.Visible := false;
  img_exibir_confsenha.Visible := True;
  EditConfirmarSenhaCad.Password := false;
end;

procedure TFrmLoginUsuario.Img_esconder_senhacadClick(Sender: TObject);
begin
  Img_esconder_senhacad.Visible := false;
  Img_exibir_senhacad.Visible := True;
  EditSenhaCad.Password := false;
end;

procedure TFrmLoginUsuario.img_esconderClick(Sender: TObject);
begin
  img_esconder.Visible := false;
  img_exibir.Visible := True;
  EditSenha.Password := false;
end;

procedure TFrmLoginUsuario.img_exibirClick(Sender: TObject);
begin
  img_esconder.Visible := True;
  img_exibir.Visible := false;
  EditSenha.Password := True;
end;

procedure TFrmLoginUsuario.img_exibir_confsenhaClick(Sender: TObject);
begin
  img_esconder_confsenha.Visible := True;
  img_exibir_confsenha.Visible := false;
  EditConfirmarSenhaCad.Password := True;
end;

procedure TFrmLoginUsuario.Img_exibir_senhacadClick(Sender: TObject);
begin
  Img_esconder_senhacad.Visible := True;
  Img_exibir_senhacad.Visible := false;
  EditSenhaCad.Password := True;
end;

procedure TFrmLoginUsuario.Img_foto_voltarClick(Sender: TObject);
begin
  ActConta.Execute;
end;

procedure TFrmLoginUsuario.LblContaLoginClick(Sender: TObject);
begin
  ActLogin.Execute;
end;

procedure TFrmLoginUsuario.LblLoginContaClick(Sender: TObject);
begin
  ActConta.Execute;
end;

procedure TFrmLoginUsuario.RoundRectProximoClick(Sender: TObject);

begin
  if (EditNomeCad.Text = EmptyStr) then
  begin
    EditNomeCad.SetFocus;
  end
  else if (EditEmailCadastro.Text = EmptyStr) then
  begin
    EditEmailCadastro.SetFocus;
  end
  else if (EditTelefoneCad.Text = EmptyStr) then
  begin
    EditTelefoneCad.SetFocus;
  end
  else
  begin
    ActSenha.Execute;
  end;
end;
 procedure TFrmLoginUsuario.GetProdutosBase1;
  begin
    dm.FDQueryProduto.Close;
    dm.FDQueryProduto.Open();
    while not dm.FDQueryProduto.Eof do
     begin
       CarregarListaProdutoss(dm.FDQueryProdutoid.AsInteger,
        dm.FDQueryProdutonomeProduto.AsString,dm.FDQueryProdutoestoque.AsString,
        dm.FDQueryProdutolaboratorio.AsString, dm.FDQueryProdutovalorProduto.AsString);
        dm.FDQueryProduto.next;

     end;
  end;
   procedure TFrmLoginUsuario.CarregarListaProdutoss(id: integer; nome: string;
  estoque: String;laboratorio: string; valor: String);
  var
  frame: TFrame1;
  begin
    frame := TFrame1.Create(nil);
    frame.Position.Y := 99999999;
    frame.Align := TAlignLayout.Top;
    frame.Tag := id;
    idProdutoG := frame.tag;
    frame.Rectid := TRectangle.Create(FrmPrincipal.VertScrollBoxListaProdutos);
    frame.LblNome.text := nome;
    frame.LblEstoque.text := estoque;
    frame.lblLab.text := laboratorio;
    frame.LblValor.text := valor;
    frame.RoundRect11.tag := id;
    FrmPrincipal.VertScrollBoxListaProdutos.AddObject(frame);
  end;
procedure TFrmLoginUsuario.RoundRectAcessarClick(Sender: TObject);
  var

  senha: string;
begin
  senha := SHA1FromString(EditSenha.Text);
  dm.FDQueryUsuario.Close;
  dm.FDQueryUsuario.ParamByName('pEmail').AsString := editEmail.Text;

  dm.FDQueryUsuario.Open();


  if  (dm.FDQueryUsuario <> nil) then
  begin
    if (dm.FDQueryUsuarioEmail.AsString = EditEmail.Text)
    and (dm.FDQueryUsuarioSenha.AsString = senha) then
  begin

    if not Assigned(FrmPrincipal) then
       idGlobal:= dm.FDQueryUsuarioid.AsInteger;

      Application.CreateForm(TFrmPrincipal, FrmPrincipal);
       GetProdutosBase1;
      FrmPrincipal.actHome.Execute;

  end
  else
  begin
    ShowMessage('Login ou senha não confere');
  end;
  end
  else
  ShowMessage('erro de execução');
  end;

procedure TFrmLoginUsuario.RoundRectCriarContaClick(Sender: TObject);
var
  senha: string;

begin
  senha := SHA1FromString(EditSenhaCad.Text);

  dm.FDQueryUsuario.Close;
  dm.FDQueryUsuario.Open();

  if (EditConfirmarSenhaCad.Text <> EmptyStr) or (EditSenhaCad.Text <> EmptyStr)
  then
  begin
    if (EditConfirmarSenhaCad.Text = EditSenhaCad.Text) then
    begin
      dm.FDQueryUsuario.Append;
      dm.FDQueryUsuarioEmail.AsString := EditEmailCadastro.Text;
      dm.FDQueryUsuarioNome.AsString := EditNomeCad.Text;
      dm.FDQueryUsuarioTelefone.AsString := EditTelefoneCad.Text;
      dm.FDQueryUsuarioSenha.AsString := senha;
      dm.FDQueryUsuario.Post;
      dm.conn.CommitRetaining;
      idGlobal:= dm.FDQueryUsuarioid.AsInteger;
      if not Assigned(FrmPrincipal) then
      Application.CreateForm(TFrmPrincipal, FrmPrincipal);
       GetProdutosBase1;
      FrmPrincipal.actHome.Execute;


    end
    else
    begin
      ShowMessage('As senhas não coincidem');
    end;
  end
  else
  begin
    EditSenhaCad.SetFocus;
    EditConfirmarSenhaCad.SetFocus;
    ShowMessage('preencha os campos');
  end;

end;

end.
