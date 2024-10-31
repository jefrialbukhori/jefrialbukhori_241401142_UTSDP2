program Kasir_transmart;
uses crt;
const
diskon_hygiene= 0.10;
diskon_frozenfood= 0.05;
diskon_elektronik= 0.30;
diskon_laktosa= 0.08;
diskon_member= 0.10;
diskon_jumlah_pembelian= 0.05;
bonus_poin = 50000;
poin_untuk_menukar_voucher = 50;
diskon_yang_ditukar_menjadi_voucher = 0.20;
type
daftar_barang= record
nama,kategori: string;
harga: longint;
kuantitas: integer;
end;
var
nama_anggota,hari: string;
produk:array[1..100] of daftar_barang;
harga_sebelum_diskon,harga_setelah_diskon,diskon_akhir,totaldiskon,diskonmember,DiskonJumlahpembelian: real;
poin,i,inputan_produk,total_kuantitas: integer;
produk_lain,member: char;
function kategori_diskon(kategori: string; hari: string): real;
begin
    if (hari = 'senin') and (kategori = '1') then
        kategori_diskon:= diskon_hygiene
    else if (hari = 'selasa') and (kategori = '2') then
        kategori_diskon:= diskon_frozenfood
    else if (hari = 'rabu') and (kategori = '3') then
        kategori_diskon:= diskon_elektronik
    else if (hari = 'kamis') and (kategori = '4') then
        kategori_diskon:= diskon_laktosa
    else
        kategori_diskon:= 0.0; 
end;

function hitung_poin(total: real): integer;
begin
    hitung_poin:= trunc(total / bonus_poin);
end;

begin
    clrscr;
    write('Nama Anggota: ');
    readln(nama_anggota);
    writeln;
    write('Hari: ');readln(hari); 
    writeln;
    writeln('Nomor Kategori Produk');
    writeln(' ');
    writeln('Hygiene       (1)');
    writeln('frozenfood    (2)');
    writeln('Elektronik    (3)');
    writeln('Laktosa       (4)');
    writeln;
    writeln('Produk: ');
    inputan_produk:= 0;
    total_kuantitas:= 0;
    repeat
        inputan_produk:= inputan_produk +1;
        write('Nomor Kategori Produk: ');
        readln(produk[inputan_produk].kategori);
        write('Nama Produk          : ');
        readln(produk[inputan_produk].nama);
        write('Harga Produk         : ');
        readln(produk[inputan_produk].harga);
        write('Jumlah Produk        : ');
        readln(produk[inputan_produk].kuantitas);
        writeln;
        
        total_kuantitas:= total_kuantitas+produk[inputan_produk].kuantitas;
        write('Apakah ingin menambah produk lain? (Y/T) : ');
        readln(produk_lain);
        writeln;
    until((produk_lain='T')or(produk_lain='t'));
    harga_sebelum_diskon:= 0;
    for i:= 1 to inputan_produk do
    begin
        harga_sebelum_diskon:= harga_sebelum_diskon+(produk[i].harga*produk[i].kuantitas);
    end;
    totaldiskon:= 0;
    for i := 1 to inputan_produk do
    begin
        totaldiskon:= totaldiskon+kategori_diskon(produk[i].kategori, hari)  ;
    end;
    write('Apakah memiliki member? (Y/T):');readln(member);
    if ((member= 'Y')or(member= 'y')) then
        diskonmember:= diskon_member+diskon_member
    else
        diskonmember:= 0.0;
    if (total_kuantitas >10) then
        diskonjumlahpembelian:= diskon_jumlah_pembelian+diskon_jumlah_pembelian
    else
        DiskonJumlahpembelian:= 0.0;
    diskon_akhir:= totaldiskon+diskonmember+DiskonJumlahpembelian;
    harga_setelah_diskon:=harga_sebelum_diskon-(harga_sebelum_diskon*diskon_akhir);
    poin:= hitung_poin(harga_setelah_diskon);
    writeln;
    writeln(' ');
    writeln('Nama Anggota       :',nama_anggota);
    writeln('Harga Tanpa Diskon :Rp.',harga_sebelum_diskon:0:2);
    writeln('Total Diskon       :',(totaldiskon*100):0:0, '% + ', (diskonmember * 100):0:0, '% + ', (DiskonJumlahpembelian  * 100):0:0,'% = ',(diskon_akhir  * 100):0:0,'%');
    writeln('Total Bayar        :Rp.', harga_setelah_diskon:0:2);
    writeln('Poin diperoleh     :',poin);

end.