 function [elm] = ELM(v ,f , x, d)
   
 
    p = 10.^-8; %precisao
    epocaMax = 1;%elm 
    maxTestes = 10;
    time1 = clock(); %INICIO DA REDE
    x = Normalizar(x); 
    x = [-ones(size(x,1),1), x];% insere o Bias na entrada
    [xTreino] = amostraRand(x, d); %mistura as amostras
    v = [v size(d,2)];% adiciona a camada de saida na configuração da rede
    
for testeN=1:maxTestes
    clc;
    f
    v
    testeN
    for i=1:size(v,2)% Cria a todas camadas da rede
        if (i==1)
            c(1) = Camada(v(i), f, size(xTreino,2));% Inicializa o contrutor de camadas
        else
            c(i) = Camada(v(i) , f, c(i-1).qNeuro+1);
        end
    end
        ExisteErro = 1; %variavel que impede loop infinito 
		epoca = 0;% qtdd de vezes que a rede treinou 
		Erro = 1;
		ErroAnterior = 0;     
        
    while (ExisteErro > 0)
            [xTreino, xTeste, dTreino, dTeste] = amostraRand(x, d); %mistura as amostras
            epoca = epoca + 1; % atribuindo valor a epoca
            ExisteErro = 0; % impedido loop infinito  
        if(abs(Erro - ErroAnterior) > p)% compara se a diferença de erro é maior que a precisao
            ErroAnterior = Erro;
            ExisteErro = ExisteErro+1;

        %foward
        
        c = foward(xTreino, c);
        c(end).wSinapses =  pinv(c(end-1).Ysaida)*dTreino; %retorna o Pseudoinverso de Moore-Penrose.
        c(end).Ysaida = Funcoes(c(end-1).Ysaida*c(end).wSinapses, c(end).Funcao);
       %treinamento dos pesos de saida
        Erro = ErroQuadMed(dTreino, c(end).Ysaida);
        
        if (epoca > epocaMax)
            ExisteErro = 0;
        end
        for i=1:size(c,2) 
            wIdeal(i) = Sinapses(c(i).wSinapses,c(i).Funcao, i);
        end
        
        end
    end
            AcertosTeste(testeN) = teste(xTeste, dTeste, c);
            ErrosTreino(testeN) = Erro;
end
time2 = clock(); %TERMINO DA REDE
elm.arranjo = v;
elm.Camadas = wIdeal;
elm.TaxaAcertosTeste = AcertosTeste;
elm.ErrosTreino = sum(ErrosTreino)/maxTestes;
elm.Time = time2-time1;
end

    

	