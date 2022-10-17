% myAppend: InputList1, InputList2, OutputList
myAppend([], List, List).
myAppend([Head|Tail], List, [Head|Rest]) :-
    myAppend(Tail, List, Rest). % tail recursive

% take: List, NumElements, OutputList
take([], _, []).
take(_, 0, []).
take([Head|Tail], NumElements, [Head|Rest]) :-
    NumElements > 0,
    MinOne is NumElements - 1,
    take(Tail, MinOne, Rest). % tail recursive

sumAll([], 0).
sumAll([Head|Tail], Output) :-
    sumAll(Tail, TailResult),
    Output is Head + TailResult. % NOT tail recursive

% accumulator - where the result is stored
% sumAllTailRecursiveHelper: List, Accum, Result
sumAllTailRecursiveHelper([], Accum, Output) :-
    Output = Accum.
sumAllTailRecursiveHelper([Head|Tail], Accum, Result) :-
    NewAccum is Accum + Head,
    sumAllTailRecursiveHelper(Tail, NewAccum, Result).

sumAllTailRecursive(List, Result) :-
    sumAllTailRecursiveHelper(List, 0, Result).
%% sumAllTailRecursive([], 0).
%% sumAllTailRecursive([Head|Tail], Result) :-
%%     sumAllTailRecursiveHelper(Tail, Head, Result).
