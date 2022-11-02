package entitybeans;
import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

@Entity
@Table(name="job")
@IdClass(Job.class)
public class Job implements Serializable {
	@Id
	@Column(name="jobid")
	private String jobid;
	
	@Id
	@Column(name="companyuserid")
	private String companyuserid;
	
	@Id
	@Column(name="issuedate")
	private Date issuedate;
	
	@Id
	@Column(name="skill")
	private String skill;
	
	@Id
	@Column(name="location")
	private String location;
	
	@Id
	@Column(name="pacperanum")
	private int pacperanum;
	
	@Id
	@Column(name="availablestat")
	private String availablestat;

	

	
	public Job()
	{
		jobid= "";
		companyuserid="";
		issuedate=new Date();;
		skill="";
		location="";
		pacperanum= 0;
		availablestat="";
		
	}




	public String getJobid() {
		return jobid;
	}




	public void setJobid(String jobid) {
		this.jobid = jobid;
	}




	public String getCompanyuserid() {
		return companyuserid;
	}




	public void setCompanyuserid(String companyuserid) {
		this.companyuserid = companyuserid;
	}




	public Date getIssuedate() {
		return issuedate;
	}




	public void setIssuedate(Date date) {
		this.issuedate = date;
	}




	public String getSkill() {
		return skill;
	}




	public void setSkill(String skill) {
		this.skill = skill;
	}




	public String getLocation() {
		return location;
	}




	public void setLocation(String location) {
		this.location = location;
	}




	public int getPacperanum() {
		return pacperanum;
	}




	public void setPacperanum(int pacperanum) {
		this.pacperanum = pacperanum;
	}




	public String getAvailablestat() {
		return availablestat;
	}




	public void setAvailablestat(String availablestat) {
		this.availablestat = availablestat;
	}
	
	
	
	
	
}
