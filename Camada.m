classdef Camada
   properties
      wSinapses
      qNeuro
      Funcao 
      Ysaida
   end
   methods  
      function obj = Camada(v ,f, x) %construtor
          obj.qNeuro = v;
          obj.Funcao = f;
          obj.wSinapses = rand([obj.qNeuro], x);
      end
      function y = Saida(x, obj)
          y = Funcoes(Somatorio(x, [obj.wSinapses]), [obj.Funcao]);
          y = [-ones(size(y,1),1), y];
      end 	  
  end 
end
