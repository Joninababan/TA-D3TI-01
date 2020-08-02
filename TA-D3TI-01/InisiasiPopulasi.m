function Pop1= InisiasiPopulasi(maxskor,UkPop)
try
    Pop1 = randi(maxskor,UkPop);
catch
    msgbox('proses inisialiasi populasi gagal');
end



