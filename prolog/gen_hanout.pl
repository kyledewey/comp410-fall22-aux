% exp ::= true | false | if(exp, exp, exp) | lessThan(exp, exp)

decBound(Depth, NewDepth) :-
    Depth > 0,
    NewDepth is Depth - 1.

% exp/2: Bound, Expression
exp(_, true).
exp(_, false).
exp(Depth, if(E1, E2, E3)) :-
    decBound(Depth, NewDepth),
    exp(NewDepth, E1),
    exp(NewDepth, E2),
    exp(NewDepth, E3).
exp(Depth, lessThan(E1, E2)) :-
    decBound(Depth, NewDepth),
    exp(NewDepth, E1),
    exp(NewDepth, E2).

% tree ::= leaf | internal(tree, INT, tree)

isInteger(1).
isInteger(2).

notAnInteger(foo).
notAnInteger(bar).

tree(_, leaf).
tree(Depth, internal(Tree1, Value, Tree2)) :- % head of a clause
    % body of the clause
    Depth > 0,
    NewDepth is Depth - 1,
    tree(NewDepth, Tree1),
    tree(NewDepth, Tree2),
    isInteger(Value).
