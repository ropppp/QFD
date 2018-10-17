unit uRelacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmRelacao = class(TForm)
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
  frmRelacao: TfrmRelacao;

implementation

{$R *.dfm}

uses uPrincipal;

procedure TfrmRelacao.Button1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 0 then
    frmPrincipal.grid_principal.Cells[COLUNA,LINHA] := 'FORTE'
  else if RadioGroup1.ItemIndex = 1 then
    frmPrincipal.grid_principal.Cells[COLUNA,LINHA] := 'MEDIA'
  else if RadioGroup1.ItemIndex = 2 then
    frmPrincipal.grid_principal.Cells[COLUNA,LINHA] := 'FRACA'
  else if RadioGroup1.ItemIndex = 3 then
     frmPrincipal.grid_principal.Cells[COLUNA,LINHA] := '';


  Self.Close;
end;

end.
