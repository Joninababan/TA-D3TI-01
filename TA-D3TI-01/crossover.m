function [child1,child2] = crossover(parent1,parent2,pcross)
try
    child1 = parent1;
    child2 = parent2;
    
    for i = 1:length(parent1)
        if rand <= pcross
            child1.pop(i) = parent2.pop(i);
            child2.pop(i) = parent1.pop(i);
        end
    end
catch
    msgbox('proses crossover gagal');
    
end
