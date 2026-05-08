clear;
clc;
close all;
p=tf('p');
%11 Le role du gain K2 est de convertir la grandeur de chaleur vers une
% grandeur tension. (comparer 2 signaux qui sont de meme grandeur physique)
K1=0.02;
tau1=2000;
G= K1/(p*(1+tau1*p))
pole(G)
K2=5e-3;
tau2=2;

%13 Pour Kp=10 

Kp=10;
K=1
wn=sqrt((K2*K1*Kp)/tau1)
Ksi=1/(2*sqrt(tau1*K1*K2*Kp)) %(obtenus par calculs a la main)

%14

Fbf=(K*(wn^2))/(p^2+2*Ksi*wn*p+wn^2)
figure(1)
step(Fbf);

res=minreal((K2*Kp*G)/(1+Kp*G*K2))
% on obtient les memes resultats par le produit de fonction (minreal) avec
% les gains K2 et Kp ainsi que la FTBO G(p) et par les parametres K, Ksi 
% et wn que l'on a déterminé à la question 13.

%Q15
figure(2)
step(res)
% Le temps de montee Tm= 2.92e+03 s (obtenu  par lecture de graphique sur
% la courbe Matlab (figure(2))).
% Tandis que le temps de montee Tm=2.828e+03 s (obtenu par lecture de l'abaque
% figure 3 (sur l'enonce)).
% Ainsi, notre approximation par calcul de Tm par l'abaque est tres proche
% de la valeur obtenue par lecture graphique de la courbe Matlab, ce qui
% justifie notre calcul de parametres (approche theorique proche de
% l'approche experimentale)

%Q16
figure(3);
[y,t] = step(Fbf); % Reponse indicielle à une entree echelon unite
[y2,t] = impulse(1/p,t); % Entree echelon avec le meme vecteur temps
plot(t,y,'b','LineWidth',1.5); 
hold on
plot(t,y2,'r--','LineWidth',1.2)
legend('Réponse indicielle','Entrée échelon (1/p)')
xlabel('Temps (s)')
ylabel('Amplitude')
grid on

% On constate que l'erreur statique tend vers 0 lorsque le temps tend a
% augmenter. rajouter capture (a faire)
%Q17

figure(4)
[y3,t] = step(minreal(Fbf*(1/p))); % Reponse indicielle à une rampe de pente unitaire
[y4,t]= impulse(1/p^2,t); % Rampe d'entree avec le meme vecteur temps
plot(t,y3,'b','LineWidth',1.5); 
hold on
plot(t,y4,'r--','LineWidth',1.2)
legend('Réponse indicielle','Entrée Rampe (1/p^2)')
xlabel('Temps (s)')
ylabel('Amplitude')
grid on

% On constate que l'erreur dynamique tend aussi vers 0 lorsque le temps
% tend a augmenter.
% De plus, si on s'interresse à l'erreur dynamique en zoomant sur la courbe
% obtenue dans matlab a 300 secondes, on obtient environ une erreur
% dynamique epsdyn=298, ce qui est négligeable par rapport a l'amplitude 
% du système et son temps de fonctionnement. (rajouter capture d'écran)

%Q18

figure(5)
step(Fbf*1200)
grid on 

% On obtient un temps de réponse: 
tr51=1.11e+04 % en s

Rperm= 2*tr51 % en s
tchauffe= 3600 % en s
trefroidissement= 1440 % en s
tcyclesec= Rperm+ tchauffe +trefroidissement % en s*
tcycle1day= 24/(tcyclesec/3600)

%Q19
% En observant la courbe obtenue en figure 5, nous notons une réponse
% indicielle avec un dépassement D%=30.5 qui fait que l'on atteint une
% amplitude de 1570 (température en °C) donc non, impossible de réaliser un
% traitement thermique sans endommager l'objet traité car la limite de
% 1400°C est largement depassee avec un gain Kp=10.

%Q20
% D'après la question 18, nous avons pu déterminer que pour un gain Kp=10,
% le nombre de cycles realisables en une journee tcycle1day=3.1718 >3 donc
% oui, il est possible de realiser 3 cycles de traitement thermique sur une
% journee avec un gain Kp=10.


%Q21

%13bis

newKp=1;
newwn=sqrt((K2*K1*newKp)/tau1)
newKsi=1/(2*sqrt(tau1*K1*K2*newKp))

%14bis

newFbf=(K*(newwn^2))/(p^2+2*newKsi*newwn*p+newwn^2)
figure(6)
step(newFbf);

newres=minreal((K2*newKp*G)/(1+newKp*G*K2))

% on obtient les memes resultats par le produit de fonction (minreal) avec
% les gains K2 et newKp ainsi que la FTBO G(p) et par les parametres K, newKsi 
% et newwn que l'on a déterminé.


%Q15bis

figure(7)
step(newres)

% Le temps de montee newTm ne peut pas etre determine a cause du fait que
% le systeme est maintenant sur-amorti car newKsi >1 donc il n'y a aucun
% point ou la courbe franchi la valeur finale (qui est non atteinte)
% Le système est tellement lent que il n'est pas possible d'atteindre le
% temps final


%Q16bis

figure(8);
[y,t] = step(newFbf); % Reponse indicielle à une entree echelon unite
[y2,t] = impulse(1/p,t); % Entree echelon avec le meme vecteur temps
plot(t,y,'b','LineWidth',1.5); 
hold on
plot(t,y2,'r--','LineWidth',1.2)
legend('Réponse indicielle','Entrée échelon (1/p)')
xlabel('Temps (s)')
ylabel('Amplitude')
grid on

% On constate que l'erreur statique tend vers 0 lorsque le temps tend a
% augmenter. D'ailleurs, en comparant au système avec le gain Kp=10, on
% remarque que l'erreur statique du systeme avec Kp=1 est encore plus
% réduite facteur 10 entre les 2 (tend plus rapidement vers 0)

%Q17bis

figure(9)
[y3,t] = step(minreal(newFbf*(1/p))); % Reponse indicielle à une rampe de pente unitaire
[y4,t]= impulse(1/p^2,t); % Rampe d'entree avec le meme vecteur temps
plot(t,y3,'b','LineWidth',1.5); 
hold on
plot(t,y4,'r--','LineWidth',1.2)
legend('Réponse indicielle','Entrée Rampe (1/p^2)')
xlabel('Temps (s)')
ylabel('Amplitude')
grid on

% On constate que l'erreur dynamique tend aussi vers 0 lorsque le temps
% tend a augmenter.
% De plus, si on s'interresse à l'erreur dynamique en zoomant sur la courbe
% obtenue dans matlab a 300 secondes, on obtient environ une erreur
% dynamique newepsdyn=300, ce qui est négligeable par rapport a l'amplitude 
% du système et son temps de fonctionnement. (rajouter capture d'écran)

%Q18bis

figure(10)
step(newFbf*1200)
grid on 

tr52= 2.52e+04 %en s

newRperm= 2*tr52 % en s
tchauffe= 3600 % en s
trefroidissement= 1440 % en s
newtcyclesec= newRperm+ tchauffe +trefroidissement % en s*
newtcycle1day= 24/(newtcyclesec/3600)

% On constate que notre tr52 avec Kp=1 est environ le double de notre
% tr51 avec Kp=10, on remarque donc par calcul que nous sommes 50% 
% moins efficace que notre système avec le gain Kp=10.

%Q22
% On remarque que avec ce gain Kp=1, le systeme n'a pas de depassement
% (on ne depasse donc pas la temperature limite de 1200°C), nous
% n'endommageons donc pas l'objet traite.

%Q23

%Il n'est pas possible de réaliser 3 cycles de traitements sur une journée
% En effet, ayant obtenu newtcycle1day=1.5584 <3, on conclut sur le fait 
% que ce n'est pas possible.

tau2=2;
K2=5e-3;
H=K2/(1+tau2*p)