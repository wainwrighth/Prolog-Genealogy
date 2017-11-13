# Prolog-Genealogy
Family tree database and queries made in prolog

### Files:

  tree.pl - contains the database of all the facts and relations of the members of the family tree. Facts that are included are the ages of the members as well as the child relationships. Also included are the male or female distinctions for people to use in the more complicated relations.

  queries.pl - includes all the extended relations between members such as parents and uncles. Also included is the relation of nth cousins or nth cousin removed as well as the kth child of a member. In the queries the syntax is such that the first variable is the subject. For example, in brother(harrison, X), the return values are that harrison is the brother of the results X.

  script.pl - runs an example query for nth cousin k removed as well as one for kth child. These are both run on all members to show those that either are the first born or those that have 1st cousins first removed.
  
### Notes:

  The consult() methods on the script give the full path as they pertain to my computer because they wouldn't run otherwise. This path needs to be changed if run on another computer.
