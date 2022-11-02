<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet" />
<title>Reset Pass</title>
<script language="Javascript" type="text/javascript">
function verifypassword() {
	 pw = document.frm.newpswd.value;
	 cpw = document.frm.cnfnewpswd.value; 
	 if (pw != cpw) {
		 
		 alert("Password doesn't match..");
			return false;
	}
	 else{
		 return true;
	}
}

</script>
</head>
<body>
<%
if(session.getAttribute("userid") != null)
{
   
%>




<section class="text-gray-600 body-font">
<form name="frm" method="post" action="ResetPass_CO" onsubmit="return verifypassword()">
                <div class="container px-5 py-24 mx-auto flex flex-wrap items-center">
                    <div class="lg:w-3/5 md:w-1/2 md:pr-16 lg:pr-0 pr-0">
                        <h1 class="title-font font-medium text-3xl text-gray-900">
                            Reset Password
                        </h1>
                        
                    </div>
                    <div class="lg:w-2/6 md:w-1/2 bg-gray-100 rounded-lg p-8 flex flex-col md:ml-auto w-full mt-10 md:mt-0">
                        <h2 class="text-gray-900 text-lg font-medium title-font mb-5">
                            Enter Details
                        </h2>
                        <form method="post" action="ModifyJob_CO">
                        
                        
                            <div class="relative mb-4">
                                <label for="full-name" class="leading-7 text-sm text-gray-600">Current Password</label
              >
              <input
                type="password"
                id="skill"
                name="currpass"
                class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"
                wtx-context="0734DD42-865C-4FE6-82CA-3179C176C88A" required
              />
            </div>
            <div class="relative mb-4">
              <label for="email" class="leading-7 text-sm text-gray-600"
                >New Password</label
              >
              <input
                type="password"
                id="loc"
                name="newpswd"
                class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"
                wtx-context="C75AC32B-3060-4772-8256-6D02C4D6D7D0" required
              />
            </div>

            <div class="relative mb-4">
              <label for="email" class="leading-7 text-sm text-gray-600"
                >Confirm Password </label
              >
              <input
                type="password"
                id="pack"
                name="cnfnewpswd"
                class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"
                wtx-context="C75AC32B-3060-4772-8256-6D02C4D6D7D0" required
              />
            </div>

            
            <button
              class="text-white bg-indigo-500 border-0 py-2 px-8 focus:outline-none hover:bg-indigo-600 rounded text-lg"
              value="submit"
            >
              Submit
            </button>
          
        </div>
      </div>
      </form>
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