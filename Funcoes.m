function [ y ] = Funcoes(u ,i)
    switch i
        case 't'
            y = Tangentehip(u);
        case 'l'
            y = Logistica(u);
    end 
end

