unit uTextoConcorrente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmConcorrente = class(TForm)
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
  frmConcorrente: TfrmConcorrente;

implementation

{$R *.dfm}

uses uPrincipal;

procedure TfrmConcorrente.Button1Click(Sender: TObject);
begin
  frmPrincipal.grid_concorrente.Cells[frmPrincipal.QTN_CON,1] := Edit1.Text;
  frmPrincipal.QTN_CON :=  frmPrincipal.QTN_CON + 1;
  frmPrincipal.grid_concorrente.ColCount := frmPrincipal.QTN_CON;
  Edit1.Clear;


  Self.Close;
end;

end.
