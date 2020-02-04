% EL PROBLEMA DE LAS GARRAFAS GENÉRICO

% Funciones auxiliares

min(X,Y,Z) :- X >= Y -> Z = Y ; Z = X.

max(X,Y,Z) :- X >= Y -> Z = X ; Z = Y.

%   estado(garrafa3L, garrafa4L)

inicial(estado(0, 0)).   % ambas jarras vacias

objetivo(estado(L, _), L).   % L litros en la jarra C1
objetivo(estado(_, L), L).   % L litros en la jarra C2


/* OPERADORES:
 Explicitar las transformaciones de estados mediante un predicado
 movimiento/3:
      movimiento(Estado, EstadoSiguiente, Operador)
                         :- Especificación
*/

movimiento(estado(JC1, JC2), estado(C1, JC2), 'Llena C1', C1, _) :- JC1 \= C1.

movimiento(estado(JC1, JC2), estado(JC1, C2), 'Llena C2', _, C2) :- JC2 \= C2.

movimiento(estado(JC1, JC2), estado(0, JC2), 'Vacia C1', _, _) :- JC1 \= 0.

movimiento(estado(JC1, JC2), estado(JC1, 0), 'Vacia C2', _, _) :- JC2 \= 0.

movimiento(estado(JC1, JC2), estado(NJC1, NJC2), 'De C1 a C2', _, C2) :-
                      JC1 \= 0,
                      JC2 \= C2,
                      Z is JC1 - (C2 - JC2),
                      max(Z, 0, NJC1),
                      W is JC2 + JC1,
                      min(W, C2, NJC2).

movimiento(estado(JC1, JC2), estado(NJC1, NJC2), 'De C2 a C1', C1, _) :-
                      JC1 \= C1,
                      JC2 \= 0,
                      Z is JC2 - (C1 - JC1),
                      max(Z, 0, NJC2),
                      W is JC2 + JC1,
                      min(W, C1, NJC1).





%Hacer la consulta:

puede(Estado, Visitados, [], [Estado], _, _, L, P) :- objetivo(Estado, L), !, nl, write('Visitados: '), write(Visitados),nl,nl, write('Profundidad de la solucion: '), write(P), nl,nl.
puede(Estado, Visitados, [Operador|Operadores], [Estado|EstadosCamino], C1, C2, L, P) :-
                      movimiento(Estado, EstadoSig, Operador, C1, C2),
                      \+ member(EstadoSig, Visitados),
                      Z is P + 1,
                      puede(EstadoSig, [EstadoSig|Visitados], Operadores, EstadosCamino, C1, C2, L, Z).
% CONSULTA:
consulta(C1, C2, L) :- inicial(Estado),
            puede(Estado, [Estado], Operadores, Estados, C1, C2, L, 0),
            nl, write('SOLUCION ENCONTRADA sin repeticion de estados: '), nl, nl, write(Operadores), nl, nl, write('Estados camino: '), nl, nl, write(Estados).





