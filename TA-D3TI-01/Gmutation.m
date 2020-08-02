function Gmutant = Gmutation (Gchild,pmutasi,maxgjbb)
try
    Gmutant = Gchild;
    
    for i = 1:length(Gmutant.pop2)
        if rand <= pmutasi
            Gmutant.pop2(1) = randi(maxgjbb);
            
        end
    end
catch
    msgbox('proses mutation gagal');
end
