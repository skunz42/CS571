sumoddh([], _, 0).
sumoddh([H|T], 0, S) :- sumoddh(T, 1, Res), S is Res+H.
sumoddh([_|T], 1, Res) :- sumoddh(T, 0, Res).

sumodd(L, Res) :- sumoddh(L, 0, Res).

prefix([], _).
prefix([H|T1], [H|T2]) :- prefix(T1, T2).

delete_first_k(_, _, [], []).
delete_first_k(X, K, [X|T], Res) :- K > 0, K1 is K-1, delete_first_k(X, K1, T, Res).
delete_first_k(X, K, [H|T], [H|Res]) :- delete_first_k(X, K, T, Res).
