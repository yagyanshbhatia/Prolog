decode([],1).
decode(['0'|_], 0) :- writeln("Invalid String ").
decode([H|Tail], N):- char_code(H, HH), HH is 49, [_|Rest]=Tail, !, decode(Rest,M), decode(Tail,O), N is M+O;
        char_code(H, HH), HH is 50, [I|Rest]=Tail, char_code(I, II), II < 55, !, decode(Rest,M), decode(Tail,O), N is M+O;
        char_code(H, HH), not(HH is 48), decode(Tail, N).
evaluate(S):- string_chars(S, A), decode(A, Ans), write("Number of ways to decode: "), write(Ans).