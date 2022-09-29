unit cUsuario;

interface

uses FireDAC.Comp.Client, FireDAC.DApt, System.SysUtils, FMX.Graphics;

type
  TUsuario = class
  private
    Fconn: TFDConnection;
    FID_USUARIO: integer;
    FNOME: string;
    FEMAIL: string;
    FSENHA: string;
    FTELEFONE: string;
    FIND_LOGIN: string;
  public
    constructor Create(conn: TFDConnection);
    property idUsuario: integer read FID_USUARIO write FID_USUARIO;
    property nome: string read FNOME write FNOME;
    property email: string read FEMAIL write FEMAIL;
    property senha: string read FSENHA write FSENHA;
    property telefone: string read FTELEFONE write FTELEFONE;

    property indlogin: string read FIND_LOGIN write FIND_LOGIN;

    function ValidarLoginUsuario(out erro: string): boolean;
    function InserirUsuario(out erro: string): boolean;

  end;

implementation

{ TUsuario }

constructor TUsuario.Create(conn: TFDConnection);
begin
  Fconn := conn;
end;



    function TUsuario.InserirUsuario(out erro: string): boolean;
    var

      qry: TFDQuery;
    begin
      try
        try
          qry := TFDQuery.Create(nil);
          qry.Connection := Fconn;

          with qry do
          begin
            Active := false;
            SQL.Clear;
            SQL.Add('INSERT INTO usuario(nome, email, senha, telefone, indlogin)');
            SQL.Add('VALUES(:nome, :email, :senha, :telefone, :indlogin)');
            ParamByName('nome').Value := nome;
            ParamByName('email').Value := email;
            ParamByName('senha').Value := senha;
            ParamByName('telefone').Value := telefone;
            ParamByName('indlogin').Value := indlogin;
            ExecSQL;
          end;

          Result := true;
          erro := '';

        except
          on ex: exception do
          begin
            Result := false;
            erro := 'Erro ao inserir usuarios: ' + ex.Message;
          end;
        end;
      finally
        qry.DisposeOf;
      end;
    end;

    function TUsuario.ValidarLoginUsuario(out erro: string): boolean;
    var
      qry: TFDQuery;
    begin
      try
        qry := TFDQuery.Create(nil);
        qry.Connection := Fconn;
        try
          with qry do
          begin
            Active := false;
            SQL.Clear;
            SQL.Add('SELECT * FROM usuario');
            SQL.Add('WHERE email = :email');
            SQL.Add('AND senha = :senha');
            ParamByName('email').Value := email;
            ParamByName('senha').Value := senha;
            Active := true;

            if RecordCount = 0 then
            begin
              Result := false;
              erro := 'Email ou senha inv�lida';
              exit;
            end;

            Active := false;
            SQL.Clear;
            SQL.Add('UPDATE usuario');
            SQL.Add('SET indlogin = ''S''');
            ExecSQL;
          end;

          Result := true;
          erro := '';

        except
          on ex: exception do
          begin
            Result := false;
            erro := 'Erro ao validar login: ' + ex.Message;
          end;
        end;
      finally
        qry.DisposeOf;
      end;
    end;

end.
