function Imutant = Imutation (Ichild,pmutasi,maxipk)
Imutant = Ichild;

for i = 1:length(Imutant.pop3)
    if rand <= pmutasi
        Imutant.pop3(1) = randi(maxipk);
        
    end
end
end
