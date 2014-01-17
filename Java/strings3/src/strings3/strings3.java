package strings3;

public class strings3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String str="happy";
		System.out.print(str.charAt(0));
		System.out.print(Integer.parseInt(str));
	}
	
	public boolean equalIsNot(String str) {
		  int is=0;
		  int not=0;
		  for(int i=0; i<str.length(); i++){
		    if(i<=str.length()-2){
		      if(str.substring(i,i+2).equals("is")) is++;
		    }
		    if(i<=str.length()-3){
		      if(str.substring(i,i+3).equals("not")) not++;
		    }
		  }
		  return(is==not);
		}
	
	public boolean gHappy(String str) {
		  boolean happy= true;
		  for(int i=0; i<str.length(); i++){
		    if(str.charAt(i)== 'g'){
		      if(i>0 && str.charAt(i-1)=='g') happy=true;
		      else if(i<str.length()-1 && str.charAt(i+1)=='g') happy=true;
		      else happy=false;
		    }
		  }
		  return happy;
		}

	public int sumDigits(String str) {
		  int sum=0;
		  for(int i=0; i<str.length(); i++){
		    if(Character.isDigit(str.charAt(i))) sum=sum+ Character.getNumericValue(str.charAt(i)); 
		  }
		  return sum;
		}
	
	public int countTriple(String str) {
		  int triple=0;
		  for(int i=0; i<str.length()-2; i++)
		  {
		     if((str.charAt(i)==str.charAt(i+1)) && (str.charAt(i+1)==str.charAt(i+2))){
		       triple++;
		     }
		  }
		  return triple;
		}
}
