unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, FMX.Layouts;

type
  TFrameprodex = class(TFrame)
    Layout45: TLayout;
    Layout46: TLayout;
    Label33: TLabel;
    Imagemenosum: TImage;
    Imagemaisum: TImage;
    Layout47: TLayout;
    RoundRect11: TRoundRect;
    Label32: TLabel;
    Layout48: TLayout;
    Layout49: TLayout;
    Image59: TImage;
    nomeProd: TLabel;
    Layout50: TLayout;
    ImageProduto: TImage;
    Layout51: TLayout;
    Layout52: TLayout;
    Lblestoque: TLabel;
    Layout53: TLayout;
    LblValor: TLabel;
    Lblfab: TLabel;
    procedure Image59Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

uses UnitPrincipal;

procedure TFrameprodex.Image59Click(Sender: TObject);
begin
  FrmPrincipal.ActHome.Execute;
end;

end.
