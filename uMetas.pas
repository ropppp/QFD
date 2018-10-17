unit uMetas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmMetas = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    LINHA:Integer;
    COLUNA:Integer;
  end;

var
  frmMetas: TfrmMetas;

implementation

{$R *.dfm}

uses uPrincipal;

procedure TfrmMetas.Button1Click(Sender: TObject);
begin
    frmPrincipal.grid_auxiliar.Cells[COLUNA, LINHA] := Edit1.Text;
    Edit1.Clear;

  Self.Close;
end;

end.
