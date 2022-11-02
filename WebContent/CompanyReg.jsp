<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Company Register</title>
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet" />

    <style>
        .py-24 {
            padding-top: 2rem;
        }
        
        .p-8 {
            padding: 3rem;
        }
    </style>

    <script>
        
    function createRequestObject() {
        var tmpXmlHttpObject;
        if (window.XMLHttpRequest) {
                tmpXmlHttpObject = new XMLHttpRequest();
        } else if (window.ActiveXObject) {
            tmpXmlHttpObject = new ActiveXObject("Microsoft.XMLHTTP");
        }

        return tmpXmlHttpObject;
    }


    var http = createRequestObject();

    function makeGetRequest() {
        email=document.frm.email.value;
        http.open('get', 'RegOtp.jsp?email=' + email);
        http.onreadystatechange = processResponse;
        http.send(null);
    }

    function processResponse() {
        if(http.readyState == 4){
            var response = http.responseText;
            document.getElementById('genstat').innerHTML = response;
        }
    }

    var http1 = createRequestObject();

    function makeGetRequest1() {
        userid=document.frm.userid.value;
        http1.open('get', 'usidemailcheck.jsp?userid=' + userid);
        http1.onreadystatechange = processResponse1;
        http1.send(null);
    }

    function processResponse1() {
        if(http1.readyState == 4){
            var response1 = http1.responseText;
            document.getElementById('usidstat').innerHTML = response1;
        }
    }

    var http2 = createRequestObject();

    function makeGetRequest2() {
        email=document.frm.email.value;
        http2.open('get', 'UsridEmailcheck.jsp?email='+email);
        http2.onreadystatechange = processResponse2;
        http2.send(null);
    }

    function processResponse2() {
        if(http2.readyState == 4){
            var response2 = http2.responseText;
            document.getElementById('emailstat').innerHTML = response2;
        }
    }  
    
    
    
    
    
    
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
            document.getElementById("usid").value = makeid(5);
        };

        function verifypassword() {
            pw = document.frm.pswd.value;
            cpw = document.frm.cnfpswd.value;
            if (pw != cpw) {
                alert("Password doesn't match..");
                return false;
            } else {
                return true;
            }
        }
    </script>
</head>

<body>
    <section class="text-gray-600 body-font">
        <div class="container px-5 py-24 mx-auto flex flex-wrap items-center">
            <div class="lg:w-3/5 md:w-1/2 md:pr-16 lg:pr-0 pr-0">
                <h1 class="title-font font-medium text-3xl text-gray-900">
                    You are Registering yourself as a company.
                </h1>
                <p class="leading-relaxed mt-4">
                    After Registering you will be able to create jobs,thank you for choosing our platform.
                </p>
            </div>
            <div class="lg:w-2/6 md:w-1/2 bg-gray-100 rounded-lg p-8 flex flex-col md:ml-auto w-full mt-10 md:mt-0">
                <h2 class="text-gray-900 text-lg font-medium title-font mb-5">
                    Sign Up
                </h2>
                <form action="Register" method="post" name="frm" onsubmit=" return verifypassword()">
                    <div class="relative mb-4">
                        <label for="usrid" class="leading-7 text-sm text-gray-600">Name</label
              >
              <input
                type="text"
                id="full-name"
                name="name"
                class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"
                wtx-context="A322B8F5-708E-4B4D-8B05-C84F3FD63B25"
              />
            </div>

            <div class="relative mb-4">
              <label for="pswd" class="leading-7 text-sm text-gray-600"
                >Generated Userid</label
              >
              <div id="usidstat"></div><br>
              <input
                type="text"
                name="usrid"
                class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"
                wtx-context="985B581A-B3E9-4D66-84F8-AE12708F571F"
                id="usid"
                readonly
                required
              />
            </div>

            <div class="relative mb-4">
              <label for="email" class="leading-7 text-sm text-gray-600"
                >Enter E-mail</label
              >
              <input
                type="email"
                id="email1"
                name="email"
                class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"
                wtx-context="985B581A-B3E9-4D66-84F8-AE12708F571F"
              />
              <div id="emailstat"></div><br>
            </div>

            <div class="relative mb-4">
              <label for="email" class="leading-7 text-sm text-gray-600"
                >Create Password</label
              >
              <input
                type="password"
                id="pass1"
                name="pswd"
                class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"
                wtx-context="985B581A-B3E9-4D66-84F8-AE12708F571F"
              />
            </div>

            <div class="relative mb-4">
              <label for="email" class="leading-7 text-sm text-gray-600"
                >Confirm Password</label
              >
              <input
                type="password"
                id="pass2"
                name="cnfpswd"
                class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"
                wtx-context="985B581A-B3E9-4D66-84F8-AE12708F571F"
              />
            </div>
            <div>
              <select
                class="block appearance-none w-full bg-gray-200 border border-gray-200 text-gray-700 py-3 px-4 pr-8 rounded leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
                name="que"
              >
                <option>Select Question</option>
                <option value="Your Favourite color?">
                  Your Favourite color?
                </option>
                <option value="What primary school did you attend?">
                  What primary school did you attend?
                </option>
                <option
                  value="What is your grandmother's (on your mother's side) name?"
                >
                  What is your grandmother's (on your mother's side) name?
                </option>
                <option value="What was your childhood nickname?">
                  What was your childhood nickname?
                </option>
              </select>
            </div>
            <br />

            <div class="relative mb-4">
              <label for="ans" class="leading-7 text-sm text-gray-600"
                >Enter Answer</label
              >
              <input
                type="text"
                id="ans"
                name="ans"
                class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"
                wtx-context="985B581A-B3E9-4D66-84F8-AE12708F571F"
              />
            </div>

            <input type="hidden" name="type" value="Company" />
Enter OTP  <input type="text" name="otp"><br>
<div id="genstat"></div><br>
            <button
              class="text-white bg-indigo-500 border-0 py-2 px-8 focus:outline-none hover:bg-indigo-600 rounded text-lg"
              input
              type="submit"
            >
              Submit
            </button>
          </form>
          <button type="button" onclick="makeGetRequest()">Generate OTP</button>
        </div>
      </div>
    </section>
  </body>
</html>