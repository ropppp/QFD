unit uTipoRelacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TfrmTipoRelacao = class(TForm)
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

    BOTAO: TButton;
  end;

var
  frmTipoRelacao: TfrmTipoRelacao;

implementation

{$R *.dfm}

uses uPrincipal;

procedure TfrmTipoRelacao.Button1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 0 then
    BOTAO.Caption := ''
  else
    BOTAO.Caption := RadioGroup1.Items[RadioGroup1.ItemIndex];

  Self.Close;
end;

end.
