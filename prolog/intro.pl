% fact
% datatypes: integers
% arity: number of parameters a fact is given
% isInteger, with arity 1; isInteger/1 procedure
isInteger(1).
isInteger(2).
isInteger(3).

% alice is an atom - starts with lowercase letter, no
% parens afterwards.  Atoms are basically strings.
% isName/1 procedure
isName(alice).
isName(bob).

% someExample/2 procedure
someExample(foo, bar).
someExample(alice, bob).

someOtherExample(1).

areEqual(X, X).

albertLikes(cheese).

likes(albert, cheese).
likes(ashley, pizza).

