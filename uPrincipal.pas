unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.Buttons,uClasses,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Menus, System.ImageList, Vcl.ImgList, IniFiles;

type
  TfrmPrincipal = class(TForm)
    grid_principal: TStringGrid;
    btnProj: TButton;
    btnCli: TButton;
    grid_concorrente: TStringGrid;
    btnConcorrente: TBitBtn;
    btn2col: TButton;
    btn3col: TButton;
    btn3col2: TButton;
    btn4col: TButton;
    btn4col2: TButton;
    btn4col3: TButton;
    btn5col: TButton;
    btn6col: TButton;
    btn5col2: TButton;
    btn6col2: TButton;
    btn5col3: TButton;
    btn6col3: TButton;
    btn5col4: TButton;
    btn6col4: TButton;
    btn6col5: TButton;
    btn7col5: TButton;
    btn7col4: TButton;
    btn7col3: TButton;
    btn7col2: TButton;
    btn7col: TButton;
    btn7col6: TButton;
    grid_auxiliar: TStringGrid;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    SalvarModelo1: TMenuItem;
    N1: TMenuItem;
    AbrirModelo1: TMenuItem;
    N2: TMenuItem;
    Sair1: TMenuItem;
    Editar1: TMenuItem;
    LimparTela1: TMenuItem;
    Ajuda1: TMenuItem;
    Sobre1: TMenuItem;
    ImageList1: TImageList;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    Label1: TLabel;
    procedure btnAddRowClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnProjClick(Sender: TObject);
    procedure btnCliClick(Sender: TObject);
    procedure grid_principalSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure btnConcorrenteClick(Sender: TObject);
    procedure grid_concorrenteSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);

    //Cria Grades
    procedure criaGrade(qnt:integer);
    procedure grid_auxiliarSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure btn2colClick(Sender: TObject);
    procedure Sair1Click(Sender: TObject);

        procedure visivelAuxiliares;
    procedure SalvarModelo1Click(Sender: TObject);
    procedure LimparTela1Click(Sender: TObject);
    procedure grid_concorrenteTopLeftChanged(Sender: TObject);
    procedure AbrirModelo1Click(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }

    QTN_PROJ : Integer;
    QTN_CLI: Integer;
    QTN_CON: Integer;
    APROJ: Array[0..50] of TreqProjeto;
    ACLI: Array[0..50] of TreqCliente;


  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uTexto, uTexto2, uValorCli, uRelacao, uTextoConcorrente, uValorConco ,
  uValorAux, uMedidas, uTipoRelacao, uMetas, uHelp;

procedure TfrmPrincipal.btnCliClick(Sender: TObject);
begin
frmTextoClie.ShowModal;
end;

procedure TfrmPrincipal.btnConcorrenteClick(Sender: TObject);
var largura:Integer;
begin
frmConcorrente.ShowModal;
largura:= ((QTN_CON-1) * 100)+ 220;
    grid_concorrente.Width := largura;


    btnConcorrente.Width := grid_concorrente.Width - 100;
    visivelAuxiliares;
end;

procedure TfrmPrincipal.btnProjClick(Sender: TObject);
var largura:Integer;
begin
    frmTextoProj.showmodal;
    largura:= ((QTN_PROJ+1 ) * 100)+ 220;
    grid_principal.Width := largura;
    grid_auxiliar.Width := grid_principal.Width;

    grid_concorrente.top := grid_principal.Top;
    grid_concorrente.Left := grid_principal.Width+15;
    btnConcorrente.Left := grid_concorrente.Left;

    //Criar grade
    criaGrade(QTN_PROJ);

    visivelAuxiliares;


end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
begin
  grid_principal.ColCount := grid_principal.ColCount +1;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  QTN_PROJ := 0;
  QTN_CLI:= 0;
  QTN_CON := 0;
  grid_principal.Cells[0,0] := 'Requisitos';
  grid_principal.ColWidths[0]:=100;
  grid_principal.RowHeights[0] := 100;
  grid_principal.Cells[1,0]:= 'Importância';
  grid_principal.Cells[2,0]:='Peso Relativo';
  grid_principal.ColCount := 3;
  grid_principal.RowCount := 1;

  grid_auxiliar.Cells[0,0] := 'Meta';
  grid_auxiliar.Cells[0,1] := 'Unidade de Medida';
  grid_auxiliar.Cells[0,2] := 'Dificuldade Técnica';
  grid_auxiliar.ColWidths[0] := 305;

  grid_concorrente.RowHeights[0] := 48;
  grid_concorrente.RowHeights[1] := 50;
  btnConcorrente.Top := grid_concorrente.Top;
  btnConcorrente.Width := grid_concorrente.Width;
  btnConcorrente.Visible:=false;

  grid_concorrente.Visible:=false;
  grid_auxiliar.Visible:=false;

  criaGrade(QTN_PROJ);

end;

procedure TfrmPrincipal.grid_auxiliarSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if((ACol > 0) and (ARow = 2)) then
  begin
    frmValorAux.LINHA:= ARow;
    frmValorAux.COLUNA:= ACol;
    frmValorAux.ShowModal;
  end
  else if ((ACol > 0) and (ARow=1))then
  begin
    frmMedidas.LINHA := ARow;
    frmMedidas.COLUNA := ACol;
    frmMedidas.ShowModal;
  end
  else if((ACol > 0 ) and (ARow = 0)) then
  begin
    frmMetas.LINHA := ARow;
    frmMetas.COLUNA := ACol;
    frmMetas.ShowModal;
  end;
end;

procedure TfrmPrincipal.grid_concorrenteSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if (ARow >1) then
  begin
    frmValorConco.LINHA:= ARow;
    frmValorConco.COLUNA:= ACol;
    frmValorConco.ShowModal;
  end;
end;

procedure TfrmPrincipal.grid_concorrenteTopLeftChanged(Sender: TObject);
begin
btnConcorrente.Left:= grid_concorrente.Left;
end;

procedure TfrmPrincipal.grid_principalSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if(ACol = 1) and (ARow >0) then
  begin
    frmValorCli.LINHA:= ARow;
    frmValorCli.COLUNA:= ACol;
    frmValorCli.ShowModal;
  end
  else if(ACol > 2) and (ARow >0) then
  begin
    frmRelacao.LINHA:= ARow;
    frmRelacao.COLUNA:= ACol;
    frmRelacao.ShowModal;
  end;


end;

procedure TfrmPrincipal.LimparTela1Click(Sender: TObject);
var lin, col: integer;
begin
//limpa a grid
     for lin := 0 to grid_principal.RowCount - 1 do
       for col := 0 to grid_principal.ColCount - 1 do
         grid_principal.Cells[col, lin] := '';

  frmPrincipal.FormCreate(sender);
end;


procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TfrmPrincipal.SalvarModelo1Click(Sender: TObject);
var
  ArquivoINI: TIniFile;
  aux,aux1: Integer;
begin
  SaveDialog1.FileName := 'ModeloQFD';
  if SaveDialog1.Execute() then
  begin
     try
      //cria arquivo .ini
      ArquivoINI := TIniFile.Create(SaveDialog1.FileName+'.ini');
      //numero de linhas e colunas de cada grid pra pegar os valores
      ArquivoINI.WriteString('Geral', 'QTN_PROJ', IntToStr(QTN_PROJ));
      ArquivoINI.WriteString('Geral', 'QTN_CLI', IntToStr(QTN_CLI));
      ArquivoINI.WriteString('Geral', 'QTN_CON', IntToStr(QTN_CON));
      ArquivoINI.WriteString('GridPrincipal', 'Coluna', IntToStr(grid_principal.ColCount));
      ArquivoINI.WriteString('GridPrincipal', 'Linha', IntToStr(grid_principal.RowCount));
      ArquivoINI.WriteString('GridPrincipal', 'Largura', IntToStr(grid_principal.Width));
      ArquivoINI.WriteString('GridPrincipal', 'Altura', IntToStr(grid_principal.Height));
      ArquivoINI.WriteString('GridPrincipal', 'Top', IntToStr(grid_principal.Top));
      ArquivoINI.WriteString('GridPrincipal', 'Left', IntToStr(grid_principal.Left));
      ArquivoINI.WriteString('GridAuxiliar', 'Coluna', IntToStr(grid_auxiliar.ColCount));
      ArquivoINI.WriteString('GridAuxiliar', 'Linha', IntToStr(grid_auxiliar.RowCount));
      ArquivoINI.WriteString('GridAuxiliar', 'Largura', IntToStr(grid_auxiliar.Width));
      ArquivoINI.WriteString('GridAuxiliar', 'Altura', IntToStr(grid_auxiliar.Height));
      ArquivoINI.WriteString('GridAuxiliar', 'Top', IntToStr(grid_auxiliar.Top));
      ArquivoINI.WriteString('GridAuxiliar', 'Left', IntToStr(grid_auxiliar.Left));
      ArquivoINI.WriteString('GridConcorrente', 'Coluna', IntToStr(grid_concorrente.ColCount));
      ArquivoINI.WriteString('GridConcorrente', 'Linha', IntToStr(grid_concorrente.RowCount));
      ArquivoINI.WriteString('GridConcorrente', 'Largura', IntToStr(grid_concorrente.Width));
      ArquivoINI.WriteString('GridConcorrente', 'Altura', IntToStr(grid_concorrente.Height));
      ArquivoINI.WriteString('GridConcorrente', 'Top', IntToStr(grid_concorrente.Top));
      ArquivoINI.WriteString('GridConcorrente', 'Left', IntToStr(grid_concorrente.Left));
      ArquivoINI.WriteString('BotaoGridConcorrente', 'Largura', IntToStr(btnConcorrente.Width));
      ArquivoINI.WriteString('BotaoGridConcorrente', 'Altura', IntToStr(btnConcorrente.Height));
      ArquivoINI.WriteString('BotaoGridConcorrente', 'Top', IntToStr(btnConcorrente.Top));
      ArquivoINI.WriteString('BotaoGridConcorrente', 'Left', IntToStr(btnConcorrente.Left));

      ArquivoINI.WriteString('Botoes','btn2col',btn2col.Caption);
      ArquivoINI.WriteString('Botoes','btn3col',btn3col.Caption);
      ArquivoINI.WriteString('Botoes','btn3col2',btn3col2.Caption);
      ArquivoINI.WriteString('Botoes','btn4col',btn4col.Caption);
      ArquivoINI.WriteString('Botoes','btn4col2',btn4col2.Caption);
      ArquivoINI.WriteString('Botoes','btn4col3',btn4col3.Caption);
      ArquivoINI.WriteString('Botoes','btn5col',btn5col.Caption);
      ArquivoINI.WriteString('Botoes','btn5col2',btn5col2.Caption);
      ArquivoINI.WriteString('Botoes','btn5col3',btn5col3.Caption);
      ArquivoINI.WriteString('Botoes','btn5col4',btn5col4.Caption);
      ArquivoINI.WriteString('Botoes','btn6col',btn6col.Caption);
      ArquivoINI.WriteString('Botoes','btn6col2',btn6col2.Caption);
      ArquivoINI.WriteString('Botoes','btn6col3',btn6col3.Caption);
      ArquivoINI.WriteString('Botoes','btn6col4',btn6col4.Caption);
      ArquivoINI.WriteString('Botoes','btn6col5',btn6col5.Caption);
      ArquivoINI.WriteString('Botoes','btn7col',btn7col.Caption);
      ArquivoINI.WriteString('Botoes','btn7col2',btn7col2.Caption);
      ArquivoINI.WriteString('Botoes','btn7col3',btn7col3.Caption);
      ArquivoINI.WriteString('Botoes','btn7col4',btn7col4.Caption);
      ArquivoINI.WriteString('Botoes','btn7col5',btn7col5.Caption);
      ArquivoINI.WriteString('Botoes','btn7col6',btn7col6.Caption);

      //para pegar dados e preencher .ini
      //pega dados da grid principal
      for aux:=0 to grid_principal.ColCount-1 do
        begin
          for aux1:= 0 to grid_principal.RowCount-1 do
            begin
              ArquivoINI.WriteString('GridPrincipal', trim(IntToStr(aux)+IntToStr(aux1)), grid_principal.Cells[aux,aux1]);
          end;
        end;
      //pega dados da grid auxiliar
      for aux:=0 to grid_auxiliar.ColCount-1 do
        begin
          for aux1:= 0 to grid_auxiliar.RowCount-1 do
            begin
              ArquivoINI.WriteString('GridAuxiliar', trim(IntToStr(aux)+IntToStr(aux1)), grid_auxiliar.Cells[aux,aux1]);
          end;
        end;
      //pega dados da grid concorrente
      for aux:=0 to grid_concorrente.ColCount-1 do
        begin
          for aux1:= 0 to grid_concorrente.RowCount-1 do
            begin
              ArquivoINI.WriteString('GridConcorrente', trim(IntToStr(aux)+IntToStr(aux1)), grid_concorrente.Cells[aux,aux1]);
          end;
        end;

      //criar for para grid_aux e grid_concorrente
      //criar for para armazenar botões

      ArquivoINI.Free;
      ShowMessage('Modelo Armazenado com Sucesso!');
    except
      showmessage('Erro ao salvar Modelo :(');
    end;

  end;
end;

procedure TfrmPrincipal.Sobre1Click(Sender: TObject);
begin
Form1.ShowModal;
end;

procedure TfrmPrincipal.AbrirModelo1Click(Sender: TObject);
var
  caminho:String;
  ArquivoINI: TIniFile;
  aux,aux1: Integer;
begin
  if OpenDialog1.Execute()then
  begin
    frmPrincipal.FormCreate(sender);
    caminho:= OpenDialog1.FileName;
    //cria arquivo .ini
    ArquivoINI := TIniFile.Create(caminho);
    QTN_PROJ:= StrToInt( ArquivoINI.ReadString('Geral', 'QTN_PROJ', ''));
    QTN_CLI:= StrToInt( ArquivoINI.ReadString('Geral', 'QTN_CLI', ''));
    QTN_CON:= StrToInt( ArquivoINI.ReadString('Geral', 'QTN_CON', ''));
    criaGrade(QTN_PROJ);
    visivelAuxiliares;
    grid_principal.Top:= StrToInt(ArquivoINI.ReadString('GridPrincipal','Top',''));
    grid_principal.Left:= StrToInt(ArquivoINI.ReadString('GridPrincipal','Left',''));
    grid_principal.Width:= StrToInt(ArquivoINI.ReadString('GridPrincipal','Largura',''));
    grid_principal.Height:= StrToInt(ArquivoINI.ReadString('GridPrincipal','Altura',''));
    grid_principal.RowCount:= StrToInt(ArquivoINI.ReadString('GridPrincipal','Linha',''));
    grid_principal.ColCount:= StrToInt(ArquivoINI.ReadString('GridPrincipal','Coluna',''));

    grid_auxiliar.Top:= StrToInt(ArquivoINI.ReadString('GridAuxiliar','Top',''));
    grid_auxiliar.Left:= StrToInt(ArquivoINI.ReadString('GridAuxiliar','Left',''));
    grid_auxiliar.Width:= StrToInt(ArquivoINI.ReadString('GridAuxiliar','Largura',''));
    grid_auxiliar.Height:= StrToInt(ArquivoINI.ReadString('GridAuxiliar','Altura',''));
    grid_auxiliar.RowCount:= StrToInt(ArquivoINI.ReadString('GridAuxiliar','Linha',''));
    grid_auxiliar.ColCount:= StrToInt(ArquivoINI.ReadString('GridAuxiliar','Coluna',''));

    grid_concorrente.Top:= StrToInt(ArquivoINI.ReadString('GridConcorrente','Top',''));
    grid_concorrente.Left:= StrToInt(ArquivoINI.ReadString('GridConcorrente','Left',''));
    grid_concorrente.Width:= StrToInt(ArquivoINI.ReadString('GridConcorrente','Largura',''));
    grid_concorrente.Height:= StrToInt(ArquivoINI.ReadString('GridConcorrente','Altura',''));
    grid_concorrente.RowCount:= StrToInt(ArquivoINI.ReadString('GridConcorrente','Linha',''));
    grid_concorrente.ColCount:= StrToInt(ArquivoINI.ReadString('GridConcorrente','Coluna',''));

    btnConcorrente.Top:= StrToInt(ArquivoINI.ReadString('BotaoGridConcorrente','Top',''));
    btnConcorrente.Left:= StrToInt(ArquivoINI.ReadString('BotaoGridConcorrente','Left',''));
    btnConcorrente.Width:= StrToInt(ArquivoINI.ReadString('BotaoGridConcorrente','Largura',''));
    btnConcorrente.Height:= StrToInt(ArquivoINI.ReadString('BotaoGridConcorrente','Altura',''));

    btn2col.Caption := ArquivoINI.ReadString('Botoes','btn2col','');
    btn3col.Caption := ArquivoINI.ReadString('Botoes','btn3col','');
    btn3col2.Caption := ArquivoINI.ReadString('Botoes','btn3col2','');
    btn4col.Caption := ArquivoINI.ReadString('Botoes','btn4col','');
    btn4col2.Caption := ArquivoINI.ReadString('Botoes','btn4col2','');
    btn4col3.Caption := ArquivoINI.ReadString('Botoes','btn4col3','');
    btn5col.Caption := ArquivoINI.ReadString('Botoes','btn5col','');
    btn5col2.Caption := ArquivoINI.ReadString('Botoes','btn5col2','');
    btn5col3.Caption := ArquivoINI.ReadString('Botoes','btn5col3','');
    btn5col4.Caption := ArquivoINI.ReadString('Botoes','btn5col4','');
    btn6col.Caption := ArquivoINI.ReadString('Botoes','btn6col','');
    btn6col2.Caption := ArquivoINI.ReadString('Botoes','btn6col2','');
    btn6col3.Caption := ArquivoINI.ReadString('Botoes','btn6col3','');
    btn6col4.Caption := ArquivoINI.ReadString('Botoes','btn6col4','');
    btn6col5.Caption := ArquivoINI.ReadString('Botoes','btn6col5','');
    btn7col.Caption := ArquivoINI.ReadString('Botoes','btn7col','');
    btn7col2.Caption := ArquivoINI.ReadString('Botoes','btn7col2','');
    btn7col3.Caption := ArquivoINI.ReadString('Botoes','btn7col3','');
    btn7col4.Caption := ArquivoINI.ReadString('Botoes','btn7col4','');
    btn7col5.Caption := ArquivoINI.ReadString('Botoes','btn7col5','');
    btn7col6.Caption := ArquivoINI.ReadString('Botoes','btn7col6','');

    for aux:=0 to StrToInt(ArquivoINI.ReadString('GridPrincipal','Coluna',''))-1 do
    begin
      for aux1:= 0 to StrToInt(ArquivoINI.ReadString('GridPrincipal','Linha',''))-1 do
        begin
          grid_principal.Cells[aux,aux1]:= ArquivoINI.ReadString('GridPrincipal', trim(IntToStr(aux)+IntToStr(aux1)),'');
          end;
    end;

    for aux:=0 to StrToInt(ArquivoINI.ReadString('GridAuxiliar','Coluna',''))-1 do
    begin
      for aux1:= 0 to StrToInt(ArquivoINI.ReadString('GridAuxiliar','Linha',''))-1 do
        begin
          grid_auxiliar.Cells[aux,aux1]:= ArquivoINI.ReadString('GridAuxiliar', trim(IntToStr(aux)+IntToStr(aux1)),'');
        end;
    end;

    for aux:=0 to StrToInt(ArquivoINI.ReadString('GridConcorrente','Coluna',''))-1 do
    begin
      for aux1:= 0 to StrToInt(ArquivoINI.ReadString('GridConcorrente','Linha',''))-1 do
        begin
          grid_concorrente.Cells[aux,aux1]:= ArquivoINI.ReadString('GridConcorrente', trim(IntToStr(aux)+IntToStr(aux1)),'');
        end;
    end;

    ArquivoINI.Free;
             {
             [GridPrincipal]
Coluna=3
Linha=1
Largura=305
Altura=537
Top=160
Left=8}

  end;
end;

procedure TfrmPrincipal.btn2colClick(Sender: TObject);
begin
frmTipoRelacao.BOTAO := Sender as TButton;
frmTipoRelacao.ShowModal;
end;

procedure TfrmPrincipal.btnAddRowClick(Sender: TObject);
begin
  grid_principal.RowCount := grid_principal.RowCount +1;
end;

procedure TfrmPrincipal.criaGrade(qnt: Integer);
begin
  if qnt = 0 then
  begin
    btn2col.Visible:=false;
    btn3col.Visible:=false;
    btn3col2.Visible:=false;
    btn4col.Visible:=false;
    btn4col2.Visible:=false;
    btn4col3.Visible:=false;
    btn5col.Visible:=false;
    btn5col2.Visible:=false;
    btn5col3.Visible:=false;
    btn5col4.Visible:=false;
    btn6col.Visible:=false;
    btn6col2.Visible:=false;
    btn6col3.Visible:=false;
    btn6col4.Visible:=false;
    btn6col5.Visible:=false;
    btn7col.Visible:=false;
    btn7col2.Visible:=false;
    btn7col3.Visible:=false;
    btn7col4.Visible:=false;
    btn7col5.Visible:=false;
    btn7col6.Visible:=false;
  end else if qnt = 2 then
  begin
    btn2col.Visible:=true;
  end else if qnt = 3 then
  begin
    btn2col.Visible:=true;
    btn3col.Visible:=true;
    btn3col2.Visible:=true;
  end
  else if qnt = 4 then
  begin
    btn2col.Visible:=true;
    btn3col.Visible:=true;
    btn3col2.Visible:=true;
    btn4col.Visible:=true;
    btn4col2.Visible:=true;
    btn4col3.Visible:=true;
  end
    else if qnt = 5 then
  begin
    btn2col.Visible:=true;
    btn3col.Visible:=true;
    btn3col2.Visible:=true;
    btn4col.Visible:=true;
    btn4col2.Visible:=true;
    btn4col3.Visible:=true;
    btn5col.Visible:=true;
    btn5col2.Visible:=true;
    btn5col3.Visible:=true;
    btn5col4.Visible:=true;
  end
    else if qnt = 6 then
  begin
    btn2col.Visible:=true;
    btn3col.Visible:=true;
    btn3col2.Visible:=true;
    btn4col.Visible:=true;
    btn4col2.Visible:=true;
    btn4col3.Visible:=true;
    btn5col.Visible:=true;
    btn5col2.Visible:=true;
    btn5col3.Visible:=true;
    btn5col4.Visible:=true;
    btn6col.Visible:=true;
    btn6col2.Visible:=true;
    btn6col3.Visible:=true;
    btn6col4.Visible:=true;
    btn6col5.Visible:=true;
  end
    else if qnt = 7 then
  begin
    btn2col.Visible:=true;
    btn3col.Visible:=true;
    btn3col2.Visible:=true;
    btn4col.Visible:=true;
    btn4col2.Visible:=true;
    btn4col3.Visible:=true;
    btn5col.Visible:=true;
    btn5col2.Visible:=true;
    btn5col3.Visible:=true;
    btn5col4.Visible:=true;
    btn6col.Visible:=true;
    btn6col2.Visible:=true;
    btn6col3.Visible:=true;
    btn6col4.Visible:=true;
    btn6col5.Visible:=true;
    btn7col.Visible:=true;
    btn7col2.Visible:=true;
    btn7col3.Visible:=true;
    btn7col4.Visible:=true;
    btn7col5.Visible:=true;
    btn7col6.Visible:=true;
  end;
end;

procedure TfrmPrincipal.visivelAuxiliares;
begin
if ((QTN_PROJ > 0)OR(QTN_CLI>0)) then
begin
grid_auxiliar.Visible:= True;
grid_concorrente.Visible:= True;
btnConcorrente.Visible:=True;
end;
end;

end.
