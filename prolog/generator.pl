genInt(0).
genInt(N) :-
    genInt(NMinusOne),
    N is NMinusOne + 1.

foo(alpha).
foo(beta).

bar(gamma).
bar(delta).

myNumber(0).
myNumber(1).
myNumber(2).

makePair(pair(A, B)) :-
    myNumber(A),
    myNumber(B).
