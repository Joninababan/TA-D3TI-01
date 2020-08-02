function [Ibest1,Ibest2] = Iselection(Populasi3)
try
    Ifvalue = zeros(1,length(Populasi3));
    
    for i = 1:length(Populasi3)
        Ifvalue(i) = Populasi3(i).fitness3;
    end
    
    [~,index] = max(Ifvalue);
    Iparent1 = Populasi3(index);
    
    Populasi3(index) = [];
    Ifvalue(index) = [];
    
    [~,index] = max(Ifvalue);
    Iparent2 = Populasi3(index);
    Ibest1 = Iparent1;
    Ibest2 = Iparent2;
catch
    msgbox('proses selection gagal');
end