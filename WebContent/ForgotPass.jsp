<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Recover Password</title>
<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet" />
<style type="text/css">

.pr-8 {
    padding-right: 2rem;
    margin-right: 19rem;
}

</style>
</head>
<body>
<section class="text-gray-600 body-font">
  <form action="RecoverPass" method="post">
  <div class="container px-5 py-24 mx-auto">
    <div class="flex flex-col text-center w-full mb-12">
      <h1 class="sm:text-3xl text-2xl font-medium title-font mb-4 text-gray-900">Enter Asked Details</h1>
      
    </div>
    <div class="flex lg:w-2/3 w-full sm:flex-row flex-col mx-auto px-8 sm:space-x-4 sm:space-y-0 space-y-4 sm:px-0 items-end">
       
       
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
      <div class="relative flex-grow w-full">
        <label for="ans" class="leading-7 text-sm text-gray-600">Answer</label>
        <input type="text" id="ans" name="ans" class="w-full bg-gray-100 bg-opacity-50 rounded border border-gray-300 focus:border-indigo-500 focus:bg-transparent focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out" wtx-context="8212D7C6-477B-4C7F-980E-634CC33DA7E6">
      </div>
      
      <div class="relative flex-grow w-full">
        <label for="ans" class="leading-7 text-sm text-gray-600">UserID</label>
        <input type="text" id="usid" name="usrid" class="w-full bg-gray-100 bg-opacity-50 rounded border border-gray-300 focus:border-indigo-500 focus:bg-transparent focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out" wtx-context="8212D7C6-477B-4C7F-980E-634CC33DA7E6">
      </div>
      <button class="text-white bg-indigo-500 border-0 py-2 px-8 focus:outline-none hover:bg-indigo-600 rounded text-lg" value="submit">Submit</button>
    
    </div>
    
  </div>
  </form>
</section>
</body>
</html>