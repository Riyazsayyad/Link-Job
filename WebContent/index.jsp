<%@page import="org.hibernate.query.Query"%>
<%@page import="entitybeans.Job"%>
<%@page import="java.util.*"%>

<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet" />
    <title>Link Job</title>
    <style>
        body {
            background-color: #111827;
        }
        
        .pr-8 {
    padding-right: 2rem;
    margin-left: 68px;
}
        .container {
            padding-top: 1rem;
            padding-bottom: 0;
        }
        
        #signin {
            color: white;
            padding-left: 202px;
            text-align: left;
            margin-bottom: -31px;
        }
        
        .leading-7 {
            color: white;
        }
        
        #inbutt {
            background-color: #0dba83;
        }
        
        #inbutt:hover {
            background-color: #059669;
        }
        
        #searchbutt {
            background-color: #0dba83;
    margin-left: 48px;
    margin-bottom: 2px;
    padding: 8px;
        }
        
        #searchbuttt:hover {
            background-color: #059669;
        }
        
        #containsearch {
        
         padding:2rem;
        }
        
        
        
        #line-1 {
            color: white;
            text-align: center;
            padding: 1rem;
        }
        
        #line-2{
        
        	color: white;
            text-align: left;
            
            padding: 0;
            padding-left: 259px;
        }
        
        .w-full input {
            background-color: #ffffff33;
            color: white;
        }
        
        .w-full input:focus {
            background-color: #ffffff6e;
            border-color: aliceblue;
        }
    </style>
</head>

<body>
    <!-- signin option -->
    <section class="text-gray-600 body-font">
        <div class="container px-5 py-24 mx-auto">
            <div class="flex flex-col text-center w-full mb-12">
                <h1 class="sm:text-3xl text-2xl font-medium title-font mb-4 text-gray-900" id="signin">
                    Signin
                </h1>
            </div>
            <form action="CheckLogin" method="POST" name="frm">
                <div class="flex lg:w-2/3 w-full sm:flex-row flex-col mx-auto px-8 sm:space-x-4 sm:space-y-0 space-y-4 sm:px-0 items-end">
                    <div class="relative flex-grow w-full">
                        <label for="full-name" class="leading-7 text-sm text-gray-600">Userid
              </label>
                        <input type="text" id="full-name" name="usrid" class="w-full bg-gray-100 bg-opacity-50 rounded border border-gray-300 focus:border-indigo-500 focus:bg-transparent focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"
                            wtx-context="FB0CDB97-8170-412F-BB5A-8AE7BE0420FB" required />
                    </div>
                    <div class="relative flex-grow w-full">
                        <label for="email" class="leading-7 text-sm text-gray-600">Password</label
              >
              <input
                type="password"
                id="email"
                name="pswd"
                class="w-full bg-gray-100 bg-opacity-50 rounded border border-gray-300 focus:border-indigo-500 focus:bg-transparent focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"
                wtx-context="445DE965-9E72-429B-8E7B-8EB04B39582B"
                required
              />
            </div>
            <div>
              <button
                class="text-white bg-indigo-500 border-0 py-2 px-8 focus:outline-none hover:bg-indigo-600 rounded text-lg"
                id="inbutt"
                type="submit"
              >
                Submit
              </button>
            </div>
          </div>
        </form>
      </div>
      <div id="line-2">
        <h4><a href="ForgotPass.jsp">Forgot Password ?</a></h4>
      </div>
      <div id="line-1">
        <h3>If you are new then Signup below</h3>
      </div>
    </section>
   

<!-- register option -->
    <section class="text-gray-400 bg-gray-900 body-font">
      <div class="container px-5 py-24 mx-auto">
        <div class="flex flex-wrap -mx-4 -mb-10 text-center">
          <div class="sm:w-1/2 mb-10 px-4">
            <div class="rounded-lg h-64 overflow-hidden">
              <img
                alt="content"
                class="object-cover object-center h-full w-full"
                src="https://source.unsplash.com/K_VeavYEfdA/1202x502"
              />
            </div>
            <h2 class="title-font text-2xl font-medium text-white mt-6 mb-3">
              Register as Company
            </h2>
            <p class="leading-relaxed text-base">
              Register as a Company and create jobs to get right person for it.
            </p>
            <button
              class="flex mx-auto mt-6 text-white bg-green-500 border-0 py-2 px-5 focus:outline-none hover:bg-green-600 rounded"
            >
              <a href="CompanyReg.jsp">Register</a>
            </button>
          </div>
          <div class="sm:w-1/2 mb-10 px-4">
            <div class="rounded-lg h-64 overflow-hidden">
              <img
                alt="content"
                class="object-cover object-center h-full w-full"
                src="https://source.unsplash.com/GwOqUzrDSRM/1202x502"
              />
            </div>
            <h2 class="title-font text-2xl font-medium text-white mt-6 mb-3">
              Register as Employee
            </h2>
            <p class="leading-relaxed text-base">
              Register as a Employee and apply for jobs accordin to your needs.
            </p>
            <button
              class="flex mx-auto mt-6 text-white bg-green-500 border-0 py-2 px-5 focus:outline-none hover:bg-green-600 rounded"
            >
              <a href="EmployeReg.jsp">Register</a>
            </button>
          </div>
        </div>
      </div>
    </section>
    <!-- Search job -->
<section class="text-gray-600 body-font">
  
  <div class="container mx-auto flex flex-col px-5 py-24 justify-center items-center" id="containsearch">
    
    <div class="w-full md:w-2/3 flex flex-col mb-16 items-center text-center">
      <form name="frm1" method="post" action="SearchJobSIndex.jsp">
      <h2 class="title-font text-2xl font-medium text-white mt-6 mb-3">
              Search Jobs Based On Skill and Location
            </h2>
      <div class="flex w-full justify-center items-end">
        <div class="relative mr-4 lg:w-full xl:w-1/2 w-2/4 md:w-full text-left">
          <div>
              <select
                class="block appearance-none w-full bg-gray-200 border border-gray-200 text-gray-700 py-3 px-4 pr-8 rounded leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
                name="skill"
              >
              <option>Select Skill</option>
                <%
try
{
	Session ses;
	Configuration cfg=new Configuration().configure();
	SessionFactory sf=cfg.addAnnotatedClass(Job.class).buildSessionFactory();
	ses=sf.getCurrentSession();
	ses.beginTransaction();

	Query q=ses.createQuery("from Job");
	List lst=q.getResultList();

	Job obj;
	for(int i=0;lst.size()>i;i++)
	{
		obj=(Job) lst.get(i);
		
	%>
                            <option value="<%=obj.getSkill()%>"><%=obj.getSkill()%></option>
                         <%}
	
	

	
	


%>
 </select>
 <br>
<select
                class="block appearance-none w-full bg-gray-200 border border-gray-200 text-gray-700 py-3 px-4 pr-8 rounded leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
                name="location"
              >
              
              <option>Select Location</option>
<%
for(int i=0;lst.size()>i;i++)
{
	obj=(Job) lst.get(i);
	
%>
                        <option value="<%=obj.getLocation()%>"><%=obj.getLocation()%></option>
                     <%
                     }
}
catch(Exception ex)
{
	out.println("Error : "+ex);
}
%>
              </select>
              
            </div>
        </div>
        <button class="inline-flex text-white bg-indigo-500 border-0 py-2 px-6 focus:outline-none hover:bg-indigo-600 rounded text-lg" id="searchbutt">Search</button>
      </div>
      
      <div class="flex">
        
      </div>
    </div>
  </div>
</section>
  </body>
</html>