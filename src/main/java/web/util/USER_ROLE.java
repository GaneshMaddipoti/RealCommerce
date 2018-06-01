package web.util;

public enum USER_ROLE {
	
	ROLE_USER("ROLE_USER"), ROLE_ADMIN("ROLE_ADMIN");
	
	private String roleName; 
    private USER_ROLE(String roleName) { 
        this.roleName = roleName; 
    } 
    
    @Override 
    public String toString(){ 
        return roleName; 
    } 

}
