package web.util;

public class StringUtil {

	public static boolean isEmpty(String inp){
		if((inp != null) && (!inp.isEmpty())){
				return false;			
		}
		return true;
	}
	
	public static String toLowerCase(String input){
		if(input != null){
			return input.toLowerCase();
		}
		return "null";
	}

}
