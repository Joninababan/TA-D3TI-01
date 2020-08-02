function fitness2 = GmyFitness(Pop2)
try
    fitness2 = sum(Pop2);
catch
    msgbox('proses perhitungan fitness gagal');
end