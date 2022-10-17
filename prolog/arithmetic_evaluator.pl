% exp ::= integer(INT) | plus(exp, exp) | minus(exp, exp) | negate(exp)
%
% 2 + 5
% plus(integer(2), integer(5))
%
% -3 - 7
% minus(negate(integer(3)), integer(7))
%

% evalExp: Exp, Value
evalExp(integer(Value), Value).
evalExp(plus(E1, E2), Result) :-
    evalExp(E1, E1Result),
    evalExp(E2, E2Result),
    Result is E1Result + E2Result.
evalExp(minus(E1, E2), Result) :-
    evalExp(E1, E1Result),
    evalExp(E2, E2Result),
    Result is E1Result - E2Result.
evalExp(negate(E), Result) :-
    evalExp(E, EResult),
    Result is -EResult.
