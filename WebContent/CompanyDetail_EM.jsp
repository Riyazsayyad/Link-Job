<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="entitybeans.Userdata"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Details</title>
<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet" />
</head>
<body>

<header class="text-gray-600 body-font">
                <div class="container mx-auto flex flex-wrap p-5 flex-col md:flex-row items-center">
                    <a class="flex title-font font-medium items-center text-gray-900 mb-4 md:mb-0">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-10 h-10 text-white p-2 bg-indigo-500 rounded-full" viewBox="0 0 24 24">
            <path
              d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"
            ></path>
          </svg>
                        <span class="ml-3 text-xl"> LinkIndia
          </span>
                    </a>
                    <nav class="md:ml-auto flex flex-wrap items-center text-base justify-center">
                        
                        <a class="mr-5 hover:text-gray-900" href="Employee.jsp">Home</a>
                    </nav>
                    
            </header>

<%
if(session.getAttribute("userid") != null)
{
	String companyuserid=request.getParameter("userid");
%>
<%
try
{
	Session ses;
	Configuration cfg=new Configuration().configure();
	SessionFactory sf=cfg.addAnnotatedClass(Userdata.class).buildSessionFactory();
	ses=sf.getCurrentSession();
	ses.beginTransaction();

	Query q=ses.createQuery("from Userdata where userid=:id");
	q.setParameter("id",companyuserid);
	
	List lst=q.getResultList();

	Userdata obj=(Userdata) lst.get(0);
	%>
	Company Name: <%=obj.getName() %><br>
	Email: <%=obj.getEmail()%>

<%
}
catch(Exception ex)
{
	out.println("Error : "+ex);
}
}
else
{
	response.sendRedirect("Failure.jsp?status=invalidsession");
}
%>
</body>
</html>