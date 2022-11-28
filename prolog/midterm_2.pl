% myBetween: Min, Max, Number
myBetween(Min, Max, Min) :-
    Min =< Max.
myBetween(Min, Max, Value) :-
    Min < Max,
    NewMin is Min + 1,
    myBetween(NewMin, Max, Value).

% evensBetween: Min, Max, Value
evensBetween(Min, Max, Value) :-
    Min =< Max,
    0 is mod(Min, 2),
    Min = Value.
evensBetween(Min, Max, Value) :-
    Min < Max,
    NewMin is Min + 1,
    evensBetween(NewMin, Max, Value).

% isPrime: Value, Divisor
isPrime(1, _).
isPrime(_, 1).
isPrime(Value, Divisor) :-
    Divisor > 1,
    ModResult is mod(Value, Divisor),
    ModResult \= 0,
    NewDivisor is Divisor - 1,
    isPrime(Value, NewDivisor).

% isPrime: Value
isPrime(Value) :-
    Value \== 1,
    Divisor is Value - 1,
    isPrime(Value, Divisor).

myOnce(Call) :-
    call(Call),
    !.

% allEqual: List
%% allEqual([]).
%% allEqual([_]).
%% allEqual([A, A|Rest]) :-
%%     allEqual([A|Rest]).

% allEqual: List, Element
allEqual([], _).
allEqual([Head|Tail], Head) :-
    allEqual(Tail, Head).

allEqual([]).
allEqual([Head|Tail]) :-
    allEqual(Tail, Head).

% zip: InputList1, InputList2, OutputList
% pair(foo, bar)
zip([], [], []).
zip([FirstHead|FirstTail],
    [SecondHead|SecondTail],
    [pair(FirstHead, SecondHead)|Rest]) :-
    zip(FirstTail, SecondTail, Rest).

append(nil, List, List).
append(cons(Head, Tail), List, cons(Head, Rest)) :-
    append(Tail, List, Rest).

% exp ::= literal(1) | literal(0) | plus(exp, exp) | negate(exp)
gen(literal(0)).
gen(literal(1)).
gen(plus(E1, E2)) :-
    gen(E1),
    gen(E2).
gen(negate(E)) :-
    gen(E).

