% A list of integers numbers is given. Generate the list of all
% permutations having the property that absolute value of difference
% between 2 consecutive values from each permutation is <=3
% Eg: L=[2,7,5] => [[2,5,7],[7,5,2]]

%Function to insert an element randomly in a list
%(i, i, o)
insert([], E, [E]).
insert([H|T], E, [E, H|T]).
insert([H|T], E, [H|R]):- insert(T,E,R).

%Function to get the permutations of a list
%(i, o)
permutation([],[]).
permutation([H|T], R):- permutation(T,P), insert(P,H, R).

%Function to get the absolute value of an element
%(i, o)
myAbs(X,Y):-X<0 -> Y is -X ; Y=X.

%Function to check the property wanted (<=3)
%(i)
checkDiff([H1,H2]):- Z is H1-H2, myAbs(Z, ZZ), ZZ=<3,!.
checkDiff([H1,H2|T]):- Z is H1-H2, myAbs(Z,ZZ), ZZ=<3,!,checkDiff([H2|T]).

% Function to filter the permutations (keeping only the ones that
% respect the wanted property)
% (i, o)
filterPermutations([],[]).
filterPermutations([H|T],[H|R]):- checkDiff(H),!, filterPermutations(T,R).
filterPermutations([_|T],R):-filterPermutations(T,R).

main(L,R):-findall(H, permutation(L, H), P), filterPermutations(P,R).
