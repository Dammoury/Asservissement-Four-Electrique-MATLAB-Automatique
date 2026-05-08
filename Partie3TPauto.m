clear;
clc;
close all;
p=tf('p');
K1=0.02;
K2=5*10^(-3);
tau1=2000;
G= K1/(p*(1+tau1*p))
%Q25
GBO_nc=K2*G
figure(1)
step(GBO_nc)
%bode(GBO_nc);
grid on;
title('Bode Plot of GBO_nc');
%Screens Stefan
Omega_0C_rad=7*10^(-4); %rad/s
Omega_0C_deg=180/pi*Omega_0C_rad; %degrés

Mphi_deg= 60 %Marge de phase en degrés
Mphi_rad= pi/180*Mphi_deg %Marge de phase en radians

GBO_ncfr=freqresp(GBO_nc,Omega_0C_rad); %Calcul de GBO_nc(j fr)
phaseRad= angle(GBO_ncfr)
phaseDeg= 180/pi*phaseRad
%Q26
Delta_Phi_deg= Mphi_deg-pi-phaseDeg
Delta_Phi_rad= Mphi_rad -pi-phaseRad

%Q27
Phimax_rad=Delta_Phi_rad;
Omega_max_rad= Omega_0C_rad;

a=(1+sin(Phimax_rad))/(1-sin(Phimax_rad))
tau=1/(Omega_max_rad*sqrt(a))

%Q28
GBO_p=K2*G*((1+a*tau*p)/(1+tau*p))
GBO_pfr=freqresp(GBO_p,Omega_max_rad);
module=abs(GBO_pfr);
gaindB= 20*log10(module)
figure(2)
grid on;
bode(GBO_p)
%margin(GBO_p)

%Q29
%On utilise la formule qui lie le gain a K (module de la FT)
K=10^(-gaindB/20)

%Q30
C= K*((1+a*tau*p)/(1+tau*p))
GBO= K2*G*C
figure(3)
grid on;
margin(GBO)
%cf picture

%Q31
figure(4)
FBF=minreal(GBO/(1+GBO))
step(1200*FBF)

tr52=5.11e+03; %5110 secondes
trmax=3.3*3600 %=11880 secondes

%On constate que le tr5<trmax donc les objets ne seront pas endommagés par
%le choix de ces paramètres.Inutile de les redéterminer.

%Q32

duree_1_cycle= (2*tr52+3600+1440)/3600 
%La durée d'un cycle se trouve par la définition du cahier des charges du
%four qui définit le temps total qui se découpe en 3 parties: 
% 1-Temps pour atteindre le régime permanent pour 
% atteindre la température de 1200 degrés (2*temps de réponse à 5 pourcents
% 2-Temps de chauffe des objets pendant une heure (3600 secondes) 
% à la température de 1200 degrés 
% 3-Temps de refroidissement du four 24min (1440 secondes)
nombre_de_cycles= 24/(duree_1_cycle)

%Q33

