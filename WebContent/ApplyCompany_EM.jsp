<%@page import="mybeans.SendEmail"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="mybeans.JobApplliedID_generator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="entitybeans.JobApplied"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Apply</title>
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
	String candidateuserid=String.valueOf(session.getAttribute("userid"));
	String jobid=request.getParameter("jobid");
	String companyuserid=request.getParameter("companyuserid");
	
	
	try
	{
		Session ses;
		Configuration cfg=new Configuration().configure();
		SessionFactory sf=cfg.addAnnotatedClass(JobApplied.class).buildSessionFactory();
		ses=sf.getCurrentSession();
		ses.beginTransaction();

		Query q=ses.createQuery("from JobApplied where candidateuserid=:id and jobid=:id1");
		q.setParameter("id",candidateuserid);
		q.setParameter("id1",jobid);
		List lst=q.getResultList();
		
		if(lst.size()>0)
		{
			%>
			
			<h1 class="title-font font-medium text-3xl text-gray-900">
                            You have applied for this previosly....
                            
                        </h1>
                        
			<%
			response.sendRedirect("Intermediate-1.jsp?status=preapplied");
		}
		else
		{
			JobApplied ja = new JobApplied();
			ja.setJobappid(JobApplliedID_generator.generateJobAppliedID());
			ja.setCandidateuserid(candidateuserid);
			ja.setCompanyuserid(companyuserid);
			ja.setJobid(jobid);
			 SimpleDateFormat formatter = new SimpleDateFormat("dd MMM yyyy HH:mm:ss");
			    Date date = new Date();
			    String dt=formatter.format(date);
			    date=formatter.parse(dt);
			    ja.setApplydate(date);
			    ses.save(ja);
			    ses.getTransaction().commit();
			    %>
				
				<h1 class="title-font font-medium text-3xl text-gray-900">
                            Job Application Submited.....
                        </h1>
				<%
		response.sendRedirect("Intermediate-1.jsp?status=applied");
		}

	
	
	}
	catch(Exception ex)
	{
		out.println("Error : "+ex);
	}
	
	
%>



<%
}
else
{
	response.sendRedirect("Failure.jsp?status=invalidsession");
}
%>
</body>
</html>