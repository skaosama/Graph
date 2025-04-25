function Nei = IdVois(V,E,v)

    % La fonction IdVois permet d'identifier les sommets voisins d'un sommet v
    % donné dans un graphe dont les arêtes sont données dans E.
    % La fonction renvoie la matrice ligne Nei.
    % - Nei sera vide si le sommet considéré ne possède pas de voisin ou si le
    %   sommet n'existe pas dans le graphe.

    lE = length(E);
    lV = length(V);
    jj=0;
    Nei = [];


    isVinG = false;
    for ii=1:lV
        if V(ii) == v
            isVinG = true;
        endif
    endfor



    for ii=1:lE
        if E(ii,1) == v
            jj=jj+1;
            Nei(jj) = E(ii,2);
        endif
    endfor


    if length(Nei)==0 && isVinG==false
        disp('v n''est pas dans le graphe')
    elseif length(Nei)==0 && isVinG==true
        disp('v n''a pas de voisin')
    endif
end
