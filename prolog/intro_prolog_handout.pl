% 1.)
warm(pizza).
warm(burger).
warm(burrito).

% 3.)
likes(alice, pizza).
likes(alice, burger).
likes(alice, yogurt).
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


likesWarmFood(Food) :-
    likes(bill, Food),
    warm(Food).
