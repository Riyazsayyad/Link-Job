<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="entitybeans.Job"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet" />
<title>Searched</title>
<style type="text/css">
.link{
color: Green;


}

.link:hover{
color: Black;
}

.tab{
margin: 5rem;
    padding: 1rem;
}
#table{
padding-top: 3rem;
    margin-left: 21rem;}
</style>
</head>
<body>
<%
if(session.getAttribute("userid") != null)
{
	String skill=request.getParameter("skill");
%>

<h1 class="title-font font-medium text-3xl text-gray-900">
                          
                        </h1>
<hr>
 <header class="text-gray-600 body-font">
                <div class="container mx-auto flex flex-wrap p-5 flex-col md:flex-row items-center">
                    <a class="flex title-font font-medium items-center text-gray-900 mb-4 md:mb-0">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-10 h-10 text-white p-2 bg-indigo-500 rounded-full" viewBox="0 0 24 24">
            <path
              d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"
            ></path>
          </svg>
                        <span class="ml-3 text-xl"> Skill: <%=skill %>
          </span>
                    </a>
                    <nav class="md:ml-auto flex flex-wrap items-center text-base justify-center">
                        
                        <a class="mr-5 hover:text-gray-900" href="Employee.jsp">Home</a>
                    </nav>
                    
            </header>

<section id="table">
<table border="1" width="50%" style="text-align:center">
<tr>
<th class="tab">JobID</th>
<th class="tab">Issue Date</th>
<th class="tab">Company UserID</th>
<th class="tab">Location</th>
<th class="tab">Package Per Anum</th>
<th>Action</th>
<th>Apply</th>
</tr>

<%
try
{
	Session ses;
	Configuration cfg=new Configuration().configure();
	SessionFactory sf=cfg.addAnnotatedClass(Job.class).buildSessionFactory();
	ses=sf.getCurrentSession();
	ses.beginTransaction();

	Query q=ses.createQuery("from Job where skill=:id and availablestat=:id1");
	q.setParameter("id",skill);
	q.setParameter("id1","yes");
	List lst=q.getResultList();

	Job obj;
	for(int i=0;lst.size()>i;i++)
	{
		obj=(Job) lst.get(i);
		
	%>
	
	<tr>
			<td><%=obj.getJobid() %></td>
			<td>
			
			<%
			Date date=obj.getIssuedate();
			 SimpleDateFormat formatter = new SimpleDateFormat("dd MMM yyyy");
			 String dt=formatter.format(date);
			%>
			<%=dt %>
			</td>
			
		<td><%=obj.getCompanyuserid() %></td>
		<td><%=obj.getLocation() %></td>
		<td><%=obj.getPacperanum() %></td>
		<td><a href="CompanyDetail_EM.jsp?userid=<%=obj.getCompanyuserid()%>" class="link">See Company Details</a></td>
		<td><a href="ApplyCompany_EM.jsp?jobid=<%=obj.getJobid()%>&companyuserid=<%=obj.getCompanyuserid() %>" class="link">Apply for Job</a></td>
	</tr>
	
	
	
	 <%}
	
	

	
	
}
catch(Exception ex)
{
	out.println("Error : "+ex);
}

%>
</table>
</section>
<%
}
else
{
	response.sendRedirect("Failure.jsp?status=invalidsession");
}
%>
</body>
</html>