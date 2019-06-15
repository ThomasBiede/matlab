%% PTn-Strecken
% PTn-Strecken sind Verz�gerungen h�herer Ordnung. Diese entstehen durch
% Hintereinandrreihung von mehreren PT1-Strecken. Eine m�gliche PTn-Strecke stellt
% z.B. die Serienschaltung verschiedener Teilstrecken eines Heizkreises dar: (i)
% Heizelement/Heizwendel (K1=1, T1=1), (ii) Metallk�rper (K1=1, T1=1.5), (iii) Luft
% (K1=1, T1=3).
%
% Der �bertragungsbeiwert des Heizelements wird im Regelfall einen
% �bertragungsbeiwert ungleich Eins haben (Spannung->Temperatur) - zur
% �bersichtlichen Darstellung wird in der �bung tortzdem ein �bertragungsbeiwert von
% Eins angenommen. F�r die beiden nachgeschalteten Teilstrecken ist es sinnvoll einen
% �bertragungsbeiwert von Eins anzunehmen, da die Ein- und Ausgangstemperaturen
% letztlich gleich sein werden.
clear all, close all, clc

%% �bertragungsfunktionen der einzelnen PT1-Strecken
% Erstellen Sie ein PTn-Strecken-Modell (�bertragungsfunktion) des obigen Heizkreises
% durch Serienschaltung der drei PT1-Strecken.

s = tf('s'); % komplexe Frequenz


%<ToDo />


%% Sprungantwort und Frequenzgang der einzelnen PT1-Strecken
% Stellen Sie die Sprungantworten und die Frequenzg�nge der einzelnen PT1-Strecken in
% jeweils einem Diagramm dar. F�gen Sie den Diagrammen mit dem Befehl  legend('show',
% 'Location', 'southeast') eine Legende hinzu.


%<ToDo />


%% PTn-Strecke aus einer Serienschaltung von PT1-Strecken
% Erzeugen sie nun durch die Hintereinanderschaltung der einzelnen PT1-Strecken eine
% PTn-Strecke und stellen Sie die Sprungantworten der einzelnen Streckenabschnitte
% sowie deren Frequenzg�nge dar.
%
% Anmerkung: Werden Strecken in Reihe geschaltet, so multiplizieren sich deren
% �bertragungsfunktionen.

% �bertragungsfunktionen der Streckenabschnitte

%<ToDo />


% Diagramm der Sprungantworten

%<ToDo />


% Diagramm der Frequenzg�nge

%<ToDo />


%% Empirische Bestimmung der Modellparameter einer PTn-Strecke
% Als vereinfachtes *Modell der PTn-Strecke* wird angenommen, dass n
% gleichartige PT1-Strecken hintereinander geschaltet werden.
%
% GPTn = K * 1/(1+s*T1) * 1/(1+s*T1) * ... * 1/(1+s*T1) = K/(1+s*T1)^n

% Im Regelfall sind die einzelnen Streckenteile nicht getrennt zug�nglich und k�nnen
% damit nicht einzelnen charakterisiert werden. Gemessen werden kann nur die
% Sprungantwort des Gesamtsystems G123=X3/Y wobei Gs=G123=G1*G2*G3 entspricht.
%
% *Ermittlung der Modellparameter aus der Sprungantwort*: Eine PTn-Strecke wird durch
% die sogenannte Verz�gerungszeit (Tu) und die Ausgleichzeit (Tg) charakterisiert.
% Dazu wird eine Wendetangente an die Kurve angelegt und die Schnittpunkte der
% Wendetangente mit der obern und unteren horizontalen Asymptote bestimmt.

% Ermitteln sie aus der simulierten Sprungantwort der PTn-Strecke die Ordnung der
% Strecke, die Verzugs- und die Ausgleichzeit sowie den �bertragungsbeiwert. F�hren
% Sie die Konstruktion im Diagramm durch und speichern Sie dieses mit der Bezeichnung
% 'PTn_Strecke.fig' im aktuellen Arbeitsverzeichnis ab.

% openfig('PTn_Strecke.fig') % Bild der Konstruktion einf�gen (Kommentar entfernen)

% Verzugs- und Ausgleichzeit (aus Konstruktion) und Tg/Tu-Verh�ltnis (berechnen)

%<ToDo />

disp( sprintf('Tu=%.2fs  Tg=%.2fs Tg/Tu=%.2f', [Tu Tg TgTu]) )


%  Tg/Tu | Tg/T1 | Tu/T1 |  n  
% ------------------------------
%  9.61  | 4.48  | 3.13  |  2.44 
%  2.03  | 1.75  | 1.56  |  1.41 
%  1.29  | 2.72  | 3.69  |  4.46 
%  5.12  | 5.70  | 6.23  |  6.71 
%  7.16  | 7.59  | 0.28  |  0.80 
%  1.42  | 2.10  | 2.81  |  3.55 
%  4.30  | 5.08  | 5.87  |  2.00 
%  3.00  | 4.00  | 5.00  |  6.00 
%  7.00  | 8.00  | 9.00  | 10.00 


%<ToDo />




% Diesen Block auskommentieren, um die errechneten Werte anzuzeigen!
% disp( sprintf('Messung: Tu=%.2fs  Tg=%.2fs -> Tg/Tu=%.2f', [Tu Tg TgTu]) )
% disp( sprintf('Tg/T1=%.2f (T1g=%.2fs)', [TgT1 T1g]) )
% disp( sprintf('Tu/T1=%.2f (T1u=%.2fs)', [TuT1 T1u]) )
% disp( sprintf('n=%.1f  T1gu=%.2f  Ks=%.2f', [n T1gu Ks]) )


%% Gegen�berstellung PTn-Strecke und PTn-Ersatzstrecke
% Stellen die folgenden Sprungantworten in einem Diagramm dar: (i) tats�chliche
% PTn-Strecke, (ii) PTn-Ersatzstrecke.


%<ToDo />


%% F�hrungsgr��ensprung f�r Regelkreis mit P-Regler
% Die PTn-Strecke soll mit einem P-Regler geregelt werden. Stellen sie die
% Sprungantwort f�r einen F�hrungsgr��ensprung dar, wobei die Reglereinstellung mit
% den folgenden drei unterschiedlichen Werten erfolgen soll.

vKp = [0.5 1 2];


%<ToDo />

