unit uspComponentesRegistro;

interface

uses
  System.Classes, Vcl.Graphics;

procedure Register;

implementation

 uses uspQuery;

procedure Register ;
begin
   RegisterComponents('spComponentes', [TspQuery]);
end;

end.
