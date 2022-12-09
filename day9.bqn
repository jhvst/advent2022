example ← "R 4
U 4
L 3
D 1
R 4
D 1
L 5
R 2"

R ← {1‿0}¨↕
L ← -⊢{1‿0}¨↕
U ← {0‿1}¨↕
D ← -⊢{0‿1}¨↕

H ← +`∾

moves ← ⟨R 4, U 4, L 3, D 1, R 4, D 1, L 5, R 2⟩
head ← H moves

changeDirection ← 1=+´¨0⍷¨⊑¨¨ ¯2↑¨(2≤≠)¨⊸/↑ +´ ¨moves
redundant ← +´(¬changeDirection)/⊢⟜(-´)¨|⊑¨¨ ¯2↑¨(2≤≠)¨⊸/↑ +´ ¨moves

(≠head) - +´(+´changeDirection)‿redundant‿2
