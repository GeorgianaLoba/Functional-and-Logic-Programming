%Write a predicate to generate the list of all subsets with all elements of a
%given list. Eg: [2, 3, 4] N=2 => [[2,3],[2,4],[3,4]]

%Function that computes all subsets
%(i, o)
subsets([],[]).
subsets([H|T],[H|R]):-subsets(T, R).
subsets([_|T], R):-subsets(T,R).

%Function that computes subsets on n elems
%(i, i, o)
subsetsN([], 0, []).
subsetsN([H|T], N, [H|R]):- NN is N-1, subsetsN(T, NN, R).
subsetsN([_|T], N, R):-subsetsN(T, N, R).


