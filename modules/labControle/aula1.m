%% Laborat�rio de Controle 2018/2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% T�tulo: Aula 1 - Introdu��o ao Matlab
% Autor: Guilherme Fr�es Silva
% Apostila: Lu�s Fernando Alves Pereira e Jos� Felipe Haffner
% Data: 22/02/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Vetores
A = [2 4 6 8 10 12 14]  % Criamos vetores e matrizes utilizando '[' e ']'
A = [2 4 6 8 10 12 14]; % Nota-se que o ';' suprime o resultado da opera��o

A = 1:10;               % Tamb�m podemos definir intervalos com ':' para a 
                        % cria��o de vetores ou matrizes.
A = 2:2:14;             % Podendo, tamb�m, definir qual o valor de 
                        % incremento utilizando-se de tr�s elementos
                        % separados por ':'.

elem = A(3);            % Podemos acessar os elementos de uma vari�vel com
                        % '(i)' sendo 'i' a posi��o de tal elemento. Note
                        % que i pode ser multidimensional.

% IMPORTANTE: O primeiro elemento de uma vari�vel no MATLAB est� na
% posi��o '1', e n�o '0' como na maioria das linguagens de programa��o.

% Aqui estou utilizando o bloco "try-catch" para que n�o haja interrup��o do
% script quando ocorrer uma exeption (erro). 
try % tentando executar
    fprintf('Tentando executar "A(0)"...\n')
    A(0);               % erro, vai para o block "catch"
    fprintf('Sucesso!\n') % esta linha nunca � executada
catch e                 % guarda a exeption e a atribui a vari�vel "e"
    fprintf(strcat('Error:', e.message,'\n')); % imprime a mensagem de erro da 
                                               % exeption "e".
end

% Com o operador ':' � pos�vel realizar "slicing" para gerar,
% manipular ou acessar vetores e matrizes "em fatias".
% O que realmente acontece � que geramos vetores com
% '1:3', '4:6' e '1:2:7'. Depois, usamos os elementos desse vetor como
% indice para acessar os elementos da vari�vel A.

A(1:3)                  % Retorna os 3 primeiros elementos do vetor A.
A(4:6)                  % Retorna os elementos da quarta at� a sexta
                        % posi��o.
A(:)                    % Retorna todos os elementos em uma �nica dimens�o.
A(1:2:7)                % O elemento do meio define o incremento.

% Um erro � gerado se utilizarmos ind�ces que excedam as dimens�es da
% vari�vel.

try 
    fprintf('Tentando executar "A(1:10)"...\n')
    A(1:10);
    fprintf('Sucesso!\n')
catch e
    fprintf(strcat('Error:', e.message,'\n'));
%     rethrow(e) % "joga" novalmente a exce��o (erro) "e", causando a interrup��o
                 % do codigo.
end

% Tamb�m podemos atribuir valores � elementos espec�ficos de uma vari�vel 
% usando �ndices.
A(3) = 0
A(3) = 6                    % Valor original

% O Matlab tem diversas fun��es "de f�brica" (built-in functions) que s�o
% muito �teis.
length(A)                   % Retorna a maior dimens�o da matriz A
size(A)                     % Retorna todas as dimens�es da matriz A

%% Opera��es Aritm�ticas
% Todas opera��es aritm�ticas s�o v�lidas. O MATLAB considera todas as
% vari�veis como matrizes, e todas opera��es s�o (por padr�o) matriciais.

b = 2                       % Simples atribui��o de escalar.
C = b*A                     % Multiplica��o matriz-escalar
C - A

try 
    fprintf('Tentando executar "C*A"...\n')
    C*A;
    fprintf('Sucesso!\n')
catch e
    fprintf(strcat('Error:', e.message,'\n'));
%     rethrow(e)
end

C.*A                        % Multiplica��o elemento a elemento 
                            % (element-wise)
                            
At = A'                     % Transposta de A

%% Matrizes
% Para criar matrizes, come�amos com '[', usamos ';' a cada linha, 
% e fechamos com ']'.
M = [1 2 3; 4 5 6; 7 8 9]

% O operador '...' pode ser usado para continuar um comando na pr�xima 
% linha.
M = [1 2 3; ...
    4 5 6;  ...
    7 8 9];

% Para acessar seus elementos, devemos passar quantos indices for a
% dimensionalidade da matriz. Aqui usamos as coordenadas 'm' e 'n'. O
% MATLAB reserva as vari�veis 'i' e 'j' para definir unidades imagin�rias.
m = 3;                      % indica a linha
n = 2;                      % indica a coluna
M(m,n)

% Aqui podemos usar ':' em qualquer das dimens�es para retornar todos
% elementos nesta dimens�o
M(:,n)
M(m,:)
M(:,:)
M(:)                        % Retorna todos elementos em uma coluna s�.
                            % Note que o MATLAB ordena por colunas
                            % (column-major)
M(1:(m-1), 1:n)             % Equivalente a M(1:2,1:2) e, logo,
                            % M([1 2], [1 2])
                            
[zeros(1,3); M(2,:); M(3,:)]% zeros(m,n) gera uma matriz de zeros de 
                            % dimens�o m*n.
[ones(1,3); M(:,2); M(:,3)] % ones(m,n) gera uma matriz de 1's de 
                            % dimens�o m*n.

M*M                         % Multiplica��o de Matrizes
M.*M                        % Multiplica��o element-wise

%% Fun��es
% Como dito, o MATLAB possui diversas "built-in functions" comumente
% utilizadas, como sin, cos, log, exp, sqrt, e muitas outras. Diversas 
% constantes tamb�m j� est�o carregadas, como pi, i (ou j) = sqrt(-1).
i
i = 1
i
clear i
i

% O MATLAB possui uma extensa documenta��o que pode ser rapidamente
% consultada digitando (no "Command Window") o comando 'help'. Esta
% documenta��o tamb�m est� dispon�vel online (uma c�pia da documenta��o
% html pode ser vista usando o comando 'doc' da mesma forma que 'help'.
help abs

% Para visualizar rapidamente o c�digo de uma fun��o '.m', digite o comando
% 'type' seguido do nome da fun��o. N�o sendo built-in, seu c�digo ser�
% mostrado.
type abs
type angle

% Algumas fun��es de uso geral
clear A
clear all
figure(1)
close(1)
close all
whos
who
which angle
%cd, dir (MSDos, comandos unix)

%% Gr�ficos
% De modo geral, se usa a fun��o 'plot' para plotar gr�ficos no MATLAB.
a = 0.1;
b = 1;
t = 0:0.25:100;                 % Vetor de tempo
s1 = exp(-a*t);                 % Uma fun��o exponencial decrescente
s2 = sin(b*t);                  % Uma fun��o seno
y1 = s1.*s2;
y2 = s1+s2;

figure(1)                       % Abre uma janela de figura. Opcional.
hold on                         % "Guarda" o que j� foi plotado na janela.
                                % de modo que 'plots' sucessivos se
                                % sobrep�em
plot(t,y1)                      
plot(t,y2)
hold off                        
plot(t,y1)                      

% Pode-se tamb�m dividir uma janela de figura em subplots, para que seja
% poss�vel plotar fun��es em diferentes eixos.
figure(2) % dois gr�ficos superpostos gerados por um �nico comando plot
plot(t, [y1;y2])
figure(3) % dois gr�ficos superpostos gerados por um �nico comando plot
plot(t,y1,':r',t,y2,'-.b') % com tempos independentes para cada gr�fico
figure(4) % divide o gr�fico em duas partes, uma para cada plot
subplot(2,1,1)
plot(t,y1)
subplot(2,1,2)
plot(t,y2)

% O MATLAB tamb�m permite uma s�rie de customiza��es do gr�fico, como
% legendas, t�tulos, r�tulos dos eixos e etc.
close(4) %fecha afigura 4
close all %fecha todas as figuras
figure(1)
plot(t,y1,':k',t,y2,'-.b')
title('titulo do grafico')
xlabel('refer�ncia eixo x')
ylabel('refer�ncia eixo y')
legend('y1','y2')
text(60,1.5,'inserir texto')
