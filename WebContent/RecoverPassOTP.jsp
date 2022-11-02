<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>OTP Check</title>
<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet" />
</head>
<body>
<%
String status=request.getParameter("status");
if(status.equals("found"))
{
	

String uid=request.getParameter("uid");
String gp=request.getParameter("gp");
int genotp=Integer.parseInt(gp);
genotp=genotp-123456;
%>


<section class="text-gray-600 body-font">
  <form name="frm" method="post" action="RecoverPassOTPcheck.jsp">
  <div class="container px-5 py-24 mx-auto">
    <div class="flex flex-col text-center w-full mb-12">
      <h1 class="sm:text-3xl text-2xl font-medium title-font mb-4 text-gray-900">Enter OTP You Received On Your E-mail.</h1>
      
    </div>
    <div class="flex lg:w-2/3 w-full sm:flex-row flex-col mx-auto px-8 sm:space-x-4 sm:space-y-0 space-y-4 sm:px-0 items-end">
       
       
       <input type="hidden" name="uid" value="<%=uid%>">
         <input type="hidden" name="genotp" value="<%=genotp%>">   
      <div class="relative flex-grow w-full">
        <label for="ans" class="leading-7 text-sm text-gray-600">Enter OTP |<%=genotp%><br></label>
        <input type="text" id="ans" name="otp" class="w-full bg-gray-100 bg-opacity-50 rounded border border-gray-300 focus:border-indigo-500 focus:bg-transparent focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out" wtx-context="8212D7C6-477B-4C7F-980E-634CC33DA7E6">
   
      </div>
      
      
      <button class="text-white bg-indigo-500 border-0 py-2 px-8 focus:outline-none hover:bg-indigo-600 rounded text-lg" value="submit">Submit</button>
    
    </div>
    
  </div>
  </form>
</section>

<%
}
else
{
	%>You Have Entered Wrong Details...<br>
	<a href="index.jsp">Login</a>
	<% 
}
%>
</body>
</html>