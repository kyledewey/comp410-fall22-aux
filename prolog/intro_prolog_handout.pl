% 1.)
warm(pizza).
warm(burger).
warm(burrito).

% 3.)
likes(alice, yogurt).
likes(alice, pizza).
likes(alice, burger).
likes(alice, burrito).
likes(bob, pizza).
likes(bob, burger).
likes(bob, salad).
likes(bob, milk).
likes(bill, Food) :-
    warm(Food).
likes(janet, Food) :-
    likes(alice, Food),
    likes(bob, Food).
likes(mel, yogurt).
likes(mel, Food) :-
    likes(janet, Food).

% Almost infinite recursion
%% likes(mel, Food) :-
%%     likes(janet, Food),
%%     likes(mel, yogurt).
%% likes(mel, yogurt).

%% likes(mel, Food) :-
%%     Food = yogurt;
%%     likes(janet, Food).


likesWarmFood(Person, Food) :-
    likes(Person, Food),
    warm(Food).

between5and7Inclusive(Value) :-
    5 =< Value,
    Value =< 7.

%% :-(between5and7Inclusive(Value),
%%    ','(=<(5, Value),
%%        =<(Value, 7))).

experiment(1).
%% experiment(2).
%% experiment(2).
%% experiment(2).
%% experiment(2).
experiment(X) :- X is 1 + 1.
experiment(1).
experiment(X) :- X is 1 + 1 - 1.

%% areEqual(X, X).

%% areEqual(X, Y) :-
%%     X = Y.

:-(areEqual(X, Y),
   =(X, Y)).
