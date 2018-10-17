unit uValorConco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmValorConco = class(TForm)
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
  frmValorConco: TfrmValorConco;

implementation

{$R *.dfm}

uses uPrincipal;

procedure TfrmValorConco.Button1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 0 then
    frmPrincipal.grid_concorrente.Cells[COLUNA,LINHA] := ''
  else
    frmPrincipal.grid_concorrente.Cells[COLUNA, LINHA] := RadioGroup1.Items[RadioGroup1.ItemIndex];

  Self.Close;
end;

end.
