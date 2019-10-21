decode([],1).
decode(['0'|Tail], 0).
decode([H|Tail], N):- char_code(H, HH), HH is 49, [_|Rest]=Tail, !, decode(Rest,M), decode(Tail,O), N is M+O;
        char_code(H, HH), HH is 50, [I|Rest]=Tail, char_code(I, II), II < 55, !, decode(Rest,M), decode(Tail,O), N is M+O;
        decode(Tail, N).
evaluate(S):- string_chars(S, A), decode(A, Ans), write(Ans).