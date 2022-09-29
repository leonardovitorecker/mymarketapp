unit UnitFrame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Layouts, FMX.Controls.Presentation;

type
  TFrame1 = class(TFrame)
    RectFundo: TRectangle;
    RoundRect11: TRoundRect;
    Label32: TLabel;
    Layout1: TLayout;
    LblEstoque: TLabel;
    LblLab: TLabel;
    LblNome: TLabel;
    LblValor: TLabel;
    Rectid: TRectangle;
    lblid: TLabel;
    procedure RoundRect11Click(Sender: TObject);
  private
    { Private declarations }
   procedure CarregarListaProdexp(id: integer; nome: string;
  estoque: String;laboratorio: string; valor: String);
  procedure GetProdutosBase12;
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

uses UnitPrincipal, UnitDM, UnitLoginUsuario, Unit2;

procedure TFrame1.RoundRect11Click(Sender: TObject);
begin
GetProdutosBase12;
    FrmPrincipal.ActProdExpandido.Execute;

end;
  procedure TFrame1.CarregarListaProdexp(id: integer; nome: string;
  estoque: String;laboratorio: string; valor: String);
  var
  frame: TFrameprodex;
  begin
    frame := TFrameprodex.Create(nil);
    frame.Position.Y := 99999999;
    frame.Align := TAlignLayout.Top;

    frame.nomeProd.text := nome;
    frame.LblEstoque.text := estoque;
    frame.lblFab.text := laboratorio;
    frame.LblValor.text := valor;
    FrmPrincipal.VertScrollBoxProdex.AddObject(frame);
  end;
  procedure TFrame1.GetProdutosBase12;
  begin

    dm.FDQueryProdex.Close;
    dm.FDQueryProdex.Open();
    dm.FDQueryProdex.ParamByName('pID').AsInteger :=FrmLoginUsuario.idProdutoG;
    while not dm.FDQueryProdex.Eof do
     begin
       CarregarListaProdexp(dm.FDQueryProdexid.AsInteger,
        dm.FDQueryProdexnomeProduto.AsString,dm.FDQueryProdexestoque.AsString,
        dm.FDQueryProdexlaboratorio.AsString, dm.FDQueryProdexvalorProduto.AsString);
        dm.FDQueryProdex.next;

     end;
  end;
end.
