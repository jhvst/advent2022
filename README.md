# advent 2022 (in BQN)

I decided to use this opportunity to program in BQN for the first time.

## day 1

Classic sum reduction. Learned that BQN uses the `´` instead of `/` like APL does. Also, BQN uses comma to separate items. Also, BQN is not rank polymorphic -- reductions do not automatically work on matrices, instead, for each has to be used. This seems to be the biggest difference between BQN and APL.

I skipped parsing of the input as a string and instead used grep to prepare it ready.

## day 2

I noticed that if I standardize the token unicode value as a number, and the outcomes as a vector, then the winning means making a play that has the distance of 2 in any case (with an offset of 1 being a loss, and offset of 0 being a tie). I learned that BQN is not indexed from 1 as it is in APL, but from 0 instead. I used the BQNCrate website to find a way to get an integer value from a token.

I also learned, in a hindsight, that I should not apply unnecessary structure to my arrays beforehand, as this will cause inadvertently the solution to become much more complicated than necessary. I did not really endorse that here yet, but it soon became quite clear.

## day 3

On this day I learned to use BQNs modifiers. I noticed that the question is really about transforming a string into its unicode code points, and noticing that this is a reversible operation. I wanted to find a way to use the Under operation to do it, but was not quite able to. In the b step, I used the transformation notion and recursion to handle multiple values. This probably should have been done by instead taking multiple values and joining them together, but at least this approach let me do it in a more functional orientated way, which not necessarily how I have necessarily considered programming in APL so far.

## [day 4](https://github.com/jhvst/advent2022/blob/main/day4.bqn#L1024)

I started to parse strings in BQN.

I personally found my solution somewhat satisfying, to notice that the B step is really about just switching the downstile operation to an upstile.

## [day 5](https://github.com/jhvst/advent2022/blob/main/day5.bqn)

On the fifth day I made an effort to model the answer like it's done in the example on the website. Keeping the array as flat as possible, I transposed the crate representation into a matrix which allowed me to solve the assignment in a natural way given the description -- I move take and join values depending on the moves. A somewhat challenge became that I could not find a good way to do subslicing on a string representation, which made the patch variable look daunting. Here, the problem was that if the source becomes empty, the string gets casted into an empty array when using select. I wanted to believe that using the Under operation again to do a transformation on a string would be reversible hence elegant, but because of the casting it was not.

While to solution worked in the end, I was not really happy about how it came to be.

## day 6

On day 6 the question became into making a sliding window, or a stencil as some call it, to solve the problem. I [had two iterations on the solution](https://github.com/jhvst/advent2022/commit/f4a5fc857e8731a84856301d49919da7ed0f8469), of which I liked the latter one better, although it's a bit longer.

In general, I enjoyed to recreate the stencil by myself: `¯4↑¨(4≤≠)¨⊸/↑`. Here, it the parenthesis there's the length that we want each item to be (at least, since the take operation gives us all the prefixes of the input. Then, the second take ensures that the prefixes are indeed the same length always.

This operation in general became quite useful later on.

## day 7

I identified that this tree transformation problem is something that is generally not really enjoyable to do in an array language, because it involved a lot of parsing. Nevertheless, I got the example to work fine, but the problem became that when traversing out, I would have had to keep a separate book on what directory contains which. In the example, once I find the filesizes, I can do a sort of prefix sum on the values to get the final solution, but this has the problem of summing too many values, which then get filtered by the filesize threshold. In particular, what I call deepsum should have an implementation of a traversalPath that is more correct, i.e., considering not all directory depths under a certain value, but only the depths that are also a parent of the current folder. I may revisit this problem later to see if I can solve it in a different way, or that is more elegant in nature.

## day 8

This one I saw more of a constraint problem, and would have wanted to solve in a slightly different way than I did. In particular, the edges of the board apply a constraint on each of the rows and columns. One solution would have been to keep book of each value that would be visible in a single column. Then, we can do a sort on the "tallest" trees in the forest, and when we insert them into the board, see if the value is contained within the cell's constraint values. If not, then that tree is invisible, hence, the solution is the sum of each non-visible tree in the board. What I ended up to do was to take the edge values of the matrix, and then joining each of the sides into a table, and do the visibility in two parts: first, whether the tree can be visible just considering the constraints on the right, left, top, and bottom edges, and then row and column-wise within the inner separately. The constraints are paired in the `topLeft` and `bottomRight` variables.

In the `visible` variable, we then take that basic constraints, and apply further constraint on the applied trees on that row and column. This is done by iterating on a view matrix by iteratively placing trees that are as tall or taller than the current one. The problem to solve even the example became that on the edges of the inner array, when the constraints on the "edge" side of the array became nil, it gets casted into an empty array in my code, much like what was already a problem in the previous assignments. This gets interpreted as if the tree is not visible, when in reality it is, because it may have already passed or be invalidated by the previous stage. To fix this code, I either have to handle this special case, or filter values that get passed into the next step.

Nevertheless, I was quite happy that this approach seemed to become tractable in the end. I might revisit this problem with an actual SMT solver, if I get obnoxiously bored during the holidays.
