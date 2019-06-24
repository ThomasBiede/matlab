%% Kompensationsverfahren und Betragsoptimum
% _Gesundheitsmechatronik - Regelungstechnik, Dr. Pierre Elbischger, 6.5.2016_
%%
% In dieser �bung soll die Reglereinstellung nach dem Kompensationsverfahren und dem
% Betragsoptimum n�her untersucht werden. Dazu werden mehrere Regelstrecken mit
% unterschiedlichen vielen Verz�gerungsgliedern untersucht, d.h. PT1, PT2 und PT3,
% wobei die kleinste Zeitkonstante stets gleich bleibt und die zus�tzlich
% eingebrachten Verz�gerungen steigende Zeitkonstanten aufweisen, d.h. T1<T2<T3. Die
% Streckenverst�rkung betr�gt 0dB.
% Das zu erwartende Streckenverhalten ist zu berechnen und mit einer Simulation mit
% dem sisotool() zu �berpr�fen.

%% Aufgabenstellung
% Bearbeiten sie die folgenden Aufgaben in der angegebenen Reihenfolge. Bei
% s�mtlichen Aufgaben soll am Ende das selbe Regelverhalten erreicht werden, n�mlich
% das einer PT1-Strecke in Kombination mit einem I-Regler. Berechnen sie die
% Reglereinstellungen analytisch und stellen sie im Rahmen der Simulation stets den
% F�hrungsgr��ensprung (Anregelzeit, �berschwingen) und den Frequenzgang G0 des
% offenen und Gw des geschlossenen Regelkreises dar (Phasenrand, Amplidudenrand).

%% Herleitung des Betragsoptimums f�r PT1-Strecke mit I-Regler
% * Leiten sie die L�sung f�r die Reglereinstellung nach dem Betragsoptimum f�r eine
% PT1-Strecke in Kombination mit einem I-Regler analystisch her (Theorieunterricht
% oder �bung). Der geschlossene Regelkreis soll mit einer kritischen D�mpfung
% arbeiten. Die Herleitung kann gegebenenfalls auch im Theorieunterricht erfolgen. 
 
%% SIMULATION DES REGELKREISES mit dem SISOTOOL()
clear all, close all, clc
s = tf('s');

% * 
% * 
% * PT1-I-Strecke mit P-Regler (Ks = 1; T1 = 0.2;) 
% * PT2-Strecke mit PI-Regler (Ks = 1; T1 = 0.5; T2 = 0.2;)
% * PT3-Strecke mit PID-Regler (exakte Einstellung; Ta=T1; Tb=T2)
% * PT3-Strecke mit PID-Regler (N�herungseinstellung; Tn=T1; Tv=T2)
% * PT1-Strecke mit PID-Regler - optimale Einstellung mit PID-Tool

%% PT1-Strecke mit I-Regler (aperiodisch)
Ks = 1; T1 = 0.2; 

%<ToDo />



%% PT1-Strecke mit I-Regler (4% �berschwingen)
Ks = 1; T1 = 0.2; 

%<ToDo />



%% PT1-I-Strecke mit P-Regler
Ks = 1; T1 = 0.2; 
Gs = Ks/(1+s*T1)/s; % PT1-I-Strecke
%Kp = 1/(4*Ks*T1); % aperiodischer Grenzfall
Kp = 1/(2*Ks*T1) % 4% �berschwingen
Gr = Kp; % P-Regler
%sisotool(Gs, Gr)

%%%
% Gleiches Regelverhalten wie PT1-Strecke mit I-Regler. Der I-Anteil befindt sich nun
% in der Strecke. 
%
% 


%% PT2-Strecke mit PI-Regler
Ks = 1; T1 = 0.5; T2 = 0.2;


%<ToDo />



%% PT3-Strecke mit PID-Regler (exakte Einstellung)
Ks = 1; T1 = 1; T2 = 0.5; T3 = 0.2;


%<ToDo />


%% PT3-Strecke mit PID-Regler (N�herungseinstellung)
Ks = 1; T1 = 1; T2 = 0.5; T3 = 0.2;


%<ToDo />

