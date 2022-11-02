package myservlets;

import java.io.IOException;
import java.util.List;

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
 * Servlet implementation class CheckLogin
 */
@WebServlet("/CheckLogin")
public class CheckLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userid=request.getParameter("usrid");
		String pswd=request.getParameter("pswd");
		try
		{
			Session ses;
			Configuration cfg=new Configuration().configure(); 
			SessionFactory sf=cfg.addAnnotatedClass(Login.class).buildSessionFactory();
			ses=sf.getCurrentSession();
			ses.beginTransaction();
			
			Query q=ses.createQuery("from Login where userid=:id and pswd=:psd");
			q.setParameter("id",userid);
			q.setParameter("psd",pswd);
			List lst=q.getResultList();
			
			if(lst.size()>0)
			{
				HttpSession session = request.getSession(true);
				Login obj =(Login) lst.get(0);
				session.setAttribute("userid", obj.getUserid());
				if(obj.getUsertype().equals("Company"))
				{
					response.sendRedirect("Company.jsp");
				}
				else if(obj.getUsertype().equals("Employee"))
				{
					response.sendRedirect("Employee.jsp");
				}
				
			}
			else
			{
				response.sendRedirect("Failure.jsp?status=wronglogin");
			}
			
		}
		catch(Exception e)
		{
		System.out.println(e);
		}
	
	
	
	
	}

}
