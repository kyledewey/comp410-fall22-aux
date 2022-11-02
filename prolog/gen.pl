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

isInteger(1).
isInteger(2).

% exp/1
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
