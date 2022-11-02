package myservlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import entitybeans.Userdata;
import entitybeans.Login;
import mybeans.GenerateOTP;
import mybeans.SendEmail;
/**
 * Servlet implementation class RecoverPass
 */
@WebServlet("/RecoverPass")
public class RecoverPass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecoverPass() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userid=request.getParameter("usrid");
		String secquestion=request.getParameter("que");
		String secans = request.getParameter("ans");
		String status;
		int genotp = 0;
		try
		{
			Session ses;
			Configuration cfg=new Configuration().configure();
			SessionFactory sf=cfg.addAnnotatedClass(Userdata.class).buildSessionFactory();
			ses=sf.getCurrentSession();
			ses.beginTransaction();

			Query q=ses.createQuery("from Userdata where userid=:id and secquestion=:id1 and secans=:id2");
			q.setParameter("id",userid);
			q.setParameter("id1",secquestion);
			q.setParameter("id2",secans);
			List lst=q.getResultList();
			Userdata obj ;
			if(lst.size()>0)
			{
				obj = (Userdata) lst.get(0);
				status="found";
				char[] s= GenerateOTP.generateOTP(6);
				String otp=String.valueOf(s);
				
				SendEmail eml= new SendEmail("Linked Consultant","Recover password","OTP is "+otp,obj.getEmail());
				genotp=Integer.parseInt(otp);
				genotp=genotp+123456;
				response.sendRedirect("RecoverPassOTP.jsp?uid="+userid+"&status="+status+"&gp="+genotp);
			}
			else {
				status="nf";
				response.sendRedirect("RecoverPassOTP.jsp?status="+status);
			}
			
			
			
		}
		catch(Exception ex)
		{
			System.out.println("Error : "+ex);
		}
	
	}

}
