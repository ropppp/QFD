unit uClasses;

interface

type TreqProjeto = class
  private
    Fnome   :String;
  protected
  public
    property nome   :String  read Fnome   write Fnome;
    Constructor Create;    // declaração do metodo construtor
    Destructor  Destroy; Override; // declaração do metodo destrutor
end;

type TreqCliente = class
  private
    Fnome   :String;
  protected
  public
    property nome   :String  read Fnome   write Fnome;
    Constructor Create;    // declaração do metodo construtor
    Destructor  Destroy; Override; // declaração do metodo destrutor
end;


implementation

{ TreqProjeto }

constructor TreqProjeto.Create;
begin
// metodo contrutor
end;

destructor TreqProjeto.Destroy;
begin
// metodo destrutor
inherited;
end;


{ TreqCliente }

constructor TreqCliente.Create;
begin
// metodo contrutor
end;

destructor TreqCliente.Destroy;
begin
// metodo destrutor
inherited;
end;



end.
