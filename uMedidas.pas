unit uMedidas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmMedidas = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    RadioGroup1: TRadioGroup;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    LINHA:Integer;
    COLUNA:Integer;
  end;

var
  frmMedidas: TfrmMedidas;

implementation

{$R *.dfm}

uses uPrincipal;

procedure TfrmMedidas.Button1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 0 then
    frmPrincipal.grid_auxiliar.Cells[COLUNA,LINHA] := ''
  else if RadioGroup1.Items[RadioGroup1.ItemIndex] = 'OUTRO' then
    frmPrincipal.grid_auxiliar.Cells[COLUNA, LINHA] := Edit1.Text
  else
    frmPrincipal.grid_auxiliar.Cells[COLUNA, LINHA] := RadioGroup1.Items[RadioGroup1.ItemIndex];

  Self.Close;
end;

procedure TfrmMedidas.RadioGroup1Click(Sender: TObject);
begin
if RadioGroup1.Items[RadioGroup1.ItemIndex] = 'OUTRO' then
begin
  Edit1.Enabled:=True;
end
else
begin
  Edit1.Enabled:=False;
  Edit1.Clear;
end;
end;

end.
