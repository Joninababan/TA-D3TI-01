function [best1,best2] = selection(Populasi)
try
    fvalue = zeros(1,length(Populasi));
    
    for i = 1:length(Populasi)
        fvalue(i) = Populasi(i).fitness;
    end
    
    [~,index] = max(fvalue);
    parent1 = Populasi(index);
    
    Populasi(index) = [];
    fvalue(index) = [];
    
    [~,index] = max(fvalue);
    parent2 = Populasi(index);
    best1 = parent1;
    best2 = parent2;
catch
    msgbox('proses selection gagal');
end