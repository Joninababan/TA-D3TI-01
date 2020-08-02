function [Ichild1,Ichild2] = Icrossover(Iparent1,Iparent2,pcross)
try
    Ichild1 = Iparent1;
    Ichild2 = Iparent2;
    
    for i = 1:length(Iparent1)
        if rand >= pcross
            Ichild1.pop3(i) = Iparent2.pop3(i);
            Ichild2.pop3(i) = Iparent1.pop3(i);
        end
    end
    
catch
    msgbox('proses crossover gagal');
    
end
