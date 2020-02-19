%For a list a1...an with integer and distinct numbers, define apredicate to
%determine all subsets with sum of elements divisible with n.

sumElems([], 0).
sumElems([H|T], SS):- sumElems(T, S), SS is S+H.

subsets([], []).
subsets([H|T], [H|R]):-subsets(T, R).
subsets([_|T], R):-subsets(T, R).

filterSubsets([],_, []).
filterSubsets([H|T],N, [H|R]):- sumElems(H, P), mod(P,N)=:=0,!, filterSubsets(T,N,R).
filterSubsets([H|T],N, R):- sumElems(H, P), mod(P, N)=\=0,!, filterSubsets(T,N,R).

main(L, N, R):- findall(H, subsets(L, H), Z), filterSubsets(Z, N, R).


