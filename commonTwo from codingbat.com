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

  int indexA          = 0;      //indexing value for array A
  int indexB          = 0;      //indexing value for array B
  int ping            = 0;      //this value will increment every time a common character is found
  boolean repititions = false;  //this value tells me whether a common character was counted twice
  
  while (indexA < a.length && indexB < b.length) {
    
    char valueA = a[indexA].charAt(0);
    char valueB = b[indexB].charAt(0);
    
    if (indexA > 0 && indexB > 0)
      repititions = (valueA == a[indexA - 1].charAt(0)) && (valueB == b[indexB - 1].charAt(0));
    
    if ((int)valueA > (int)valueB)
      indexB++;
      
    if ((int)valueA < (int)valueB)
      indexA++;
      
    if ((int)valueA == (int)valueB) {
      ping++ ;
      indexB++ ;
      indexA++ ; }
      
    if (repititions)
      ping--;
      
  }
 
  return ping;
  
}

