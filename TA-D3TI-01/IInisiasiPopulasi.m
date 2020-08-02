function Pop3= IInisiasiPopulasi(maxipk,UkPop,minipk)
try
    Pop3 = minipk+rand(UkPop,UkPop)*(maxipk-minipk);
catch
    msgbox('proses inisialisasi populasi gagal');
end



