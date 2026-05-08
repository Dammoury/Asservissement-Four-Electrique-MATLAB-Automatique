%% TP Partie 1 

clear;
clc;
close all;

%Q 1-3

p = tf('p');
K1 = 0.02;
tau1 = 2000;
G=K1/(p*(1+tau1*p));

disp('La fonction de transfert G(p) est :')
G

%G bien verifier et sous la bonne forme 

%Q 4
pole(G)
zero(G)

%Conclure sur la stabilite: Ce systeme est marginalement stable car on a un
%seul pole a zero 


% Plot the step response of the transfer function G
figure
step(G)
title('Fonction de Transfert G(p)')
grid on
% ici on remarque que cest marginalement stable car on a un pole negatif et
% ple nul 


%Q 5 
dcgain(G)

%Gain statique infini, donner par la ans = Inf
%COURS: le gain statique est logiquement infini car la FTBO est un
%integrateur d'ordre 2

%Quand on alimente le four a 6V on multiplie notre G(P) par la reponse
%frequencielle de v(t)=6 on a v(P) = 6/p et donc le gain statique de la
%fonction rest Inf. GInd(p)=(6/p)*G(p)

%Q 6 

GInd=(K1*6)/(p*(1+tau1*p));

disp('La reponse Indicielle de G(p) est :')
GInd

%step does the LaPlace of the function 

figure
step(GInd)
title('La reponse Indicielle de G(p)')
grid on

%on peut bien remarquer que le gain statique augmente aussi a l'infini mais il
%est 6x plus grand 


%Q 7
tau2 = 2;
K2 = 5 * 10^(-3);
H = K2/(1+tau2*p);

disp('La fonction de transfert H(p) est :')
H

%Q 8

pole(H)
zero(H)

% ici on a un pole (-1/2) et donc notre system est stable

%Q 9 

figure
step(H)
title('Fonction de Transfert H(p)')
grid on


%Q 10 

%CF simulink