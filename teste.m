function [acertos] = teste(x, d, obj)     
   c = foward(x, obj);
   c(end).wSinapses =  pinv(c(end-1).Ysaida)*d;
   c(end).Ysaida = Funcoes(c(end-1).Ysaida*c(end).wSinapses, c(end).Funcao);
   y = Sinal(c(end).Ysaida);
   y = Definicao(y);
   d = Definicao(d);
   acertos = find(~(d-y));
   acertos = sum(size(acertos, 1))/size(d,1);
end