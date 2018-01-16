"Start with two arrays of strings, a and b, each in alphabetical order, possibly with duplicates. 
Return the count of the number of strings which appear in both arrays."




So here I want to write a function to find duplicates in 
two sorted arrays containing single characters, in alphabetical order. 
This problem is important because the ordering of the two arrays allows us 
to solve it without nested loops, so solutions are found more efficiently.




//define the method commonTwo which returns an integer (number of common characters) from taking in 
//two string arrays. 

public int commonTwo(String[] a, String[] b) {

  //initiate and define variable values.
  
  int indexA          = 0;          //indexing value for array A
  int indexB          = 0;          //indexing value for array B
  int ping            = 0;          //this value will increment every time a common character is found
  boolean repititions = false;      //this value tells me whether a common character was counted twice
  
  
  //a while loop that will increment through the two arrays individually
  
  while (indexA < a.length && indexB < b.length) {
    
    char valueA = a[indexA].charAt(0);      //converts single digit string to character
    char valueB = b[indexB].charAt(0);      //...
    
    
    //logical statement checking for whether or not matching characters were found previously. this was implemented
    //after the original script was counting matches for characters that were already counted.
    
    if (indexA > 0 && indexB > 0)
      repititions = (valueA == a[indexA - 1].charAt(0)) && (valueB == b[indexB - 1].charAt(0));
    
    
    //converts character to their integer representation and compares their values. if the value in array A is greater
    //than the one in array B, we need to advance forward in array B to check the next value.
    
    if ((int)valueA > (int)valueB)
      indexB++;
      
      
    //does the same thing as the previous statement, but advances forward in array A when the value at array B is greater.
      
    if ((int)valueA < (int)valueB)
      indexA++;
      
      
    //in the event the two values are equivalent, the characters match and we have a success. ping increments
    //to show this, and we advance the indices for both arrays.
      
    if ((int)valueA == (int)valueB) {
      ping++ ;
      indexB++ ;
      indexA++ ; }
      
      
    //if repititions were found by the logical statement at the beginning of the while loop, those are
    //reflected here, and ping is decreased by one.
      
    if (repititions)
      ping--;
      
  }
 
  return ping;      //return number of unique matches found
  
}

