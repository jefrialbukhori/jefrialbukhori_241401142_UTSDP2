program hitung_total_dan_rata2;
uses crt;
var 
rata2: real;
n,i,total,angka: integer;
begin
    clrscr;
    write('masukkan N :'); readln(n);
    total:=0;
    for i:=1 to n do 
    begin
        write('angka ke-',i,': ');readln(angka);
        total:=angka+total;
    end;
    rata2:=total/n;
    writeln;
    writeln('jumlah total :',total);
    writeln;
    writeln('rata rata :',rata2:0:2);
end.