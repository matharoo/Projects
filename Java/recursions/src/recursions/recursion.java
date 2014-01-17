package recursions;

public class recursion {

	public static void main(String[] args) {
		recursion r1= new recursion();
		//System.out.println("fibonacci first n numbers sum: "+r1.fibonacci(5));
		System.out.println(r1.testcount("matharoo"));
	}
	
	public String testcount(String str){
		System.out.println(str);
		if(str.length()<1) return str;
		if(str.substring(0,1)!="x") return testcount(str.substring(1));
		return str;
	}
	
	public int bunnyEars(int bunnies) {
		  if(bunnies!=0) return 2+bunnyEars(bunnies-1);
		  return bunnies;
		}
	
	public int fibonacci(int n) {
		  if(n==0) return 0;
		  if(n==1) return 1;
		  return fibonacci(n-1)+fibonacci(n-2);
		}
	
	public int bunnyEars2(int bunnies) {
		  if(bunnies==0) return 0;
		  if(bunnies%2==0) return 3+bunnyEars2(bunnies-1);
		  if(bunnies%2!=0) return 2+bunnyEars2(bunnies-1); 
		  return bunnies;
		}
	
	public int triangle(int rows) {
		  if(rows==0) return 0;
		  return rows+triangle(rows-1);
		}

	public int sumDigits(int n) {
		  if(n<10)return n;
		  return n%10+sumDigits(n/10);
		}
	
	public int count7(int n) {
		  if(n==0) return 0;
		  if(n%10==7){
		   return 1+count7(n/10);  
		  }
		  return count7(n/10);
		}

	public int count8(int n) {
		  if(n==0)return 0;
		  if(n%10==8){
		    if((n/10)%10==8){
		   return 2+count8(n/10);
		  }
		   return 1+count8(n/10);
		  }
		  return count8(n/10);
		}
	
	public int powerN(int base, int n) {
		  if(n==0) return 1;
		  return base*powerN(base,n-1);
		}

	public int countX(String str) {
		  if(str.length()==0) return 0;
		  if(str.charAt(0)=='x') return 1+countX(str.substring(1));
		  return countX(str.substring(1));
		}
	
	public String changeXY(String str) {
		  if(str.length()==0) return str;
		  if(str.charAt(0)=='x'){
		  return 'y'+ changeXY(str.substring(1));
		  }
		  return str.charAt(0) + changeXY(str.substring(1));
		}
	
	public String changePi(String str) {
		  if(str.length()<2) return str;
		  if(str.substring(0,2).equals("pi")){
		    return "3.14" + changePi(str.substring(2));
		  }
		  return str.charAt(0)+changePi(str.substring(1));
		}
	
	public String noX(String str) {
		  if(str.length()==0) return "";
		  if(str.charAt(0)=='x') return noX(str.substring(1));
		  return str.charAt(0)+noX(str.substring(1));
		}

	public boolean array6(int[] nums, int index) {
		  if(index>=nums.length) return false;
		  if(nums[index]!=6){
		   return array6(nums,index+1);
		   }
		   return true;
		}
	
	public int countPairs(String str) {
		  int c=0;
		  if(str.length()<=2) return 0;
		  if(str.charAt(c)==str.charAt(c+2)){
		    return 1+countPairs(str.substring(1));
		  }
		  else{
		    return countPairs(str.substring(1));
		  }
		}
	
	public int countAbc(String str) {
		  if(str.length()<3) return 0;
		  if(str.substring(0,3).equals("abc")||str.substring(0,3).equals("aba"))
		  {
		    return 1+countAbc(str.substring(1));
		  }
		  else return countAbc(str.substring(1));
		}
	
	public int countHi2(String str) {
		  if(str.length()<=1) return 0;
		  if(str.startsWith("xhi")) return countHi2(str.substring(3));
		  else if(str.startsWith("hi")) return 1+countHi2(str.substring(2));
		  else return countHi2(str.substring(1));
		}
	
	public boolean nestParen(String str) {
		  if(str.length()==0) return true;
		  else if(str.length()!=2) {
		     if(str.startsWith("(") && str.endsWith(")")){
		      return nestParen(str.substring(1,str.length()-1));
		     }
		     else return false;
		   }
		   else if(str.length()==2 && (str.startsWith("(") && str.endsWith(")"))) return true;
		   else return false;
		}
	
	public boolean groupSum(int start, int[] nums, int target) {

		// Base case: if there are no numbers left, then there is a
		  // solution only if target is 0.
		  if (start >= nums.length) return (target == 0);
		  
		  // Key idea: nums[start] is chosen or it is not.
		  // Deal with nums[start], letting recursion
		  // deal with all the rest of the array.
		  
		  // Recursive call trying the case that nums[start] is chosen --
		  // subtract it from target in the call.
		  if (groupSum(start + 1, nums, target - nums[start])) return true;
		  
		  // Recursive call trying the case that nums[start] is not chosen.
		  if (groupSum(start + 1, nums, target)) return true;
		  
		  // If neither of the above worked, it's not possible.
		  return false;
		  
		}
	
	public boolean groupSum6(int start, int[] nums, int target) {
		  if(start>=nums.length) return(target==0);
		  if(nums[start]==6) return groupSum6(start+1, nums, target-nums[start]);
		  if(groupSum6(start+1, nums, target-nums[start])){
		     return true;
		  }
		  if(groupSum6(start+1, nums, target)) return true;
		  return false;
		}
	
	public boolean groupNoAdj(int start, int[] nums, int target) {
		  if(start>=nums.length) return(target==0);
		  if(groupNoAdj(start+2, nums, target-nums[start])) return true;
		  if(groupNoAdj(start+1, nums, target)) return true;
		  return false;
		}
	
	public boolean groupSum5(int start, int[] nums, int target) {
		  if(start>=nums.length) return(target==0);
		    if(start<nums.length-1 && nums[start]%5==0 && nums[start+1]==1) return groupSum5(start+2, nums, target-nums[start]);
		  if(nums[start]%5==0) return groupSum5(start+1, nums, target-nums[start]);
		  if(groupSum5(start+1, nums, target-nums[start])) return true;
		  if(groupSum5(start+1, nums, target)) return true;
		  return false;
		}
}
