unit uValorAux;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmValorAux = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    RadioGroup1: TRadioGroup;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    LINHA:Integer;
    COLUNA:Integer;
  end;

var
  frmValorAux: TfrmValorAux;

implementation

{$R *.dfm}

uses uPrincipal;

procedure TfrmValorAux.Button1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 0 then
    frmPrincipal.grid_auxiliar.Cells[COLUNA,LINHA] := ''
  else
    frmPrincipal.grid_auxiliar.Cells[COLUNA, LINHA] := RadioGroup1.Items[RadioGroup1.ItemIndex];

  Self.Close;
end;

end.
