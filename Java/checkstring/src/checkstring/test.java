package checkstring;
import java.util.Arrays;

public class test {
	public static void main(String args[]){
		System.out.println(sameChars("HELLO", "HELLO"));
		
		System.out.println(isRotation("stackoverflow", "tackoverflowss"));
	}
	
	public static boolean sameChars(String firstStr, String secondStr) {
		  char[] first = firstStr.toCharArray();
		  char[] second = secondStr.toCharArray();
		  Arrays.sort(first);
		  Arrays.sort(second);
		  return Arrays.equals(first, second);
		}
	
	public static boolean isRotation(String s1,String s2) {
	    return (s1.length() == s2.length()) && ((s1+s1).indexOf(s2) != -1);
	}
	
	public String missingChar(String str, int n) {
		  String front = str.substring(0, n);
		  
		  // Start this substring at n+1 to omit the char.
		  // Can also be shortened to just str.substring(n+1)
		  // which goes through the end of the string.
		  String back = str.substring(n+1, str.length());
		  
		  return front + back;
		}
	
	public String notString(String str) {
		  if (str.length() >= 3 && str.substring(0, 3).equals("not")) {
		    return str;
		  }
		  
		  return "not " + str;
		}
	
	public String frontBack(String str) {
		  if (str.length() <= 1) return str;
		  
		  String mid = str.substring(1, str.length()-1);
		  
		  // last + mid + first
		  return str.charAt(str.length()-1) + mid + str.charAt(0);
		}
	
	public String front3(String str) {
		  String front;
		  
		  if (str.length() >= 3) {
		    front = str.substring(0, 3);
		  }
		  else {
		    front = str;
		  }

		  return front + front + front;
		}
	
	public String backAround(String str) {
		  return (str.charAt(str.length()-1) + str + str.charAt(str.length()-1) );
		}
	
	public String front22(String str) {
		  if(str.length()>2){
		  String front = str.substring(0,2);
		  return front+str+front;
		  }
		  else{
		  return str+str+str;
		  }
		}
	
	public boolean startHi(String str) {
		  return (str.length()>=2 && str.substring(0,2).equals("hi"));
		}

	public String delDel(String str) {
		  if (str.length()>=4 && str.substring(1, 4).equals("del")) {
		    // First char + rest of string starting at 4
		    return str.substring(0, 1) + str.substring(4);
		  }
		  // Otherwise return the original string.
		  return str;
		}

	public boolean mixStart(String str) {
		  return(str.length()>=3 && str.substring(1,3).equals("ix"));
		}
	
	public boolean stringE(String str) {
		  int counte =0;
		  for(int i=0; i<=str.length()-1; i++)
		  {
		    if(str.charAt(i)=='e')
		     {
		       counte++;
		     }
		  }
		  
		  if(counte<4 && counte>0) return true;
		  return false;
		}
	
	public String makeOutWord(String out, String word) {
		  return out.substring(0,2)+word+out.substring(2,4);
		}

	public String firstTwo(String str) {
		  if(str.length()>2) return str.substring(0,2); 
		  if(str.length()<=2)return str;
		  return "";
		}

	public String firstHalf(String str) {
		  return str.substring(0,str.length()/2);
		}

	public String comboString(String a, String b) {
		  String shorts = a;
		  String longer = "";
		  if(a.length()>b.length()){
		   longer = a; 
		   shorts=b;
		   }
		  else{
		   longer = b;
		   }
		  
		  return shorts+longer+shorts;
		}

	public String nonStart(String a, String b) {
		  return a.substring(1,a.length()) + b.substring(1,b.length());
		}

	public String left2(String str) {
		  return str.substring(2)+str.substring(0,2);
		}
	public String middleTwo(String str) {
		  return str.substring(str.length()/2-1,(str.length()/2)+1);
		}

	public boolean endsLy(String str) {
		  if(str.length()>2 && str.substring(str.length()-2).equals("ly"))
		  {
		    return true;
		  }
		  if(str.length()==2 && str.substring(0,2).equals("ly"))
		  {
		    return true;
		  }
		  if(str.length()<1)
		  {
		  return false;  
		  }
		  return false;
		}
	
	public String nTwice(String str, int n) {
		  return str.substring(0,n)+str.substring(str.length()-n);
		}

	public String middleThree(String str) {
		  return str.substring(str.length()/2 -1,(str.length()/2)+2);
		}

	public boolean hasBad(String str) {
		  if(str.length()>3){
		  return (str.substring(0,3).equals("bad") || str.substring(1,4).equals("bad"));
		  }
		  if(str.length()==3){
		  return (str.substring(0,3).equals("bad"));
		  }
		  return false;
		}
	
	public String atFirst(String str) {
		  if(str.length()>=2) return str.substring(0,2);
		  if(str.length()==0) return "@@";
		  if(str.length()<2) return str+"@";
		  return "";
		}
	
	public String lastChars(String a, String b) {
		 if(a.length()>0 && b.length()>0) return a.substring(0,1)+b.substring(b.length()-1);
		  if(a.length()==0 && b.length()!=0) return "@"+b.substring(b.length()-1);
		  if(b.length()==0 && a.length()!=0) return a.substring(0,1)+"@";
		  return "@@";
		}
	
	public String conCat(String a, String b) {
		  if(a.length()>0 && b.length()>0){
		  if(a.substring(a.length()-1).equals(b.substring(0,1)))return a+b.substring(1);
		  }
		  return a+b;
		}

	public String seeColor(String str) {
		  if(str.length()==3){
		  if(str.substring(0,3).equals("red")) return str.substring(0,3);
		  }
		  if(str.length()>3){
		  if(str.substring(0,3).equals("red")) return str.substring(0,3);     
		  if (str.substring(0,4).equals("blue")) return str.substring(0,4);
		  }
		  return "";
		}
	
	public boolean frontAgain(String str) {
		  if(str.length()>1){
		  return(str.substring(0,2).equals(str.substring(str.length()-2)));
		  }
		  if(str.length()==1){
		  return false;
		  }
		  return false;
		}
	
	public String minCat(String a, String b) {
		  String longer = "";
		  if(a.length()>b.length()){
		   longer = a.substring(a.length()-b.length(),a.length());
		   return longer+b;
		  }
		  if(b.length()>a.length()){
		   longer = b.substring(b.length()-a.length(),b.length());
		   return a+longer;
		  }
		  return a+b;
		}
	
	public String extraFront(String str) {
		  if(str.length()>=2)
		  {
		    return str.substring(0,2)+str.substring(0,2)+str.substring(0,2);
		  }
		  return str+str+str;
		}
	
	public String without2(String str) {
		  if(str.length()>2)
		  {
		    if(str.substring(0,2).equals(str.substring(str.length()-2))){
		      return str.substring(2,str.length());
		    }
		    else{
		     return str;
		    }
		  }
		  if(str.length()==2) return "";
		  return str;
		}
	
	public String deFront(String str) {
		  String save= "";    
		  if(str.length()>=2){
		   if(str.substring(0,1).equals("a")) save= save+str.substring(0,1);
		   if(str.substring(1,2).equals("b")) save= save+str.substring(1,2);
		   return save + str.substring(2,str.length());
		  }
		  return str.substring(2,str.length());
		}
	
	public String startWord(String str, String word) {
		if(str.length()>2){
		  if(str.substring(0,word.length()).equals(word)){
		  return str.substring(0,word.length());
		  }
		  if(str.substring(1,word.length()).equals(word.substring(1,word.length()))){
		  return str.substring(0,word.length());
		  }
		  
		  }
		  
		if(str.length()==1 && word.length()==1){
		  return str.substring(0,1);
		  }
		  

		  return "";
		}
	
	public String withoutX(String str) {
		  if(str.length()>1)
		  {
		    if(str.substring(0,1).equals("x")) {
		    if (str.substring(str.length()-1).equals("x")){
		     return str.substring(1,str.length()-1);
		     }
		    }
		    if(str.substring(0,1).equals("x")) return str.substring(1);
		    if(str.substring(str.length()-1).equals("x")) return str.substring(0,str.length()-1);
		    return str;
		  }
		  return "";
		}
	
	public String withoutX2(String str) {
		  String save="";
		  if(str.length()>1)
		  {
		    if(str.substring(0,1).equals("x")){
		     save = str.substring(1,str.length());
		     if(str.substring(1,2).equals("x")){
		    save = str.substring(2,str.length());
		    }
		    return save;
		     }
		        if(str.substring(1,2).equals("x")){
		        save= str.substring(0,1)+str.substring(2,str.length());
		        return save;
		    }
		    if(str.charAt(0)!='x' && str.charAt(1)!='x') {
		        return str;
		    }
		  }
		  return "";
		}
	
	public String twoChar(String str, int index) {
		  if(index<str.length()-1 && index>=0) return str.substring(index,index+2);
		  if(index<0) return str.substring(0,2);
		  if(index>=str.length()-1) return str.substring(0,2);
		  if(index>=2) return str.substring(index);
		  return str.substring(1,2);
		}
}
