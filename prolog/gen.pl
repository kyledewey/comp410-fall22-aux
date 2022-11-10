% op ::= `+` | `-` | `*` | `/`
% exp ::= INT | exp op exp
%
% Op ::= plus | minus | mult | div
% Exp ::= integer(INT) | binop(Exp1, Op, Exp2)

% op/1
op(plus).
op(minus).
op(mult).
op(div).

%% isInteger(1).
%% isInteger(2).

sudoku(Board) :-
    rowsOk(Board),
    columnsOk(Board),
    squaresOk(Board).
    
%% isInteger(X) :-
%%     (var(X)) ->
%%         (X = 1; X = 2);
%%         integer(X).

isInteger(X) :-
    integer(X).
isInteger(X) :-
    var(X),
    !,
    (X = 1; X = 2).
isInteger(_).

myInteger(X) :-
    integer(X).

genInt(1).
genInt(2).

% function foo(input) {
%   if (condition) {
%     doThis(input);
%   } else {
%     doThat(input);
%   }
% }
%
% foo(Input) :-
%   condition,
%   doThis(Input).
% foo(Input) :-
%   \+ condition,
%   doThat(Input).
%% isInteger(X) :-
%%     var(X),
%%     genInt(X).
%% isInteger(X) :-
%%     integer(X).
    %% \+ var(X),
    %% myInteger(X).

% expNoBound/1
% expNoBound: Exp
expNoBound(integer(Int)) :-
    isInteger(Int).
expNoBound(binop(Exp1, Op, Exp2)) :-
    expNoBound(Exp1),
    op(Op),
    expNoBound(Exp2).


% exp/2
% exp: Bound, Exp
exp(_, integer(Int)) :-
    isInteger(Int).
exp(Bound, binop(Exp1, Op, Exp2)) :-
    Bound > 0,
    NewBound is Bound - 1,
    exp(NewBound, Exp1),
    op(Op),
    exp(NewBound, Exp2).

multByThree(X, Y) :-
    Y is X * 3.

% myMaplist: Goal, InputList, OutputList
myMaplist(_, [], []).
myMaplist(Goal, [InputHead|InputTail], [OutputHead|OutputTail]) :-
    call(Goal, InputHead, OutputHead), % multByThree(InputHead, OutputHead)
    myMaplist(Goal, InputTail, OutputTail).
