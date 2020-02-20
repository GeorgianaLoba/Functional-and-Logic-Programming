% Write a program to generate arrangement of k elements from a list of
% integer numbers, with the product P given.
%eg: L=[2,5,3,4,10],k=2,P=20 => [[2,10],[10,2],[5.4],[4,5]]

%Function that computes the product of elements of a list
%(i,o)
productList([],1).
productList([H|T],P):- productList(T,PP), P is PP*H.

%Function that inserts an element in a list
%(i,i,o)
insert([], E, [E]).
insert([H|T],E, [E, H|T]).
insert([H|T],E,[H|R]):-insert(T, E, R).

%Function that generates all subsets of n elems of a list
%(i, i, o)
subsetsN([], 0, []).
subsetsN([H|T], N, [H|R]):-NN is N-1, subsetsN(T,NN, R).
subsetsN([_|T], N, R):- subsetsN(T,N,R).

%Function that generates permutations of a list
%(i, o)
permutation([],[]).
permutation([H|T],P):-permutation(T,R),insert(R,H,P).

%Function that generates arrangements of a list
%(i,i,0)
arrangements(L, K, R):- subsetsN(L,K,P), permutation(P,R).


%Function that filters a list based on a property
%(i,i,o)
filterArrangements([],_,[]).
filterArrangements([H|T], P, [H|R]):- productList(H,Z), Z=:=P,!,
    filterArrangements(T,P,R).
filterArrangements([H|T],P,R):-productList(H,Z),Z=\=P,!,
    filterArrangements(T,P,R).



main(L,K,P,R):- findall(H, arrangements(L,K,H),Z),
    filterArrangements(Z,P,R).

