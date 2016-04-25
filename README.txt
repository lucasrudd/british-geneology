# British Geneology Program

## Usage

This program has two primitives: married(A,B) where the husband of A is B 
                                 parent(B,C)  where the father of B is C

These primitives are used to define the simple rules: child(D,E) where the child of D is E
                                                      sibling(F,G) where the sibling of F is G

The primitives are also used to define the recursive rules: ancestor(H,I) where the ancestor of H is I
           					            decendant(J,K) where the decendant of J is K

Facts are then listed which use the primitives and rules to define the relationships between members of 
the royal family.
The program then prints to a text file the ancestors, decendants, husbands/wives, and siblings of the
British royal family starting with Albert and Victoria and ending with the present day Queen Elizabeth II.