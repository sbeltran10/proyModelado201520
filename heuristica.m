function flujo = heuristica(nodos, arcos)
[V, B] = textread(nodos,'%d %d');
[F,D, C, U] = textread(arcos, '%d %d %d %d');
first = [];
for i = 1 : length(V)
    first = [first -1];
end
arcos = zeros(4,length(F)*2);
numArcs =  0;
for i = 1 : length(F)
    arcos(1, numArcs + 1) = D(i);
    arcos(2, numArcs + 1) = C(i);
    arcos(3, numArcs + 1) = U(i);
    arcos(4, numArcs + 1) = first(F(i));
    first(F(i)) = numArcs + 1;
    numArcs = numArcs + 1;
    arcos(1,numArcs + 1) = F(i);
    arcos(2,numArcs + 1) = 0;
    arcos(3,numArcs + 1) = 0;
    arcos(4,numArcs + 1) = first(D(i));
    first(D(i)) = numArcs+1;
    numArcs = numArcs+1;
end
first = [0 first];