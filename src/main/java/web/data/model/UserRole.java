package web.data.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="user_roles")
public class UserRole {
	 
	@Id
	@Column(name="user_role_id")
	@GeneratedValue(strategy=GenerationType.AUTO)
    private Integer id;
	
    @Column(name="username")
    private String userName;
    
    @Column(name = "role")
    private String role;
 
    public UserRole() {
 
    }

	public UserRole(String userName, String role) {
		super();
		this.userName = userName;
		this.role = role;
	}

	public UserRole(Integer id, String userName, String role) {
		super();
		this.id = id;
		this.userName = userName;
		this.role = role;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
   
 
}
