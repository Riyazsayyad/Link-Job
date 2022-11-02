<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1" http-equiv="refresh" content="2;url=Company.jsp">
<title>Redirecting...</title>
<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet" />
</head>
<body>
<%
String status=request.getParameter("status");
if(status.equals("pass"))
{
	%><h1 class="title-font font-medium text-3xl text-gray-900" text-align="center">
                            Job Added
                        </h1><%
}
else if(status.equals("del"))
{
	%><h1 class="title-font font-medium text-3xl text-gray-900" text-align="center">
                            Job Deleted
                        </h1><%
}
else if(status.equals("invalidsession"))
{
	%>Invalid Session Please Login<br><a href="index.jsp">Landing Page</a><%
}

else if(status.equals("pass1"))
{
	%><h1 class="title-font font-medium text-3xl text-gray-900" text-align="center">
                            Pass Reseted
                        </h1><%
}

else if(status.equals("fail1"))
{
	%><h1 class="title-font font-medium text-3xl text-gray-900" text-align="center">
                           Something  Went Wrong
                        </h1><%
}


%>
</body>
</html>