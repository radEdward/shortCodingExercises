This is actually two variations of a similar problem...





"We want to make a row of bricks that is goal inches long. We have a 
number of small bricks (1 inch each) and big bricks (5 inches each). 
Return true if it is possible to make the goal by choosing from the given bricks."


//We want to make a function that confirms whether or not we can make a brick 
//so many units in length, given varying values of two other lengths (1 unit and 5 units, respectively).
//This problem can be done easily with a loop, but can also be done with the use of brief logical
//statements. Consider the two statements that would cause us to be unable to make the
//desired length: not having enough bricks in the first place, and having enough total
//length but not enough single unit bricks to make up a length not divisible by 5.

public boolean makeBricks(int small, int big, int goal) {
  
  
//logical statement ensuring total length can be met
    
  if (goal > small + 5*big)
    return false;
    
    
//logical statement ensuring enough single unit bricks exist to cover amounts smaller than 5
    
  if (goal % 5 > small)
    return false;
    
    
//if both requirements are met, then the goal length can be made
    
  return true;
  
}






And here we have the variation of the original problem


"We want make a package of goal kilos of chocolate. We have small bars (1 kilo each) 
and big bars (5 kilos each). Return the number of small bars to use, assuming we always use 
big bars before small bars. Return -1 if it can't be done."


//We want to construct a similar function as the one made above, the difference here being we have
//slightly different requirements and are returning an integer rather than a boolean.
//The same logical statements above still apply (return false if not enough bricks or not enough single
//units to cover the remainder), so we'll just add statements to return the correct number of single unit
//bricks needed.

public int makeChocolate(int small, int big, int goal) {
  
  
//establish the maximum number of 5 unit pieces we can use towards our goal
  
  int numOfFives = goal / 5;


//if our total given units don't add up to the goal, we can't make it

  if (small < goal % 5)
    return -1;
    
    
//if we don't have enough single units to make up the remainder after using 5 unit pieces, we can't make it
    
  if (small + big*5 < goal)
    return -1;
    
    
//if we are given just enough, or more 5 unit pieces than needed, we only need the remainder in single unit pieces
    
  if (numOfFives <= big && small >= goal % 5)
    return goal % 5;
    
    
//the only other situation is we have less fives than the maximum number we could use towards it, and in that case we
//make up the rest in single unit pieces (we're not worried about not having enough single unit pieces to make it
//since that's checked in the beginning).
    
  return (numOfFives - big)*5 + goal % 5;
  
}



