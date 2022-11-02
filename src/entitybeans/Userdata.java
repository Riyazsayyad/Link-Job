package entitybeans;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="userdata")
public class Userdata {
	@Id
	@Column(name="userid")
	private String userid;
	
	@Column(name="name")
	private String name;
	
	@Column(name="email")
	private String email;
	
	@Column(name="secquestion")
	private String secquestion;
	
	@Column(name="secans")
	private String secans;
	
	
	
	public Userdata()
	{
		userid="";
		name="";
		email="";
		secquestion="";
		secans="";
		
	}
	
	


	

	

	public String getUserid() {
		return userid;
	}




	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSecquestion() {
		return secquestion;
	}

	public void setSecquestion(String secquestion) {
		this.secquestion = secquestion;
	}

	public String getSecans() {
		return secans;
	}

	public void setSecans(String secans) {
		this.secans = secans;
	}
	
	
}
