unit uTexto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmTextoProj = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTextoProj: TfrmTextoProj;

implementation

{$R *.dfm}

uses uPrincipal, uClasses;

procedure TfrmTextoProj.Button1Click(Sender: TObject);
var req:TreqProjeto;
begin
 try
    req := TreqProjeto.Create;
    req.nome := Edit1.Text;

    frmPrincipal.grid_principal.ColCount := frmPrincipal.grid_principal.ColCount +1;

    frmPrincipal.grid_auxiliar.ColCount := frmPrincipal.grid_auxiliar.ColCount +1;

    frmPrincipal.QTN_PROJ :=  frmPrincipal.QTN_PROJ + 1;
    frmPrincipal.grid_principal.Cells[frmPrincipal.QTN_PROJ+2,0] := req.nome;

    frmPrincipal.APROJ[frmPrincipal.QTN_PROJ-1]:= req;
    Edit1.Clear;
  finally

    Self.Close;
 end;
end;

end.
