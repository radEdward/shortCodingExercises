"(This is a slightly harder version of the fix34 problem.) Return an array that contains exactly the same numbers as the given array, but
rearranged so that every 4 is immediately followed by a 5. Do not move the 4's, but every other number may move. The array contains the
same number of 4's and 5's, and every 4 has a number after it that is not a 4. In this version, 5's may appear anywhere in the original
array."



public int[] fix45(int[] nums) {
  
    int[] pingArray = new int[nums.length];
		int j = 0;
		int k = 0;

		for (int i = 0; i < nums.length; i++) {
			
			if (i > 0 && nums[i] == 5 && nums[i-1] == 4) { continue; }
			
			if (nums[i] == 5) { pingArray[j] = i;
			                    j++;              }
			
		}



		for (int i = 0; i < nums.length - 1; i++) {
			
			if (nums[i] == 4 && nums[i+1] == 5) { continue; }
			
			if (nums[i] == 4) { nums[pingArray[k]] = nums[i+1];
			                    nums[i+1] = 5;
			                    k++;                            }
			
		}
  
  
  
  return nums;

}




public static int[] fix45 (int[] nums) {
		
		for (int i = 0; i < nums.length - 1; i++) {
			
			if (nums[i] == 4 && nums[i+1] != 5) {
				
				for (int j = 0; j < nums.length; j++) {
					
					if ( j == 0 && nums[j] == 5 ) { nums[j] = nums[i+1];
													nums[i+1] = 5;
					                                continue;            }
					
					if ( nums[j] == 5 && nums[j-1] != 4 ) { nums[j] = nums[i+1];
															nums[i+1] = 5;       }
					
				}
				
			}
			
		}


	
    return nums;

}
