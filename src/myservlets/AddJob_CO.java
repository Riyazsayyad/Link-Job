package myservlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import entitybeans.Job;

/**
 * Servlet implementation class AddJob_CO
 */
@WebServlet("/AddJob_CO")
public class AddJob_CO extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddJob_CO() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession(true);
		String skill=request.getParameter("skill");
		String location=request.getParameter("loc");
		String pacperanum=request.getParameter("pa");

		String jobid=request.getParameter("jobid");
		
		
		
		try
		{
	    Session Ses;
	    Configuration cfg=new Configuration().configure();
	    SessionFactory sf=cfg.addAnnotatedClass(Job.class).buildSessionFactory();

	    Ses=sf.getCurrentSession();
	    Ses.beginTransaction();
	    
	    Job obj = new Job();
	    obj.setJobid(jobid);
	    obj.setCompanyuserid(String.valueOf(session.getAttribute("userid")));
	    SimpleDateFormat formatter = new SimpleDateFormat("dd MMM yyyy HH:mm:ss");
	    Date date = new Date();
	    String dt=formatter.format(date);
	    date=formatter.parse(dt);
	    obj.setIssuedate(date);
	    obj.setSkill(skill);
	    obj.setLocation(location);
	    obj.setPacperanum(Integer.parseInt(pacperanum));
	    obj.setAvailablestat("yes");
	    
	    
	    Ses.save(obj);
	    Ses.getTransaction().commit();
	    
	    response.sendRedirect("Intermediate.jsp?status=pass");
		}
		catch(Exception e)
		{
		System.out.println(e);
		}
		
		
	}

}
