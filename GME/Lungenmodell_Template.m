clear, close all, clc
%% Numerische Simulation eines Lungenmodells
% In dieser �bung soll ein einfaches Modell einer menschlichen Lunge untersucht 
% werden. 
%% Lungenmodell und Modellparameter
% Skizzieren und beschreiben sie kurz das einfache, der Analyse zugrundeliegende, 
% Lungenmodell. Erl�utern Sie die einzelnen Bestandteile des Ersatzschaltbildes 
% und f�hren Sie die vorkommenden physiologischen Gr��en ein. Zeigen Sie deren 
% Parallelen zu elektrischen Netzwerken. Im Modell soll der Str�mungswiderstand 
% des Endotrachealtubus R_ID8=4mbarl/s (ID8...Innnendurchmesser 8mm), der Str�mungswiderstand 
% der Atemwege (Luftr�hre und Bronchien) R=2mbarl/s und die Lungenkapazit�t C=0,1 
% l/mbar betragen.
%%
%<ToDo />
%% 
% Elektrotechnische Gr��en | Physiologische Gr��en
% 
% * Ursache: Spannung in V | Druckunterschied p in mbar
% * Wirkung: Strom i(t) = dq(t) / dt in A | Volumenstrom q(t) = dV(t) / dt in 
% l/s
% * Verluste (Spannungsabfall bzw. Druckabfall durch Reibung): Ohmschen Widerstand 
% R = u(t) / i(t) in Ohm                                    Atemwegswiderstand 
% R = p(t) / q(t)
% * Energiespeicher (Dehnung): Kapazit�t C = dq / du in Farrad | Lungenkapazit�t 
% C = dV / dp in l/mbar                                                         
% hohe Kapazit�t -> leicht dehnbar 
% 
% Die Ursache f�r einen Volumenstrom ist der Atemwegsdruck p_aw, der vom 
% Beatmungsger�t erzeugt wird und einem Differenzdruck zum atmosph�rischen luftdruck(Maassenpotential) 
% entspricht. EIne menschliche Lunge kann als R-C-Glied modelliert werden. Der 
% Str�mungswiderstand R repr�sentiert die Reibungsverluste der Gasstr�mung und 
% entspricht der Reihenschaltung von Tubus (ZUleitung) und Atemweg (Luftr�hre 
% & Bronchien) und entspricht dem Verh�ltnis R = p_R(t) / q(t), wobei p_R(t) dem 
% Druckabfall �ber dem Str�mungswiderstand und q(t) dem Volumenstrom entspricht. 
% Die lUngenkapazit�t C repr�sentiert die Dehnbarkeit der Lunge und entspricht 
% dem Verh�ltnis c = dV / dp und ist konstant, d.h. 
%% Numerische Berechnung des F�llvorganges
% In der zu simulierenden Inspirationsphase soll ein Tidalvolumen von V_T=500ml 
% in die Lungen eingebracht werden. Der F�llvorgang der Lunge (Volumenstrom, Lungendruck) 
% ist f�r eine Beatmung mit konstantem Atemwegsdruck P_aw (druckkontrollierte 
% Beatmung) und auf Basis des entwickelten Lungenmodells numerisch zu berechnen 
% und dem theoretischen zu erwartenden Verl�ufen gegen�berzustellen. 
% 
% Zur numerischen Berechnung wird das Systemsverhalten in kurzen Zeitintervalle 
% betrachtet - in gleicher Weise Arbeiten professionelle Simulationswerkzeuge 
% wie z.B. Mutlisim. Werden die Zeitspannen klein genug gew�hlt, so ver�ndern 
% sich die die Dr�cke und der Fluss innerhalb der Zeitintervalle nur wenig und 
% k�nnen als ann�hernd konstant angeonmmen werden - in kurzer Zeit kann nur wenig 
% Gas in die Lunge einstr�men, weshalb der Lungendruck sich auch nur wenig �ndert. 
% Die Annahme von konsanten Gr��en vereinfacht die Berechnung erheblich, sodass 
% lediglich einfache mathematische Operationen zur Berechnung der Gr��en im aktuellen 
% Zeitintervall und den neuen Gr��en im n�chsten Zeitintervall notwendig sind. 
% Das Resultat ist ein st�ckweise stetige N�herung des zeitlichen Verlaufs der 
% einzelnen Gr��en - mathematisch spricht man von einer sogenannten Differenzengleichung. 
% Der exakte zeitliche Verlauf entspricht der L�sung einer linearen Differentialgleichung 
% erster Ordnung (RC-Glied) mit konstanter St�rfunktion.
% 
% Berechnen Sie den zum Einbringen des Tidalvolumens notwendigen Atemwegsdruck 
% P_aw.
%%
%<ToDo />
%% 
% Berechnen Sie die zu erwartende Simulationszeit t_end sowie die Dauer 
% eines Intervalls dt, wenn die unterschiedlichen physiologischen Gr��en Volumenfluss 
% q(t_n) und diverse Dr�cke p(t_n) f�r N zeitlich �quidistante St�tzstellen t_n=n*dt 
% berechnet werden sollen.
%%
%<ToDo />
%% 
% Initialisieren Sie das Anfangsvolumen der Lunge. Implementieren Sie die 
% Berechnungsschritte zur Ermittlung s�mtlicher Dr�cke und des aktuellen Volumenstroms 
% innerhalb eines Zeitintervalls. Berechnen Sie das neue Lungenvolumen am Ende 
% des aktuellen Zeitintervalls und verwenden Sie das aktualisierte Volumen in 
% einer Interation um denselben Vorgang f�r alle Zeitintervalle zu wiederholen. 
% Speichern Sie die Werte der Dr�cke und des Volumenstroms in 1D-Arrays, d.h. 
% als Vektoren (vT...Zeit, vV_L...Lungenvolumen, vP_L...Lungendruck, vP_R...Atemwegsdruck, 
% vQ...Volumenstrom).
%%
%<ToDo />
%% Theoretische L�sung
% Berechnen sie die exakten Werte f�r die St�tzstellen zu den Zeitpunkten vT(n) 
% mit der bekannte L�sung der DGL (Kondensatorladekurve).
%%
%<ToDo />
%% Grafische Darstellungen
% Stellen Sie den zeitlichen Verlauf des Volumenstroms (oben) und des Lungendrucks 
% (unten) mittels zweier Diagramme dar. Stellen Sie jeweils den Verlauf der numerischen 
% N�herung und den exakten theoretischen Verlauf (strichliert) dar.
%%
%<ToDo />