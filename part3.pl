allPath(A, B, [A, B]) :- edge(A, B, _).
allPath(A, B, [A | Tail]) :- [X | _] = Tail, edge(A, X, _), allPath(X, B, Tail). 
allPossible(X) :- member(A, [g1, g2, g3, g4]), allPath(A, g17, X).


pathLength([A,B], Length) :- edge(A,B,Length).
pathLength([A|Tail], Length) :- [B|_] = Tail, edge(A,B,Len), pathLength(Tail, Z), Length is Len + Z.
greaterEqual(X,Y) :- pathLength(Y, YLen), pathLength(X, XLen), YLen>=XLen.
minPath(X) :- allPossible(X), forall(allPossible(Y), greaterEqual(X,Y)).


valid([Head|Tail]) :- member(Head, [g1, g2, g3, g4]), validPath([Head|Tail], Z), Z = g17.
validPath([g17], g17).
validPath([A|Tail], X) :- [B|_] = Tail, edge(A, B, _), validPath(Tail, X).
validPath([A|Tail], X) :- [B|_] = Tail, edge(B, A, _), validPath(Tail, X).


edge(g1,g5,4).
edge(g2,g5,6).
edge(g3,g5,8).
edge(g4,g5,9).
edge(g1,g6,10).
edge(g2,g6,9).
edge(g3,g6,3).
edge(g4,g6,5).
edge(g5,g7,3).
edge(g5,g10,4).
edge(g5,g11,6).
edge(g5,g12,7).
edge(g5,g6,7).
edge(g5,g8,9).
edge(g6,g8,2).
edge(g6,g12,3).
edge(g6,g11,5).
edge(g6,g10,9).
edge(g6,g7,10).
edge(g7,g10,2).
edge(g7,g11,5).
edge(g7,g12,7).
edge(g7,g8,10).
edge(g8,g9,3).
edge(g8,g12,3).
edge(g8,g11,4).
edge(g8,g10,8).
edge(g10,g15,5).
edge(g10,g11,2).
edge(g10,g12,5).
edge(g11,g15,4).
edge(g11,g13,5).
edge(g11,g12,4).
edge(g12,g13,7).
edge(g12,g14,8).
edge(g15,g13,3).
edge(g13,g14,4).
edge(g14,g17,5).
edge(g14,g18,4).
edge(g17,g18,8).