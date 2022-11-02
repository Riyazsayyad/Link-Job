package myservlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.cfg.Configuration;
import org.hibernate.Session;
import org.hibernate.SessionFactory;


import entitybeans.Userdata;
import entitybeans.Login;


/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		try {
			String otp=request.getParameter("otp");
			String oriotp=request.getParameter("oriotp");
			if(oriotp.equals(otp))
			{
				String userid=request.getParameter("usrid");
			    String name =request.getParameter("name");
			    String email=request.getParameter("email");
			    String usertype=request.getParameter("type");
			    String secquestion=request.getParameter("que");
			    String secans=request.getParameter("ans");
			    String pswd=request.getParameter("pswd");
			    
			    Session Ses;
			    Configuration cfg=new Configuration().configure();
			    SessionFactory sf=cfg.addAnnotatedClass(Login.class).buildSessionFactory();

			    Ses=sf.getCurrentSession();
			    Ses.beginTransaction();
			    
			    Login obj = new Login();
			    obj.setUserid(userid);
			    obj.setPswd(pswd);
			    obj.setUsertype(usertype);
			    
			    Ses.save(obj);
			    Ses.getTransaction().commit();
			    
			    Session Ses1;
			    Configuration cfg1=new Configuration().configure();
			    SessionFactory sf1=cfg1.addAnnotatedClass(Userdata.class).buildSessionFactory();

			    Ses1=sf1.getCurrentSession();
			    Ses1.beginTransaction();
			    
			    Userdata obj1 = new Userdata();
			    obj1.setUserid(userid);
			    obj1.setName(name);
			    obj1.setEmail(email);
			    obj1.setSecquestion(secquestion);
			    obj1.setSecans(secans);
			    
			    Ses1.save(obj1);
			    Ses1.getTransaction().commit();
			    
			    if (usertype.equals("Employee")) {
			    	response.sendRedirect("Dumpy.jsp");
				} else {
					response.sendRedirect("Failure.jsp?status=otpwrong");
				}
			    
			}
			else
			{
				response.sendRedirect("Failure.jsp?status=otpwrong");
			}}
			catch (Exception e) {
				// TODO: handle exception
				System.out.print(e.getMessage());
			}
	}

}
