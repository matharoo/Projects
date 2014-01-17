package strings2;

public class strings2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		strings2 s= new strings2();
		System.out.print(s.comp("Absd", "Absd"));
	}
	public boolean comp(String str1,String str2)
	{
		if(str1.length()==str2.length()){
		if(str1.substring(0).equals(str2.substring(0))) return true;
		}
		return false;
	}
	
	public int countHi(String str) {
		  int count = 0;
		  // Loop to length-1 so we can access index i and i+1 in the loop.
		  for (int i = 0; i < (str.length() - 1); i++) {
		    if (str.substring(i, i+2).equals("hi")) count++;
		  }
		  return count;
		}
	
	public boolean catDog(String str) {
		  int cats=0;
		  int dogs=0;
		  if(str.length()>6){
		  for(int i=0; i<str.length(); i++)
		  {
		    if(i<str.length()-2){
		    if(str.substring(i,i+3).equals("cat")) cats++;
		    if(str.substring(i,i+3).equals("dog")) dogs++;
		    }
		  }
		  }
		  
		  if(str.length()==6)
		  {
		  for(int i=0; i<=6; i++)
		  {
		    if(i<str.length()-2){
		    if(str.substring(i,i+3).equals("cat")) cats++;
		    if(str.substring(i,i+3).equals("dog")) dogs++;
		    }
		  }
		  }
		  
		  if(str.length()<6){
		  for(int i=0; i<str.length(); i++)
		  {
		    if(i<str.length()-2){
		    if(str.substring(i,i+3).equals("cat")) cats++;
		    if(str.substring(i,i+3).equals("dog")) dogs++;
		    }
		  }
		  }
		  return(dogs==cats);
		}
	
	public int countCode(String str) {
		  int count=0;
		  
		  if(str.length()>4){
		    for(int i=0; i<str.length()-3; i++)
		    {
		      if((str.substring(i,i+2).equals("co") && str.substring(i+3,i+4).equals("e"))) count++;
		    }
		  }
		  if(str.length()==4) {
		  if((str.substring(0,2).equals("co") && str.substring(3,4).equals("e"))) count++;
		  }
		  return count;
		}
	
	public boolean endOther(String a, String b) {
		  String str1 = a.toLowerCase();
		  String str2 = b.toLowerCase();
		  if(str1.length()>str2.length()){
		  if(str1.substring(str1.length()-str2.length()).equals(str2)) return true;
		  }
		  else{
		  if(str2.substring(str2.length()-str1.length()).equals(str1)) return true;
		  }
		  return false;
		}
	
	public boolean bobThere(String str) {
		  if(str.length()>3){
		  for(int i=0; i<str.length()-1; i++){
		    if(str.substring(i,i+1).equals("b") && str.substring(i+2,i+3).equals("b"))return true;
		  }
		  }
		  if(str.length()==3){
		  if(str.substring(0,1).equals("b") && str.substring(2).equals("b"))return true;
		  }
		  return false;
		}
}
