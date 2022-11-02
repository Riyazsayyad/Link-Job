package myservlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import entitybeans.Job;
import entitybeans.Login;
/**
 * Servlet implementation class RecoverPassChange
 */
@WebServlet("/RecoverPassChange")
public class RecoverPassChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecoverPassChange() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String uid=request.getParameter("uid");
		String pswd=request.getParameter("pswd");
		try 
		{
			Session ses;
			Configuration cfg=new Configuration().configure(); 
			SessionFactory sf=cfg.addAnnotatedClass(Login.class).buildSessionFactory();
			ses=sf.getCurrentSession();
			ses.beginTransaction();
			
			Query q=ses.createQuery("update Login set pswd=:pswd where userid=:id");
			q.setParameter("pswd",pswd);
			q.setParameter("id",uid);
			
			int i=q.executeUpdate();
			ses.getTransaction().commit();
			if(i>0)
			{
				response.sendRedirect("RecoverPassOK.jsp?status=pass");
			}
			
		}
		catch (Exception e) 
		{
			// TODO: handle exception
			System.out.print(e.getMessage());
		}
		
	}

}
