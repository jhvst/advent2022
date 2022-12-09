example ← "30373
25512
65332
33549
35390"

runes ← ¯1↑¨(1≤≠)¨⊸/↑ example
nums ← •BQN¨ (4↑⍋runes) (⊢/˜¬∘∊˜⟜(↕≠)) runes

mat ← ↑‿5 ⥊ nums
•Show ⟨mat, ⍉mat, ⌽mat, ⌽⍉mat⟩

Row ← {

  {⊑•Show⍒}¨¨•Show 1↓¨↑¨<˘𝕩

  
}

Row mat




example ← "30373
25512
65332
33549
35390"

runes ← ¯1↑¨(1≤≠)¨⊸/↑ example
nums ← •BQN¨ (4↑⍋runes) (⊢/˜¬∘∊˜⟜(↕≠)) runes

mat ← ↑‿5 ⥊ nums
•Show ⟨mat, ⍉mat, ⌽mat, ⌽⍉mat⟩

Row ← {

  {⊑•Show⍒}¨¨•Show 1↓¨↑¨<˘𝕩

  
}

Row mat



example ← "30373
25512
65332
33549
35390"

runes ← ¯1↑¨(1≤≠)¨⊸/↑ example
nums ← •BQN¨ (4↑⍋runes) (⊢/˜¬∘∊˜⟜(↕≠)) runes

•Show mat ← ↑‿5 ⥊ nums
•Show bigTrees ← ⌽⊔⥊mat
•Show inner ← ⍉1‿¯1↓⍉1‿¯1↓mat

#                               ⍋
#                               /\
topLeft ← ⍉1‿¯1↓⍉1‿¯1↓ (⊏˘mat) {𝕨‿𝕩}⌜ (⊏mat)
#                              \‿|_/
#                               /¯¯\

bottomRight ← ⍉1‿¯1↓⍉1‿¯1↓ (⊏˘⍉⌽mat) {𝕨‿𝕩}⌜ (⊏⌽⍉mat)

boards ← {
  v ← 𝕩⊑⥊inner
  rowIdx ← ⌊𝕩÷3
  colIdx ← 3|𝕩  
  lt ← v>¨∾colIdx⊏rowIdx⊏topLeft
  br ← v>¨∾rowIdx⊏colIdx⊏bottomRight
  board ← +`{ ↑‿5 ⥊ (1¨↕25) ⊣⌾((𝕩⊑bigTrees)⊸⊏) 0¨↕25 }¨↕v
  ⟨𝕩, lt, br, ⍉1‿¯1↓⍉1‿¯1↓⊑¬⌽board, v⟩
}¨↕×´≢inner

visible ← (⥊boards) {
  board ← 3⊑𝕩⊑(⥊boards)
  rowIdx ← ⌊𝕩÷3
  •Show "foo"
  colIdx ← 3|𝕩
  •Show rowIdx⊏board
  •Show ⊔rowIdx⊏board
  row ← •Show ∾⊏⊔(rowIdx⊏board)
  col ← •Show ∾⊏⊔(⥊colIdx⊏˘board)
  left ← +´{(colIdx>𝕩)}¨row
  right ← +´{(colIdx<𝕩)}¨row
  top ← +´{(rowIdx>𝕩)}¨col
  bottom ← +´{(rowIdx<𝕩)}¨col
  l ← 0⊑(1⊑𝕨)
  t ← 1⊑(1⊑𝕨)
  b ← 0⊑(2⊑𝕨)
  r ← 1⊑(2⊑𝕨)
  •Show (4⊑𝕨)
  •Show ⟨l, t, b, r⟩
  •Show ⟨left, top, bottom, right⟩
  ⌈´⟨l∧left, top∧t, b∧bottom, r∧right⟩
}¨↕≠⥊boards

3‿3 ⥊ visible


