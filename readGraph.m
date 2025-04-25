function [V, E] = readGraph(filename)

## Fonction readGraph - permet de lire un graphe dont les sommets sont encodés dans
## la première colonne et les arêtes dans les colonnes 2 et 3.
## Attention 1 : Pas de ligne vide entre deux sommets ou entre deux arêtes.
## Attention 2 : La première ligne doit être non-vide.

    pkg load io                                         % Charger le package IO
    DATA = xlsread(filename,1);
    idxV = 0;
    idxE = 0;

    for ii=1:size(DATA,1)
        if (isnan(DATA(ii,1)) && idxV==0)
            idxV=ii-1;
        endif

        if (isnan(DATA(ii,2)) && idxE==0)
            idxE=ii-1;
        endif
    end

    if idxV==0
        disp('Je suis dans le if idxV==0')
        idxV = size(DATA,1);
    end

    if idxE==0
        idxE = size(DATA,1);
    end

    V = DATA(1:idxV,1);
    E(:,1) = DATA(1:idxE,2);
    E(:,2) = DATA(1:idxE,3);

    cardV = size(V,1);                                   % Nombre de sommets

    cardE = size(E,1);                                   % Nombre d'arêtes

    for ii=1:cardE
        E(cardE+ii,:) = zeros(1,2);
        E(cardE+ii,1) = E(ii,2);
        E(cardE+ii,2) = E(ii,1);

    end

end
