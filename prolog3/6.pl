%Generate the list of all arrangements of K elements of a given list.
% Eg: [2,3,4] K=2 => [[2,3], [3,2], [2,4], [4,2], [3,4], [4,3]] (not
% necessary in this order)

% version 1
% I know very well the function that generates subsets, so i can try to
% reverse them => arrangements

%Function that computes all subsets of n elems
%(i, i, o)
subsetsN([], 0, []).
subsetsN([H|T], N, [H|R]):- NN is N-1, subsetsN(T, NN, R).
subsetsN([_|T], N, R):- subsetsN(T, N, R).

%Function that reverses a list using a collector variable
%(i, i, o)
reverseList([], Acc, Acc).
reverseList([H|T], Acc, R):- reverseList(T, [H|Acc], R).

%Function that concatenates 2 lists
%(i, i, o)
concatenate([],L, L).
concatenate([H|T],L,[H|R]):-concatenate(T, L, R).

main(L, N, R):- findall(Here, subsetsN(L, N, Here), Z1), reverseList(L, [], Z),
    findall(HereAgain, subsetsN(Z,N,HereAgain), Z2), concatenate(Z1, Z2, R).


%version 2
%permutarile subseturilor/combinarilor


% Function that inserts an element randomly in a list -> first it
% will be inserted on the first position, then on the second and so
% on and so forth
%(i, i, o)
insert([], E,[E]).
insert([H|T], E, [E, H|T]).
insert([H|T], E, [H|R]):-insert(T,E,R).


%(i, o)
permutation([], []).
permutation([H|T], P):-permutation(T, R), insert(R, H, P).

%(i, i, o)
arranjament(L, N,R):-subsetsN(L,N, Z),permutation(Z,R).


