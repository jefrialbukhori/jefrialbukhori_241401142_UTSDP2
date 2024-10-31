program segitiga;
uses crt;
var
i,j,tinggi : integer;

begin
clrscr;
    write('Masukkan tinggi segitiga : ');readln(tinggi);
    writeln;

    for i := 1 to tinggi do
    begin
        for j := 1 to i do
        begin
            if (j mod 2 = 0) then
            begin
                write('0');
            end
            else
            begin
                write('1');
            end;
        end;
    writeln;
    end;
end.