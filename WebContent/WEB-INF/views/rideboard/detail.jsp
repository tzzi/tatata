<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<div class="w3-light-grey w3-padding-64 w3-margin-bottom w3-center">
  <h1 class="w3-jumbo">${rideboard.RIDE_NAME }</h1>
</div>

<div class="w3-row-padding w3-content" style="max-width:1400px">
  <div class="w3-twothird">
    <img src="${rideboard.IMAGE }" alt="Notebook" style="width:100%">
    <h2>Empty Notebook Found</h2>
    <div class="w3-justify">
  
    </div>
  </div>
  <div class="w3-third">
    <div class="w3-container w3-light-grey">
      <h2>조회수 :${rideboard.COUNT }</h2>
       <button type="button" id ="like" class="w3-button w3-black w3-theme-d1 w3-small  w3-margin-bottom"><i class="fa fa-thumbs-up"></i> Like</button> 
    </div>
    <br>
    <div class="w3-container w3-light-grey w3-justify">
      <h2>Very New News!</h2>
    </div>
    <br>
    <div class="w3-container w3-light-grey w3-justify">
      <h2>Very New News!</h2>
      <p class="w3-justify">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
    </div>
  </div>
</div>
</body>
</html>