# Q-Learning

+ Successfully implemented Q-Learning for a simple robot navigation problem of a robot moving on a 5 x 5 grid with 
  one arbitrary goal (reward of +10) and three arbitrary obstacles (reward of -10)
+ Algorithm used is:
  1. Initialize q-table with all zeroes
  2. Loop
    *Pick a random start state, action(s,a) transition
    *make transistion from(s,a) -> s’
    *receive reward
    *Update Q(s,a) <- R(s,a) + gamma*(max(Q(s’,for all actions possible from next state)))
+ Run from main.m
 
