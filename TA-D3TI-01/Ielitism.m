function Inew_Populasi = Ielitism(Ichildren,Populasi3)
try
    fitness3 = zeros(1,length(Populasi3));
    for i=1:length(fitness3)
        fitness3(i) = Populasi3(i).fitness3;
    end
    for i = 1:length(Ichildren)
        [~,index] = min(fitness3);
        Populasi3(index) = [];
        fitness3(index) = [];
    end
    for i =1:length(Ichildren)
        Populasi3(length(Populasi3)+1) = Ichildren(i);
    end
    
    Inew_Populasi = Populasi3;
catch
    msgbox('proses elitism gagal');
end
