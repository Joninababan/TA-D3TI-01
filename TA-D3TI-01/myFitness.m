function fitness = myFitness(Pop1)
try
   
  fitness = sum(Pop1) *2;
catch
    msgbox('proses perhitungan fitness gagal');
end