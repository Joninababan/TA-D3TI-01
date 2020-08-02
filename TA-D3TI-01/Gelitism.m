function Gnew_Populasi = Gelitism(Gchildren,Populasi2)
try
    fitness2 = zeros(1,length(Populasi2));
    for i=1:length(fitness2)
        fitness2(i) = Populasi2(i).fitness2;
    end
    for i = 1:length(Gchildren)
        [~,index] = min(fitness2);
        Populasi2(index) = [];
        fitness2(index) = [];
    end
    for i =1:length(Gchildren)
        Populasi2(length(Populasi2)+1) = Gchildren(i);
    end
    
    Gnew_Populasi = Populasi2;
catch
    msgbox('proses elitism gagal');
end
