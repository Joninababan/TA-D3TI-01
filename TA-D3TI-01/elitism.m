function new_Populasi = elitism(children,Populasi)
try
    fitness = zeros(1,length(Populasi));
    for i=1:length(fitness)
        fitness(i) = Populasi(i).fitness;
    end
    for i = 1:length(children)
        [~,index] = min(fitness);
        Populasi(index) = [];
        fitness(index) = [];
    end
    for i =1:length(children)
        Populasi(length(Populasi)+1) = children(i);
    end
    
    new_Populasi = Populasi;
catch
    msgbox('proses elitism gagal');
end
