% EL PROBLEMA DE LAS GARRAFAS

% Funciones auxiliares

min(X,Y,Z) :- X >= Y -> Z = Y ; Z = X.

max(X,Y,Z) :- X >= Y -> Z = X ; Z = Y.

%   estado(garrafa3L, garrafa4L)

inicial(estado(0, 0)).   % ambas jarras vacias

objetivo(estado(_, 2)).   % dos litros en la jarra de 4


/* OPERADORES:
 Explicitar las transformaciones de estados mediante un predicado
 movimiento/3:
      movimiento(Estado, EstadoSiguiente, Operador)
                         :- Especificación
*/

movimiento(estado(JTRES, JCUATRO), estado(3, JCUATRO), 'Llena 3') :- JTRES \= 3.

movimiento(estado(JTRES, JCUATRO), estado(JTRES, 4), 'Llena 4') :- JCUATRO \= 4.

movimiento(estado(JTRES, JCUATRO), estado(0, JCUATRO), 'Vacia 3') :- JTRES \= 0.

movimiento(estado(JTRES, JCUATRO), estado(JTRES, 0), 'Vacia 4') :- JCUATRO \= 0.

movimiento(estado(JTRES, JCUATRO), estado(NJTRES, NJCUATRO), 'De 3 a 4') :-
                      JTRES \= 0,
                      JCUATRO \= 4,
                      Z is JTRES - (4 - JCUATRO),
                      max(Z, 0, NJTRES),
                      W is JCUATRO + JTRES,
                      min(W, 4, NJCUATRO).

movimiento(estado(JTRES, JCUATRO), estado(NJTRES, NJCUATRO), 'De 4 a 3') :-
                      JTRES \= 3,
                      JCUATRO \= 0,
                      Z is JCUATRO - (3 - JTRES),
                      max(Z, 0, NJCUATRO),
                      W is JCUATRO + JTRES,
                      min(W, 3, NJTRES).





%Hacer la consulta:

puede(Estado, Visitados, [], [Estado], P) :- objetivo(Estado), !, nl, write('Visitados: '), write(Visitados),nl,nl, write('Profundidad de la solucion: '), write(P), nl,nl.
puede(Estado, Visitados, [Operador|Operadores], [Estado|EstadosCamino], P) :-
                      movimiento(Estado, EstadoSig, Operador),
                      \+ member(EstadoSig, Visitados),
                      Z is P + 1,
                      puede(EstadoSig, [EstadoSig|Visitados], Operadores, EstadosCamino, Z).
% CONSULTA:
consulta :- inicial(Estado),
            puede(Estado, [Estado], Operadores, Estados, 0),
            nl, write('SOLUCION ENCONTRADA sin repeticion de estados: '), nl, nl, write(Operadores), nl, nl, write('Estados camino: '), nl, nl, write(Estados).





