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
    procedure RoundRect11Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

uses UnitPrincipal;

procedure TFrame1.RoundRect11Click(Sender: TObject);
begin
    FrmPrincipal.ActProdExpandido.Execute;
end;

end.
