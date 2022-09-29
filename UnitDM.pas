unit UnitDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.FMXUI.Wait, Data.DB,
  FMX.Forms,  FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,IOUtils;

type
  Tdm = class(TDataModule)
    conn: TFDConnection;
    FDQueryUsuario: TFDQuery;
    FDQueryProduto: TFDQuery;
    FDQueryFavoritos: TFDQuery;
    FDQueryProdutoid: TFDAutoIncField;
    FDQueryProdutonomeProduto: TStringField;
    FDQueryProdutoestoque: TIntegerField;
    FDQueryProdutovalorProduto: TBCDField;
    FDQueryProdutolaboratorio: TStringField;
    FDQueryProdutoimg_produto: TBlobField;
    FDQueryProdutocarrinho: TIntegerField;
    FDQueryBuscaUsuario: TFDQuery;
    FDQueryEndereco: TFDQuery;
    FDQueryUsuarioid: TFDAutoIncField;
    FDQueryUsuarionome: TStringField;
    FDQueryUsuariotelefone: TStringField;
    FDQueryUsuarioemail: TStringField;
    FDQueryUsuariosenha: TStringField;
    FDQueryUsuariocpf: TStringField;
    FDQueryUsuarioimg_perfil: TBlobField;
    FDQueryEnderecoid: TFDAutoIncField;
    FDQueryEnderecocidade: TStringField;
    FDQueryEnderecorua: TStringField;
    FDQueryEnderecocep: TStringField;
    FDQueryEnderecobairro: TStringField;
    FDQueryEnderecocomplemento: TStringField;
    FDQueryEndereconumeroCasa: TStringField;
    FDQueryEnderecousuarioId: TIntegerField;
    FDQueryBuscaUsuarioid: TFDAutoIncField;
    FDQueryBuscaUsuarionome: TStringField;
    FDQueryBuscaUsuariotelefone: TStringField;
    FDQueryBuscaUsuarioemail: TStringField;
    FDQueryBuscaUsuariosenha: TStringField;
    FDQueryBuscaUsuariocpf: TStringField;
    FDQueryBuscaUsuarioimg_perfil: TBlobField;
    FDQueryBuscaUsuarioid_1: TIntegerField;
    FDQueryBuscaUsuariocidade: TStringField;
    FDQueryBuscaUsuariorua: TStringField;
    FDQueryBuscaUsuariocep: TStringField;
    FDQueryBuscaUsuariobairro: TStringField;
    FDQueryBuscaUsuariocomplemento: TStringField;
    FDQueryBuscaUsuarionumeroCasa: TStringField;
    FDQueryBuscaUsuariousuarioId: TIntegerField;
    FDQueryEnderecoid_1: TIntegerField;
    FDQueryEndereconome: TStringField;
    FDQueryEnderecotelefone: TStringField;
    FDQueryEnderecoemail: TStringField;
    FDQueryEnderecosenha: TStringField;
    FDQueryEnderecocpf: TStringField;
    FDQueryEnderecoimg_perfil: TBlobField;
    FDQueryDeleteEnd: TFDQuery;
    FDQueryDeleteEndusuarioId: TIntegerField;
    FDQueryDeleteEndid: TFDAutoIncField;
    FDQueryDeleteEndcidade: TStringField;
    FDQueryDeleteEndrua: TStringField;
    FDQueryDeleteEndcep: TStringField;
    FDQueryDeleteEndbairro: TStringField;
    FDQueryDeleteEndcomplemento: TStringField;
    FDQueryDeleteEndnumeroCasa: TStringField;
    procedure connAfterConnect(Sender: TObject);
    procedure connBeforeConnect(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

 {%CLASSGROUP 'FMX.Controls.TControl'}
{$R *.dfm}

procedure Tdm.connAfterConnect(Sender: TObject);
 var
 strSQL : string;
begin

 StrSQL :='CREATE TABLE IF NOT EXISTS endereco(' +
         'id integer not null primary key autoincrement,' +
         'cidade varchar(60),'+
         ' rua char(11),' +
        ' cep varchar(10),' +
      ' bairro varchar(60),'+
       'complemento varchar(60),'+
      ' numeroCasa varchar(6), ' +
     ' usuarioId integer, ' +
     ' Foreign Key (usuarioId) references usuario(id))';

  conn.ExecSQL(strSQL);
  strSQL := EmptyStr;

   strSQL :='CREATE TABLE IF NOT EXISTS produto ( ' +
            'id integer not null primary key autoincrement,' +
            'nomeProduto varchar(50),' +
            'estoque integer, ' +
            'valorProduto numeric(14,2), ' +
            'laboratorio varchar(50), ' +
            'img_produto blob)';

  conn.ExecSQL(strSQL);
  strSQL := EmptyStr;


  StrSQL := 'CREATE TABLE IF NOT EXISTS usuario(' +
            'id integer not null primary key autoincrement, ' +
            'nome varchar(40),' +
            'telefone varchar(13), ' +
            'email varchar(60), '+
            'senha varchar(40), ' +
            'cpf varchar(10), ' +
            'enderecoId integer,'+
            'img_perfil blob) ';

  conn.ExecSQL(strSQL);

 conn.ExecSQL(strSQL);

  FDQueryUsuario.Active := true;
  FDQueryProduto.Active := true;
  
end;

procedure Tdm.connBeforeConnect(Sender: TObject);
begin
var
  strPath: string;
begin
{$IF DEFINED(iOS) or DEFINED(ANDROID)}
  strPath := System.IOUtils.TPath.Combine(System.IOUtils.TPath.GetDocumentsPath,
    'MyMarket.db');
{$ENDIF}
{$IFDEF MSWINDOWS}
  strPath := System.IOUtils.TPath.Combine
    ('C:\Users\LEONARDO\Documents\MyMarketapp\DB\',
    'MyMarket.db');
{$ENDIF}
  conn.Params.Values['UseUnicode'] := 'False';
  conn.Params.Values['DATABASE'] := strPath;
end;
end;
end.

