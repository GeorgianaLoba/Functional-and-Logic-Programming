% Write a program to generate the list of all subsets of sum S with the
% elements of a list (S -given).Eg: [1,2,3,4,5,6,10] si S=10 =>
% [[1,2,3,4], [1,4,5], [2,3,5], [4,6],[10]] (not necessary in this order)


%Function that computes the sum of elems of a list
%(i, o)
sumList([], 0).
sumList([H|T],SS):-sumList(T, S), SS is S+H.

%Function that generates subsets
%(i,o)
subsets([], []).
subsets([H|T], [H|R]):- subsets(T, R).
subsets([_|T], R):- subsets(T, R).

%Function that receives a list of lists and keeps the list of sum S
%(i, i, o)
filterSubsets([], _, []).
filterSubsets([H|T], S, [H|R]):- sumList(H, P), P=:=S, !, filterSubsets(T, S, R).
filterSubsets([H|T], S, R):- sumList(H, P), P=\=S, !, filterSubsets(T,S,R).

%Function that generates the list of all subsets of sum S
%(i, i, o)
main(L, S, R):- findall(H, subsets(L,H), G), filterSubsets(G, S, R).
