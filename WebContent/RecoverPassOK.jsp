<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Processing...</title>
<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet" />
</head>
<body>
<%
String status = request.getParameter("status");
if(status.equals("pass"))
{
	%><h1 class="sm:text-3xl text-2xl font-medium title-font mb-4 text-gray-900">Password Changed Successfully.</h1><%
	
}else
{
	%><h1 class="sm:text-3xl text-2xl font-medium title-font mb-4 text-gray-900">Their is Something Wrong Please Try Again.</h1><%
}
%>
<a href="index.jsp">Landing Page</a>
</body>
</html>