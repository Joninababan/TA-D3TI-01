function [Gbest1,Gbest2] = Gselection(Populasi2)
try
    Gfvalue = zeros(1,length(Populasi2));
    
    for i = 1:length(Populasi2)
        Gfvalue(i) = Populasi2(i).fitness2;
    end
    
    [~,index] = max(Gfvalue);
    Gparent1 = Populasi2(index);
    
    Populasi2(index) = [];
    Gfvalue(index) = [];
    
    [~,index] = max(Gfvalue);
    Gparent2 = Populasi2(index);
    Gbest1 = Gparent1;
    Gbest2 = Gparent2;
catch
    msgbox('proses selection gagal gagal');
end