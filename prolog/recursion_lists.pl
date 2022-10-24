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
% sumAllTailRecursive: List, Accum, Result
% sumAllTailRecursive/3
sumAllTailRecursive([], Accum, Accum).
sumAllTailRecursive([Head|Tail], Accum, Result) :-
    NewAccum is Accum + Head,
    sumAllTailRecursive(Tail, NewAccum, Result).

% sumAllTailRecursive/2
sumAllTailRecursive(List, Result) :-
    sumAllTailRecursive(List, 0, Result).

%% sumAllTailRecursive([], 0).
%% sumAllTailRecursive([Head|Tail], Result) :-
%%     sumAllTailRecursiveHelper(Tail, Head, Result).

% addAmount: List, AmountToAdd, OutputList
addAmount([], _, []).
addAmount([Head|Tail], Amount, [HeadPlusAmount|Rest]) :-
    HeadPlusAmount is Head + Amount,
    addAmount(Tail, Amount, Rest).

% myReverse/3: InputList, Accum, OutputList
%% myReverse([], Accum, OutputList) :-
%%     Accum = OutputList.
myReverse([], Accum, Accum).
myReverse([Head|Tail], Accum, OutputList) :-
    NewAccum = [Head|Accum],
    myReverse(Tail, NewAccum, OutputList).

% myReverse/2: InputList, OutputList
myReverse(InputList, OutputList) :-
    myReverse(InputList, [], OutputList).

sublist([], []).
% case 1: put in output
sublist([Head|Tail], [Head|Tail2]) :-
    sublist(Tail, Tail2).
% case 2: don't put in output
sublist([_|Tail], List) :-
    sublist(Tail, List).
