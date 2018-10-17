unit uTexto2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmTextoClie = class(TForm)
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
  frmTextoClie: TfrmTextoClie;

implementation

{$R *.dfm}

uses uPrincipal, uClasses;

procedure TfrmTextoClie.Button1Click(Sender: TObject);
var
 req: TreqCliente;
begin
  try
    req := TreqCliente.Create;
    req.nome := Edit1.Text;

    frmPrincipal.grid_principal.RowCount := frmPrincipal.grid_principal.RowCount +1;
    frmPrincipal.grid_concorrente.RowCount := frmPrincipal.grid_principal.RowCount + 1;
    frmPrincipal.QTN_CLI :=  frmPrincipal.QTN_CLI + 1;
    frmPrincipal.grid_principal.Cells[0,frmPrincipal.QTN_CLI] := req.nome;

    frmPrincipal.grid_auxiliar.Top := (frmPrincipal.grid_principal.Top + 100+ ( frmPrincipal.QTN_CLI * 28));

    frmPrincipal.ACLI[frmPrincipal.QTN_CLI]:= req;
    Edit1.Clear;
  finally

    Self.Close;
  end;
end;

end.
