package checkstring;
import java.util.Arrays;

public class numberss {
	public static void main(String args[]){
		int a[] = {5,2,9,3,6,1,7,2};
		System.out.println("Value in array is:"+a[0]);
		Arrays.sort(a);
		for(int i=0; i<a.length;i++)
		{
			System.out.println(a[i]);
		}
		
		System.out.println(Math.abs(12));
	}
	 
	public boolean icyHot(int temp1, int temp2) {
		  return ((temp1<0 || temp2<0) && (temp1>100 || temp2>100));
		}

	public boolean hasTeen(int a, int b, int c) {
		  return((a>=13 && a<=19) || (b>=13 && b<=19) || (c>=13 && c<=19));
		}
	
	public boolean loneTeen(int a, int b) {
		  boolean ateen = false;
		  boolean bteen = false;
		  if((a>=13 && a<=19)) ateen = true;
		  if((b>=13 && b<=19)) bteen = true;
		  if((!ateen && bteen) || (ateen && !bteen)) return true;
		  return false;
		}
	
	public boolean in3050(int a, int b) {
		  return( (a>=30 && a<=40) && (b>=30 && b<=40) || (a>=40 && a<=50) && (b>=40 && b<=50) );
		}

	public boolean lastDigit(int a, int b) {
		  return( (a==b) || (a%10 == b%10));

		}
	
	public String endUp(String str) {
		  if(str.length()>3) return str.substring(0,str.length()-3)+str.substring(str.length()-3,str.length()).toUpperCase();
		  return str.toUpperCase();
		}
	
	public String everyNth(String str, int n) {
		  String nsew= "";
		  for(int i=0; i<=str.length()-1; i=n+i)
		  {
		    nsew = nsew+str.charAt(i);
		  }
		  return nsew;
		}

	public String missingChar(String str, int n) {
		 return((str.substring(0,n)) + str.substring(n+1,str.length()));
		}
	
	public int strCount(String str, String sub) {
		  if(str.length()<sub.length()) return 0;
		  if(str.substring(0,sub.length()).equals(sub) && str.length()>=sub.length()) return 1+strCount(str.substring(sub.length()),sub);
		  else return strCount(str.substring(1),sub);
		}
}
