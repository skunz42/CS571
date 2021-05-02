maxevenh([], R, R).
maxevenh([_|[]], R, R).
maxevenh([_,H2|T], Te, R) :- H2 > Te, maxevenh(T, H2, R).
maxevenh([_,H2|T], Te, R) :- H2 =< Te, maxevenh(T, Te, R).

maxeven([_,H2|T], R) :- maxevenh(T, H2, R).
