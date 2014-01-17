import java.util.regex.Pattern;

public class UserName {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		UserName un = new UserName();
		String[] existingNames ={"Bart4", "Bart5", "Bart6", "Bart7", "Bart8", "Bart9", "Bart10",
				 "Lisa", "Marge", "Homer", "Bart", "Bart1", "Bart2", "Bart3",
				 "Bart11", "Bart12"};
		//System.out.println(un.newMember(existingNames, "T#@iger"));
		//System.out.println(un.newMember(existingNames, "Bart"));
		System.out.println("Trying string end digit match expresion: "+"sad1".matches(".+\\d$"));
		System.out.println("Trying a-z expresion: "+"sad".matches("^.*[a-z]"));
		System.out.println("Trying A-Z expresion: "+"SAa".matches("^.[A-Z]"));
	}
	
	public String newMember(String[] existingNames, String newName){
		Pattern p = Pattern.compile("[^A-Za-z0-9]");
		if(p.matcher(newName).find()){
			return "not valid";
		}
		else {
			if(newName.length()>=1 && newName.length()<=50){
				for(int i=0; i<existingNames.length; i++){
					if(newName.compareTo(existingNames[i])==0){
					    if(newName.matches("^.+?\\d$")){
					    	System.out.println("when number is found: "+newName);
					    	newName=newName.substring(0,newName.length()-1)+(Integer.parseInt(newName.substring(newName.length()-1))+1);
					    	System.out.println("after fix: "+newName);
					    	return newMember(existingNames,newName);
					    }
					    else{
					    	System.out.println(newName);
					    	return newMember(existingNames,newName+1);
					    }
						
					}
				}
				return newName;
			}
			return "valid";
		}
	}

}
