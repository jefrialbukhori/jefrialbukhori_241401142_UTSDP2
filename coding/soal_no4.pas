program bilangan_prima;
uses crt;
var
prima:boolean;
n,i,j: integer;

begin
clrscr;
    write('Masukkan n : ');readln(n);
    writeln;
    write('Bilangan Prima dari 1 sampai ',n,' adalah : ');
    for i:=2 to n do
    begin
        prima :=true;
        for j:=2 to (i-1) do
        begin
            if (i mod j=0) then
            begin
                prima:=false;
                break;
            end;
        end;
    if (prima = true) then
    write(i,' ');
    end;
end.