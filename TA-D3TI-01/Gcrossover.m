function [Gchild1,Gchild2] = Gcrossover(Gparent1,Gparent2,pcross)
try
    Gchild1 = Gparent1;
    Gchild2 = Gparent2;
    
    for i = 1:length(Gparent1)
        if rand >= pcross
            Gchild1.pop2(i) = Gparent2.pop2(i);
            Gchild2.pop2(i) = Gparent1.pop2(i);
        end
    end
catch
    msgbox('proses crossover gagal');
    
end
