<%@page import="mybeans.GenerateOTP"%>
<%@page import="mybeans.SendEmail"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try{
String email = request.getParameter("email");
char[] s= GenerateOTP.generateOTP(6);
String otp=String.valueOf(s);
SendEmail eml= new SendEmail("Linked Consultant","Verify Email","OTP is "+otp,email);
%>

<input type="hidden" name="oriotp" value="<%=otp%>">
otp has been succesfully send to <%=email %><%=otp %>
<%
}
catch(Exception e)
{
System.out.println(e);
}
%>
</body>
</html>