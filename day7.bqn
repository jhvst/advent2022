input ← "$ cd /
$ ls
dir a
14848514 b.txt
8504156 c.dat
dir d
$ cd a
$ ls
dir e
29116 f
2557 g
62596 h.lst
$ cd e
$ ls
584 i
$ cd ..
$ cd ..
$ cd d
$ ls
4060174 j
8033020 d.log
5626152 d.ext
7214296 k"

Extract ← {(>⟜«0≤𝕩)/0(0⊸≤××⟜10⊸+)`𝕩}∘-⟜'0'
Split ← ((⊢-˜+`×¬)∘=⊔⊢)

•Show lines ← (@+10) Split input
IsFile ← {((@+58)>𝕩) ∧ ((@+48)<𝕩)}(((0⊑⊢)(0⊑⊢))¨(' ') Split ¨⊢)
IsCommand ← {𝕩≡"$ ls"}¨⊢
IsCd ← ("cd"≡(1⊑⊢))¨(' ') Split¨⊢
CdOut ← ∾('.'=1↑⌽)¨
CdIn ← IsCd-CdOut
IsHugeFile ← {•BQN∘⊑ ¨ (' ') Split ¨ IsFile⊸/ 𝕩}
HugeFile ← {(IsHugeFile 𝕩)⊸∧⌾((IsFile 𝕩)⊸/) (IsFile 𝕩)}
Dirs ← {("."≢⊢)∘(⋈⊑∘⌽)¨𝕩}⊸/IsCd⊸/
Stencil ← {¯2↑¨(2≤≠)¨⊸/↑𝕩}

•Show IsFile lines
•Show HugeFile lines
•Show depth ← +`{(CdIn 𝕩) - (CdOut 𝕩)} lines
•Show +`IsCd lines
•Show +`CdIn lines
•Show +`CdOut lines
•Show ∾dir ← 5↓¨{(𝕩-1)⊑(Dirs lines) }¨(+`CdIn lines)
•Show Dirs lines

•Show shallowSum ← ⌽+´¨(dir) ⊐⊸⊔ (HugeFile lines)
•Show traversalPath ← ⌽(⌈´)¨⍷¨(dir) ⊐⊸⊔ (depth)

DeepSum ← {
  my ← 𝕩⊑shallowSum
  tail ← 𝕩↓(1 ⍷ ((𝕩⊑traversalPath)>traversalPath))
  trgIdx ← ⊑⊐⟜1 (0¨↕𝕩) ∾ tail
  my×((0¨↕𝕩) ∾ tail)
}

•Show deepSums ← shallowSum +´DeepSum ¨↕≠shallowSum
•Show +´(100000>¨deepSums)⊸/(deepSums)