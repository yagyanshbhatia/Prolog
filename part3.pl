% PART A

% the final recursion call boundary. 
allPath(A, B, [A, B], L) :- not(member(B, L)), edge(A, B, _).

% recursion defined.
allPath(A, B, [A | Tail], L) :- [X | _] = Tail, edge(A, X, _), not(member(X, L)), append([X], L, Z), allPath(X, B, Tail, Z).

% Caller function to get all possible paths.
allPossible(X) :- member(A, [g1, g2, g3, g4]), allPath(A, g17, X, [A]).


% PART B

% helper function to get path Length recursively. 
pathLength([A,B], Length) :- edge(A,B,Length).
pathLength([A|Tail], Length) :- [B|_] = Tail, edge(A,B,Len), pathLength(Tail, Z), Length is Len + Z.

% optimal path will have minimum path length among all possible paths. 
greaterEqual(X,Y) :- pathLength(Y, YLen), pathLength(X, XLen), YLen>=XLen.
minPath(X) :- allPossible(X), forall(allPossible(Y), greaterEqual(X,Y)).


% PART C

% should start with g1-g4, end with g17.
valid([Head|Tail]) :- member(Head, [g1, g2, g3, g4]), validPath([Head|Tail], Z), Z = g17.

% edges should be present among subsequent gates in the network.
validPath([g17], g17).
validPath([A|Tail], X) :- [B|_] = Tail, edge(A, B, _), validPath(Tail, X).
validPath([A|Tail], X) :- [B|_] = Tail, edge(B, A, _), validPath(Tail, X).

% all edges in the network (to-and-fro).

edge(g1,g5,4). 
edge(g5,g1,4).
edge(g2,g5,6). 
edge(g5,g2,6).
edge(g3,g5,8). 
edge(g5,g3,8).
edge(g4,g5,9). 
edge(g5,g4,9).
edge(g1,g6,10). 
edge(g6,g1,10).
edge(g2,g6,9). 
edge(g6,g2,9).
edge(g3,g6,3). 
edge(g6,g3,3).
edge(g4,g6,5). 
edge(g6,g4,5).
edge(g5,g7,3). 
edge(g7,g5,3).
edge(g5,g10,4). 
edge(g10,g5,4).
edge(g5,g11,6). 
edge(g11,g5,6).
edge(g5,g12,7). 
edge(g12,g5,7).
edge(g5,g6,7). 
edge(g6,g5,7).
edge(g5,g8,9). 
edge(g8,g5,9).
edge(g6,g8,2). 
edge(g8,g6,2).
edge(g6,g12,3). 
edge(g12,g6,3).
edge(g6,g11,5). 
edge(g11,g6,5).
edge(g6,g10,9). 
edge(g10,g6,9).
edge(g6,g7,10). 
edge(g7,g6,10).
edge(g7,g10,2). 
edge(g10,g7,2).
edge(g7,g11,5). 
edge(g11,g7,5).
edge(g7,g12,7). 
edge(g12,g7,7).
edge(g7,g8,10). 
edge(g8,g7,10).
edge(g8,g9,3). 
edge(g9,g8,3).
edge(g8,g12,3). 
edge(g12,g8,3).
edge(g8,g11,4). 
edge(g11,g8,4).
edge(g8,g10,8). 
edge(g10,g8,8).
edge(g10,g15,5). 
edge(g15,g10,5).
edge(g10,g11,2). 
edge(g11,g10,2).
edge(g10,g12,5). 
edge(g12,g10,5).
edge(g11,g15,4). 
edge(g15,g11,4).
edge(g11,g13,5). 
edge(g13,g11,5).
edge(g11,g12,4). 
edge(g12,g11,4).
edge(g12,g13,7). 
edge(g13,g12,7).
edge(g12,g14,8). 
edge(g14,g12,8).
edge(g15,g13,3). 
edge(g13,g15,3).
edge(g13,g14,4). 
edge(g14,g13,4).
edge(g14,g17,5). 
edge(g17,g14,5).
edge(g14,g18,4). 
edge(g18,g14,4).
edge(g17,g18,8). 
edge(g18,g17,8).