female(pam).
female(liz).
female(pat).
female(ann).
male(jim).
male(bob).
male(tom).
male(peter).
male(at).
parent(pam,bob).
parent(tom,bob).
parent(tom,liz).
parent(bob,ann).
parent(bob,pat).
parent(pat,jim).
parent(bob,peter).
parent(peter,jim).
mother(X,Y):- parent(X,Y),female(X).
father(X,Y):- parent(X,Y),male(X).
haschild(X):- parent(X,_).
sister(X,Y):- parent(Z,X),parent(Z,Y),female(X),X\==Y.
brother(X,Y):-parent(Z,X),parent(Z,Y),male(X),X\==Y.

obs(tree).
obs(human).
obs(car).
obs(roadblock).
brakes(X):- obs(X).
acc(X):-!,obs(X).

father(a,b).
father(a,c).
father(b,d).
father(b,e).
father(c,f).
brother(X,Y) :- father(Z,X), father(Z,Y), not(X=Y).
cousin(X,Y) :- father(Z,X), father(W,Y), brother(Z,W).
grandson(X,Y) :- father(Z,X), father(Y,Z).
descendent(X,Y) :- father(Y,X).
descendent(X,Y) :- father(Z,X), descendent(Z,Y).

%Define a predicate quicksort(L,K) which, given a list of integers L,
% returns an ordered list K obtained from L with the method of
% quicksort.Solution
quicksort([],[]).
quicksort([X|L],K) :- split(X,L,L1,L2),
quicksort(L1,K1),
quicksort(L2,K2),
append(K1,[X|K2],K).

split(_,[],[],[]).
split(X,[Y|L],K,[Y|M]) :- X < Y, split(X,L,K,M).
split(X,[Y|L],[Y|K],M) :- X >= Y, split(X,L,K,M).