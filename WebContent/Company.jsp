<%@page import="entitybeans.JobApplied"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="java.util.List"%>
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
        <title>Company</title>
        <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet" />

        <script>
            function makeid(length) {
                var result = [];
                var characters =
                    "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                var charactersLength = characters.length;
                for (var i = 0; i < length; i++) {
                    result.push(
                        characters.charAt(Math.floor(Math.random() * charactersLength))
                    );
                }
                return result.join("");
            }

            window.onload = function() {
                document.getElementById("jobid").value = makeid(5);

                var today = new Date();

                var date =
                    today.getFullYear() +
                    "-" +
                    (today.getMonth() + 1) +
                    "-" +
                    today.getDate();

                var time =
                    today.getHours() +
                    ":" +
                    today.getMinutes() +
                    ":" +
                    today.getSeconds();

                var dateTime = date + " " + time;

                var dateControl = document.querySelector(
                    'input[type="datetime-local"]'
                );
                dateControl.value = console.log(dateTime);
            };
        </script>
        <style type="text/css">
        .py-24 {
    padding-top: 6rem;
    padding-bottom: 2rem;
}
        #table{
        
        
        margin-left: 0rem;
    text-align: center;
    background: #d0d0d0;
    box-sizing: content-box;
    justify-content: stretch;
    padding-left: 13rem;
    padding-bottom: 3rem;
    padding-top: 2rem;
        }
        
        #tabline{
        font-size: 2em;
    text-align: center;
    padding-right: 47rem;
}
        
        }
        
        </style>
    </head>

    <body>
        <!-- session implementation -->
        <% if(session.getAttribute("userid") != null) { String
    userid=String.valueOf(session.getAttribute("userid")); %>

            <!-- header containing logout and home -->

            <header class="text-gray-600 body-font">
                <div class="container mx-auto flex flex-wrap p-5 flex-col md:flex-row items-center">
                    <a class="flex title-font font-medium items-center text-gray-900 mb-4 md:mb-0">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-10 h-10 text-white p-2 bg-indigo-500 rounded-full" viewBox="0 0 24 24">
            <path
              d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"
            ></path>
          </svg>
                        <span class="ml-3 text-xl">LinkIndia | UserID: <%=session.getAttribute("userid") %>
          </span>
                    </a>
                    <nav class="md:ml-auto flex flex-wrap items-center text-base justify-center">
                        
                        <a class="mr-5 hover:text-gray-900" href="Change_CO.jsp">Change Password</a>
                    </nav>
                    <button class="inline-flex items-center bg-gray-100 border-0 py-1 px-3 focus:outline-none hover:bg-gray-200 rounded text-base mt-4 md:mt-0">
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

            <!-- body of add Job -->

            <section class="text-gray-600 body-font">
                <div class="container px-5 py-24 mx-auto flex flex-wrap items-center">
                    <div class="lg:w-3/5 md:w-1/2 md:pr-16 lg:pr-0 pr-0">
                        <h1 class="title-font font-medium text-3xl text-gray-900">
                            Create a New Job.
                        </h1>
                        <p class="leading-relaxed mt-4">
                            Create Opportunities For Job Seekers, And Get The Best Fit Person for Your Job.
                        </p>
                    </div>
                    <div class="lg:w-2/6 md:w-1/2 bg-gray-100 rounded-lg p-8 flex flex-col md:ml-auto w-full mt-10 md:mt-0">
                        <h2 class="text-gray-900 text-lg font-medium title-font mb-5">
                            Enter Details
                        </h2>
                        <form action="AddJob_CO" method="post">
                            <div class="relative mb-4">
                                <label for="full-name" class="leading-7 text-sm text-gray-600">Skill</label
              >
              <input
                type="text"
                id="skill"
                name="skill"
                class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"
                wtx-context="0734DD42-865C-4FE6-82CA-3179C176C88A"
              />
            </div>
            <div class="relative mb-4">
              <label for="email" class="leading-7 text-sm text-gray-600"
                >Location</label
              >
              <input
                type="text"
                id="loc"
                name="loc"
                class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"
                wtx-context="C75AC32B-3060-4772-8256-6D02C4D6D7D0"
              />
            </div>

            <div class="relative mb-4">
              <label for="email" class="leading-7 text-sm text-gray-600"
                >Annual Package</label
              >
              <input
                type="text"
                id="pack"
                name="pa"
                class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"
                wtx-context="C75AC32B-3060-4772-8256-6D02C4D6D7D0"
              />
            </div>

            <input id="party" type="datetime-local" name="date" hidden />
            <input type="text" name="usrid" hidden
            value="<%=session.getAttribute("userid") %>>" />
            <input type="text" name="jobid" id="jobid" hidden />

            <button
              class="text-white bg-indigo-500 border-0 py-2 px-8 focus:outline-none hover:bg-indigo-600 rounded text-lg"
              value="submit"
            >
              Submit
            </button>
          </form>
        </div>
      </div>
    </section>
  
  <h1 id="tabline"> Created Jobs :</h1>
  <section id="table">
    
    <table border="1" width="50%" style="text-align:center" class="table-auto">
<thead>
<tr>
<th >JobID</th>
<th>Issue Date</th>
<th>Skill</th>
<th>Location</th>
<th>Package Per Anum</th>
<th>Action</th>
</tr>
</thead>
<%
try
{
	Session ses;
	Configuration cfg=new Configuration().configure();
	SessionFactory sf=cfg.addAnnotatedClass(Job.class).buildSessionFactory();
	ses=sf.getCurrentSession();
	ses.beginTransaction();

	Query q=ses.createQuery("from Job where companyuserid=:id");
	q.setParameter("id",userid);
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
			<td><%=obj.getSkill() %></td>
			<td><%=obj.getLocation() %></td>
			<td><%=obj.getPacperanum() %></td>
			<td>
			<%
			if(obj.getAvailablestat().equals("yes"))
			{
				%>
				<a href="Modify_CO.jsp?jobid=<%=obj.getJobid()%>">Modify</a>
				
				
				<a href="Delete_CO.jsp?jobid=<%=obj.getJobid()%>">Delete</a>
				<%
			}
			else
			{
			%>Job Deleted<%
			}
			%>
			</td>
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
    
    
    <% } else { response.sendRedirect("Failure.jsp?status=invalidsession"); } %>
  </body>
</html>