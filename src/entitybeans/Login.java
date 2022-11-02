package entitybeans;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="userlogin")
public class Login {

@Id
@Column(name="userid")
private String userid;


@Column(name="pswd")
private String pswd;
	
@Column(name="usertype")
private String usertype;


public Login()
{
	userid="";
	pswd="";
	usertype="";
	
	
}




public String getUsertype() {
	return usertype;
}




public void setUsertype(String usertype) {
	this.usertype = usertype;
}




public String getUserid() {
	return userid;
}




public void setUserid(String userid) {
	this.userid = userid;
}




public String getPswd() {
	return pswd;
}


public void setPswd(String pswd) {
	this.pswd = pswd;
}





}
