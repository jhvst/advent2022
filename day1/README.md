# day1

I cheesed this.

1. $ cat input.txt | tr '\n' ' ' | sed 's/  /⟩,⟨/g' | sed 's/ /,/g' | tee > format.txt
2. Modify format.txt to fit into BQN array format, namingly
3. Run day1a.bqn
4. cat result.txt | sed 's/ /\n/g' | ^sort

Then I took the results from the last command. :)

# day1-revised

See `day1-revised.bqn`.
