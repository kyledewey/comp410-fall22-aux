% fib(0) = 1
% fib(1) = 1
% fib(n) = fib(n - 1) + fib(n - 2), for n > 1
%
% fib(InputN, Result).
%
fib(0, 1).
fib(1, 1).
fib(N, Output) :-
    N > 1,
    NMinusOne is N - 1,
    NMinusTwo is N - 2,
    fib(NMinusOne, NMinusOneResult),
    fib(NMinusTwo, NMinusTwoResult),
    Output is NMinusOneResult + NMinusTwoResult.

% 0! = 1
% n! = n * (n - 1)!, for n > 0
fact(0, 1).
fact(8, 40320) :- !.
fact(N, Output) :-
    N > 0,
    NMOne is N - 1,
    fact(NMOne, OMOne),
    Output is N * OMOne.

%% myBetween(Low, High, Result) :-
%%     Low =< High,
%%     Result = Low.
myBetween(Low, High, Low) :-
    Low =< High.
myBetween(Low, High, Result) :-
    Low < High,
    Next is Low + 1,
    myBetween(Next, High, Result).

