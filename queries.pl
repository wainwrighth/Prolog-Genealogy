/* Defines the parent relationship which is opposite of child */
parent(Y, X) :- child(X, Y).

/* father relationship defines a male parent */
father(Y, X) :- male(Y), parent(Y, X).

/* brother relationship defines a male member that shares the same parent as the subject */
brother(Y, X) :- male(Y), father(Z, Y), father(Z, X), Y \= X.

/* grandfather relationship is a male member who is the parent of the parent of the subject */
grandfather(Y, X) :- male(Y), parent(Y, Z), parent(Z, X).

/* uncle is defined as a male member whose brother is the parent of the subject */
uncle(Y, X) :- male(Y), brother(Y, Z), parent(Z, X).

/* mother relationship defines a female parent */
mother(Y, X) :- female(Y), parent(Y, X).

/* sister relationship defines a female member that shares the same parent as the subject */
sister(Y, X) :- female(Y), father(Z, Y), father(Z, X), Y \= X.

/* grandmother relationship is a female member who is the parent of the parent of the subject */
grandmother(Y, X) :- female(Y), parent(Y, Z), parent(Z, X).

/* aunt is defined as a female member whose sister is the parent of the subject */
aunt(Y, X) :- female(Y), sister(Y, Z), parent(Z, X).

/* cousin is a member whose uncle or aunt is the parent of the subject */
cousin(Y, X) :- uncle(Z, Y), parent(Z, X).
cousin(Y, X) :- aunt(Z, Y), parent(Z, X).

/* nth cousin has a base case that is regular cousin*/
/* the rest of this method reduces the nth value by */
/* one and gets the parents of the subjects and compares */
/* them to see if the parents are siblings */
nthcousin(1, Y, X) :- cousin(Y, X).
nthcousin(N, Y, X) :- parent(Z, Y), parent(W, X), A is N - 1, nthcousin(A, Z, W).

/* base case is the nth cousin no removed or 0 for k */
/* the method gets the parent of the unkown and uses */
/* it to call nth cousin to see if there is any relation */
nthcousinkremoved(N, 0, Y, X) :- nthcousin(N, Y, X).
nthcousinkremoved(N, K, Y, X) :- parent(Z, X), A is K - 1, nthcousinkremoved(N, A, Y, Z).

/* gets an ordered list of all children's ages of given member */
/* then reverses this list for properly finding the desired child */
/* upon getting reversed list it queries the age that matches the index */
/* and returns the name of the member with that age */
kthchild(K, Y, X) :- setof(X, getchildage(Y, X), L), reverse(L, R), N is K - 1, nth0(N, R, A), age(X, A).

/* returns the age of a child that is being queried */
getchildage(Y,X) :- child(A,Y), age(A, X).