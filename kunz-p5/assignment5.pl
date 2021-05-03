maxevenh([], R, R).
maxevenh([_|[]], R, R).
maxevenh([_,H2|T], Te, R) :- H2 > Te, maxevenh(T, H2, R).
maxevenh([_,H2|T], Te, R) :- H2 =< Te, maxevenh(T, Te, R).

maxeven([_,H2|T], R) :- maxevenh(T, H2, R).

deleteNListh([], _, _, []).
deleteNListh([_|T], N, 1, T1) :- deleteNListh(T, N, N, T1).
deleteNListh([H|T], N, K, [H|T1]) :- K1 is K-1, deleteNListh(T, N, K1, T1).
deleteNList(N, L, Res) :- deleteNListh(L, N, N, Res).

replace_firsth([], _, _, [], _).
replace_firsth([X|T], X, Y, [Y|T1], 1) :- replace_firsth(T, X, Y, T1, 0).
replace_firsth([H|T], X, Y, [H|T1], N) :- replace_firsth(T, X, Y, T1, N).
replace_first(L, X, Y, Res) :- replace_firsth(L, X, Y, Res, 1).

greater([], _, []).
greater([H|T], X, [H|T1]) :- H > X, greater(T, X, T1).
greater([_|T], X, T1) :- greater(T, X, T1).
