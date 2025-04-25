clear all                                           % Nettoyage des variables
close all                                           % Fermer les fenêtres
clc                                                 % Effacer la console

f = 'G=(V,E).xlsx';                                 % Nom du fichier contenant le graphe
V0 = 1;                                             % Sommet initial pour le parcours en largeur
[V, E] = readGraph(f);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Initialisation de l'algorithme %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% On cherche tous les voisins du sommet initial

distance = 0;
dist = [V0, distance];
idxV = V0;
VFlag = 0 % VFlag permet de savoir si le sommet considéré a déjà été traité ou non.
distance=1;



jj=0;


for ii=1:size(E,1)
    if E(ii,1)==V0
        jj=jj+1;
        IncidCurrent(jj,:) = E(ii,:);
        for kk=1:size(dist,1)
            if !(dist(kk)==IncidCurrent(jj,2))
                VFlag = 1;
            else
                VFlag = 0;
            endif
        endfor
        dist(size(dist,1)+1,1)=IncidCurrent(jj,2);
        dist(size(dist,1),2)=distance;
    endif

end



