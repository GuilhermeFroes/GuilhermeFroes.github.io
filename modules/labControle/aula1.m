%% Laboratório de Controle 2018/2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Título: Aula 1 - Introdução ao Matlab
% Autor: Guilherme Fróes Silva
% Apostila: Luís Fernando Alves Pereira e José Felipe Haffner
% Data: 22/02/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Vetores
A = [2 4 6 8 10 12 14]  % Criamos vetores e matrizes utilizando '[' e ']'
A = [2 4 6 8 10 12 14]; % Nota-se que o ';' suprime o resultado da operação

A = 1:10;               % Também podemos definir intervalos com ':' para a 
                        % criação de vetores ou matrizes.
A = 2:2:14;             % Podendo, também, definir qual o valor de 
                        % incremento utilizando-se de três elementos
                        % separados por ':'.

elem = A(3);            % Podemos acessar os elementos de uma variável com
                        % '(i)' sendo 'i' a posição de tal elemento. Note
                        % que i pode ser multidimensional.

% IMPORTANTE: O primeiro elemento de uma variável no MATLAB está na
% posição '1', e não '0' como na maioria das linguagens de programação.

% Aqui estou utilizando o bloco "try-catch" para que não haja interrupção do
% script quando ocorrer uma exeption (erro). 
try % tentando executar
    fprintf('Tentando executar "A(0)"...\n')
    A(0);               % erro, vai para o block "catch"
    fprintf('Sucesso!\n') % esta linha nunca é executada
catch e                 % guarda a exeption e a atribui a variável "e"
    fprintf(strcat('Error:', e.message,'\n')); % imprime a mensagem de erro da 
                                               % exeption "e".
end

% Com o operador ':' é posível realizar "slicing" para gerar,
% manipular ou acessar vetores e matrizes "em fatias".
% O que realmente acontece é que geramos vetores com
% '1:3', '4:6' e '1:2:7'. Depois, usamos os elementos desse vetor como
% indice para acessar os elementos da variável A.

A(1:3)                  % Retorna os 3 primeiros elementos do vetor A.
A(4:6)                  % Retorna os elementos da quarta até a sexta
                        % posição.
A(:)                    % Retorna todos os elementos em uma única dimensão.
A(1:2:7)                % O elemento do meio define o incremento.

% Um erro é gerado se utilizarmos indíces que excedam as dimensões da
% variável.

try 
    fprintf('Tentando executar "A(1:10)"...\n')
    A(1:10);
    fprintf('Sucesso!\n')
catch e
    fprintf(strcat('Error:', e.message,'\n'));
%     rethrow(e) % "joga" novalmente a exceção (erro) "e", causando a interrupção
                 % do codigo.
end

% Também podemos atribuir valores à elementos específicos de uma variável 
% usando índices.
A(3) = 0
A(3) = 6                    % Valor original

% O Matlab tem diversas funções "de fábrica" (built-in functions) que são
% muito úteis.
length(A)                   % Retorna a maior dimensão da matriz A
size(A)                     % Retorna todas as dimensões da matriz A

%% Operações Aritméticas
% Todas operações aritméticas são válidas. O MATLAB considera todas as
% variáveis como matrizes, e todas operações são (por padrão) matriciais.

b = 2                       % Simples atribuição de escalar.
C = b*A                     % Multiplicação matriz-escalar
C - A

try 
    fprintf('Tentando executar "C*A"...\n')
    C*A;
    fprintf('Sucesso!\n')
catch e
    fprintf(strcat('Error:', e.message,'\n'));
%     rethrow(e)
end

C.*A                        % Multiplicação elemento a elemento 
                            % (element-wise)
                            
At = A'                     % Transposta de A

%% Matrizes
% Para criar matrizes, começamos com '[', usamos ';' a cada linha, 
% e fechamos com ']'.
M = [1 2 3; 4 5 6; 7 8 9]

% O operador '...' pode ser usado para continuar um comando na próxima 
% linha.
M = [1 2 3; ...
    4 5 6;  ...
    7 8 9];

% Para acessar seus elementos, devemos passar quantos indices for a
% dimensionalidade da matriz. Aqui usamos as coordenadas 'm' e 'n'. O
% MATLAB reserva as variáveis 'i' e 'j' para definir unidades imaginárias.
m = 3;                      % indica a linha
n = 2;                      % indica a coluna
M(m,n)

% Aqui podemos usar ':' em qualquer das dimensões para retornar todos
% elementos nesta dimensão
M(:,n)
M(m,:)
M(:,:)
M(:)                        % Retorna todos elementos em uma coluna só.
                            % Note que o MATLAB ordena por colunas
                            % (column-major)
M(1:(m-1), 1:n)             % Equivalente a M(1:2,1:2) e, logo,
                            % M([1 2], [1 2])
                            
[zeros(1,3); M(2,:); M(3,:)]% zeros(m,n) gera uma matriz de zeros de 
                            % dimensão m*n.
[ones(1,3); M(:,2); M(:,3)] % ones(m,n) gera uma matriz de 1's de 
                            % dimensão m*n.

M*M                         % Multiplicação de Matrizes
M.*M                        % Multiplicação element-wise

%% Funções
% Como dito, o MATLAB possui diversas "built-in functions" comumente
% utilizadas, como sin, cos, log, exp, sqrt, e muitas outras. Diversas 
% constantes também já estão carregadas, como pi, i (ou j) = sqrt(-1).
i
i = 1
i
clear i
i

% O MATLAB possui uma extensa documentação que pode ser rapidamente
% consultada digitando (no "Command Window") o comando 'help'. Esta
% documentação também está disponível online (uma cópia da documentação
% html pode ser vista usando o comando 'doc' da mesma forma que 'help'.
help abs

% Para visualizar rapidamente o código de uma função '.m', digite o comando
% 'type' seguido do nome da função. Não sendo built-in, seu código será
% mostrado.
type abs
type angle

% Algumas funções de uso geral
clear A
clear all
figure(1)
close(1)
close all
whos
who
which angle
%cd, dir (MSDos, comandos unix)

%% Gráficos
% De modo geral, se usa a função 'plot' para plotar gráficos no MATLAB.
a = 0.1;
b = 1;
t = 0:0.25:100;                 % Vetor de tempo
s1 = exp(-a*t);                 % Uma função exponencial decrescente
s2 = sin(b*t);                  % Uma função seno
y1 = s1.*s2;
y2 = s1+s2;

figure(1)                       % Abre uma janela de figura. Opcional.
hold on                         % "Guarda" o que já foi plotado na janela.
                                % de modo que 'plots' sucessivos se
                                % sobrepõem
plot(t,y1)                      
plot(t,y2)
hold off                        
plot(t,y1)                      

% Pode-se também dividir uma janela de figura em subplots, para que seja
% possível plotar funções em diferentes eixos.
figure(2) % dois gráficos superpostos gerados por um único comando plot
plot(t, [y1;y2])
figure(3) % dois gráficos superpostos gerados por um único comando plot
plot(t,y1,':r',t,y2,'-.b') % com tempos independentes para cada gráfico
figure(4) % divide o gráfico em duas partes, uma para cada plot
subplot(2,1,1)
plot(t,y1)
subplot(2,1,2)
plot(t,y2)

% O MATLAB também permite uma série de customizações do gráfico, como
% legendas, títulos, rótulos dos eixos e etc.
close(4) %fecha afigura 4
close all %fecha todas as figuras
figure(1)
plot(t,y1,':k',t,y2,'-.b')
title('titulo do grafico')
xlabel('referência eixo x')
ylabel('referência eixo y')
legend('y1','y2')
text(60,1.5,'inserir texto')
