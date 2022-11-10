prologInterpret(,(A, B)) :-
    !,
    prologInterpret(A),
    prologInterpret(B).
prologInterpret(;(A, B)) :-
    !,
    (prologInterpret(A) ; prologInterpret(B)).
                
eval(integer(X), X) :- !.
eval(plus(E1, E2), Result) :-
    !,
    eval(E1, E1Result),
    eval(E2, E2Result),
    Result is E1Result + E2Result.
eval(SomeOtherCase, Result) :-
    
