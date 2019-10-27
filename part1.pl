% single way to decode an empty string. 
decode([],1).

% string starting with '0' are invalid. 
decode(['0'|_], 0) :- writeln("Invalid String").

% recursion for decoding. 
decode([H|Tail], N):- char_code(H, HH), HH is 49, [_|Rest]=Tail, !, decode(Rest,M), decode(Tail,O), N is M+O;
        char_code(H, HH), HH is 50, [I|Rest]=Tail, char_code(I, II), II < 55, !, decode(Rest,M), decode(Tail,O), N is M+O;
        char_code(H, HH), not(HH is 48), decode(Tail, N).

% only numeric charachters are allowed.
valid(X) :- char_code(X, HH), HH >= 48, HH =< 57.

% convert string to char list, check numeric validity for all chars, decode, print number of ways to decode. 
evaluate(S):- string_chars(S, A), forall(member(X, A), valid(X)), decode(A, Ans), write("Number of ways to decode: "), write(Ans).