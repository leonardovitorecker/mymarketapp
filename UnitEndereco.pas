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
    Image1: TImage;
    Image2: TImage;
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

uses UnitPrincipal, UnitLoginUsuario, UnitDM;

procedure TFrameEndereco.Image1Click(Sender: TObject);
begin
FrmPrincipal.ActEditEndereco.execute;
end;

procedure TFrameEndereco.Image2Click(Sender: TObject);
var
i: integer;
begin

dm.FDQueryDeleteEnd.BeginBatch;
 for i := dm.FDQueryDeleteEnd.RecordCount - 1 downto 0 do
 begin
    dm.FDQueryDeleteEnd.Delete;
    ShowMessage('excluido');

 end;
 dm.FDQueryDeleteEnd.EndBatch;
 dm.FDQueryDeleteEnd.Refresh;



end;

end.
