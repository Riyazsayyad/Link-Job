package myservlets;

import java.io.IOException;
import java.util.List;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import entitybeans.Login;
/**
 * Servlet implementation class ResetPass_CO
 */
@WebServlet("/ResetPass_EM")
public class ResetPass_EM extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResetPass_EM() {
        super();
        // TODO Auto-generated constructor stub
    }

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession(true);
		try 
		{
			String userid=String.valueOf(session.getAttribute("userid"));
			String currpass=request.getParameter("currpass");
			String newpass=request.getParameter("cnfnewpswd");
			
			Session ses;
			Configuration cfg=new Configuration().configure(); 
			SessionFactory sf=cfg.addAnnotatedClass(Login.class).buildSessionFactory();
			ses=sf.getCurrentSession();
			ses.beginTransaction();
			
			Query q=ses.createQuery("from Login where userid=:id and pswd=:psd");
			q.setParameter("id",userid);
			q.setParameter("psd",currpass);
			List lst=q.getResultList();
			if (lst.size()>0) 
			{
				
				q=ses.createQuery("update Login set pswd=:psw where userid=:id");
				q.setParameter("psw",newpass);
				q.setParameter("id",userid);
				int i=q.executeUpdate();
				ses.getTransaction().commit();
				if(i>0)
				{
					response.sendRedirect("Intermediate-1.jsp?status=pass");
				}
				
			}
			else 
			{
				response.sendRedirect("Intermediate-1.jsp?status=fail");

			}
			
			
			
		}
		catch (Exception e) 
		{
			// TODO: handle exception
			System.out.print(e.getMessage());
		}
	}

}
