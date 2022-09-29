program MyMarket;

uses
  System.StartUpCopy,
  FMX.Forms,
  UnitLoginUsuario in 'UnitLoginUsuario.pas' {FrmLoginUsuario},
  UnitPrincipal in 'UnitPrincipal.pas' {FrmPrincipal},
  UnitDM in 'UnitDM.pas' {dm: TDataModule},
  UnitFrame in 'UnitFrame.pas' {Frame1: TFrame},
  UnitEndereco in 'UnitEndereco.pas' {FrameEndereco: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TFrmLoginUsuario, FrmLoginUsuario);
  Application.Run;
end.
