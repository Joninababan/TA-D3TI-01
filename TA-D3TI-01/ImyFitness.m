function fitness3 = ImyFitness(Pop3)
try
  fitness3 = sum(Pop3);
catch
    msgbox('proses perhitungan fitness gagal');
end