function Pop2= GInisiasiPopulasi(maxgjbb,UkPop)
try
    Pop2 = randi(maxgjbb,UkPop);
catch
    msgbox('proses inisialisasi populasi gagal');
end



