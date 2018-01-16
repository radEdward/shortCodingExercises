"Start with two arrays of strings, a and b, each in alphabetical order, possibly with duplicates. 
Return the count of the number of strings which appear in both arrays."




So here I want to write a function to find duplicates in 
two sorted arrays containing single characters, in alphabetical order. 
This problem is important because the ordering of the two arrays allows us 
to solve it without nested loops, so solutions are found more efficiently.





public int commonTwo(String[] a, String[] b) {
  
  int indexA = 0;
  int indexB = 0;
  int ping = 0;
  boolean repititions = false;
  
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

