function mutant = mutation (child,pmutasi,maxskor)
try
mutant = child;

for i = 1:length(mutant.pop)
    if rand <= pmutasi
        mutant.pop(1) = randi(maxskor);
        
    end
end
catch
    msgbox('proses mutation gagal');
end
