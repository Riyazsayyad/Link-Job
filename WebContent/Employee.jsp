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
    <meta charset="ISO-8859-1" />
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet" />
    <title>Employee</title>
    <style>
        .w-full {
            width: 18%;
        }
        
        .px-8 {
            padding-left: 2rem;
            padding-right: 2rem;
            padding-bottom: 0;
            padding-top: 0;
            margin-top: 7px;
        }
        
        .mb-5 {
            margin-bottom: 0.25rem;
        }
        
        #select{
        text-align: center;
    margin-top: 12rem;}
    </style>
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
                <span class="ml-3 text-xl">Tailblocks | UserID: <%=session.getAttribute("userid") %></span
          >
        </a>
        <nav
          class="md:ml-auto flex flex-wrap items-center text-base justify-center"
        >
          
          <a class="mr-5 hover:text-gray-900" href="ChangePass_EM.jsp">Change Password</a>
        </nav>
        <button
          class="inline-flex items-center bg-gray-100 border-0 py-1 px-3 focus:outline-none hover:bg-gray-200 rounded text-base mt-4 md:mt-0"
        >
          <a href="Logout.jsp">Logout</a>
          <svg
            fill="none"
            stroke="currentColor"
            stroke-linecap="round"
            stroke-linejoin="round"
            stroke-width="2"
            class="w-4 h-4 ml-1"
            viewBox="0 0 24 24"
          >
            <path d="M5 12h14M12 5l7 7-7 7"></path>
          </svg>
        </button>
      </div>
    </header>

    <% if(session.getAttribute("userid") != null) { %>
<section id="select">

<form name="frm" method="post" action="SearchJob_EM.jsp">
      <h2 class="text-gray-900 text-lg font-medium title-font mb-5">
        Enter Skill:
      </h2>
      <select
        name="skill"
        class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"
        wtx-context="91ED4646-154F-4AAC-9691-10DA60D12F2A"
      >
        <% try { Session ses; Configuration cfg=new Configuration().configure();
        SessionFactory
        sf=cfg.addAnnotatedClass(Job.class).buildSessionFactory();
        ses=sf.getCurrentSession(); ses.beginTransaction(); Query
        q=ses.createQuery("from Job"); List lst=q.getResultList(); Job obj;
        for(int i=0;lst.size()>i;i++) { obj=(Job) lst.get(i); %>
        <option value="<%=obj.getSkill()%>"><%=obj.getSkill()%></option>
        <%} } catch(Exception ex) { out.println("Error : "+ex); } %></select
      ><br />
      <button
        class="text-white bg-indigo-500 border-0 py-2 px-8 focus:outline-none hover:bg-indigo-600 rounded text-lg"
        type="submit"
        value="search"
      >
        Search
      </button>
    </form>

</section>
    

    <% } else { response.sendRedirect("Failure.jsp?status=invalidsession"); } %>
  </body>
</html>