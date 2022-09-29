unit UnitEndereco;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation;

type
  TFrameEndereco = class(TFrame)
    RectEndereco: TRectangle;
    Lblbairro: TLabel;
    LblRua: TLabel;
    Rectangle1: TRectangle;
    Imageeditar: TImage;
    Image2: TImage;
    procedure ImageeditarClick(Sender: TObject);
    procedure Image2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

uses UnitPrincipal, UnitLoginUsuario, UnitDM;

procedure TFrameEndereco.ImageeditarClick(Sender: TObject);
begin

FrmPrincipal.ActEditEndereco.execute;
end;

procedure TFrameEndereco.Image2Click(Sender: TObject);
var
i: integer;
begin
dm.FDQueryDeleteEnd.Close;

dm.FDQueryDeleteEnd.Open();
dm.FDQueryDeleteEnd.ParamByName('pID').Asinteger := FrmPrincipal.IdEndereco ;dm.FDQueryDeleteEnd.BeginBatch;

    dm.FDQueryDeleteEnd.Delete;
    ShowMessage('excluido');
     


end;

end.
