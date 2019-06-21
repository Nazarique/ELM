clear all
clc
rede = 'vinho_l';
qN = 5; %incremento de neuronios
Nm = 100; %qtdd maxima de neuronios
c = 2; %qdd maxima de camadas
v = 1:(Nm/qN);
f = 'l';
tic
Dados = load('DadosVinho.mat');
Dados = Dados.x;
x = Dados(:,1:13);
d = Dados(:,14:end);
l = 0;
for i=1:c
    l = combvec(v,l);
    y = qN*l(1:i,:)';
    parfor j=1:size(y,1)
        elm(i, j) = ELM(y(j,:) ,f , x, d);
    end
end
save('ResultadoVinhoELM_t.mat','elm');

% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clear all
% clc
% rede = 'vinho_l';
% qN = 5; %incremento de neuronios
% Nm = 100; %qtdd maxima de neuronios
% c = 2; %qdd maxima de camadas
% v = 1:(Nm/qN);
% 
% f = 'l';
% tic
% Dados = load('DadosVinho.mat');
% Dados = Dados.x;
% x = Dados(:,1:13);
% d = Dados(:,14:end);
% l = 0;
% for i=1:c
%     l = combvec(v,l);
%     y = qN*l(1:i,:)';
%         for j=1:size(y,1)
%             elm(i, j) = ELM(y(j,:) ,f , x, d);   
%         end
% end
% save('ResultadoVinhoELM_l.mat','elm');
% toc
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clear all
% clc
% rede = 'Iris_t';
% qN = 5; %incremento de neuronios
% Nm = 100; %qtdd maxima de neuronios
% c = 2; %qdd maxima de camadas
% v = 1:(Nm/qN);
% 
% f = 't';
% tic
% Dados = load('Iris.txt');
% 
% x = Dados(:,1:4);
% d = Dados(:,5:end);
% l = 0;
% for i=1:c
%     l = combvec(v,l);
%     y = qN*l(1:i,:)';
%         for j=1:size(y,1)
%             elm(i, j) = ELM(y(j,:) ,f , x, d);
%         end
% end
% save('ResultadoIrisELM_t.mat','elm');
% toc
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clear all
% clc
% rede = 'Iris_l';
% qN = 5; %incremento de neuronios
% Nm = 100; %qtdd maxima de neuronios
% c = 2; %qdd maxima de camadas
% v = 1:(Nm/qN);
% f = 'l';
% tic
% Dados = load('Iris.txt');
% x = Dados(:,1:4);
% d = Dados(:,5:end);
% l = 0;
% for i=1:c
%     l = combvec(v,l);
%     y = qN*l(1:i,:)';
%         for j=1:size(y,1)
%             elm(i, j) = ELM(y(j,:) ,f , x, d);
%         end
% end
% save('ResultadoIrisELM_l.mat','elm');
% toc
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clear all
% clc
% rede = 'Bank_t';
% qN = 5; %incremento de neuronios
% Nm = 100; %qtdd maxima de neuronios
% c = 2; %qdd maxima de camadas
% v = 1:(Nm/qN);
% f = 't';
% tic
% Dados = load('bank_dados.txt');
% x = Dados(:,1:(end-1));
% d = Dados(:,end);
% l = 0;
% for i=1:c
%     l = combvec(v,l);
%     y = qN*l(1:i,:)';
%         for j=1:size(y,1)
%             elm(i, j) = ELM(y(j,:) ,f , x, d);
%         end
% end
% save('ResultadoBankELM_t.mat','elm');
% toc
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clear all
% clc
% rede = 'Bank_l';
% qN = 5; %incremento de neuronios
% Nm = 100; %qtdd maxima de neuronios
% c = 2; %qdd maxima de camadas
% v = 1:(Nm/qN);
% f = 'l';
% tic
% Dados = load('bank_dados.txt');
% x = Dados(:,1:(end-1));
% d = Dados(:,end);
% l = 0;
% for i=1:c
%     l = combvec(v,l);
%     y = qN*l(1:i,:)';
%         for j=1:size(y,1)
%             elm(i, j) = ELM(y(j,:) ,f , x, d);   
%         end
% end
% save('ResultadoBankELM_l.mat','elm');
% toc
