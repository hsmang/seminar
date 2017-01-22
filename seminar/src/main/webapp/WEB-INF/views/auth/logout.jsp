<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>마리나 로그인 페이지</title>
	
	<link rel="stylesheet" href="../..//resources/css/login.css">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<script type="text/javascript"> 
		function doLogin() {
			if(frm.j_username.value == "") {
				alert("아이디를 입력해주세요.");
				return;
			}
			if(frm.j_password.value == "") {
				alert("패스워드를 입력해주세요.");
				return;
			}
			
			frm.submit();
		}
		
	</script>	
</head>
<body ng-controller="moniteringCtrl"  class="pad">



	<c:url value="/logout" var="logoutUrl" />

 

	<!-- csrt for log out-->

	<form action="${logoutUrl}" method="post" id="logoutForm">

	  <input type="hidden" 

		name="${_csrf.parameterName}"

		value="${_csrf.token}" />

	</form>

 

 	<script>

		function formSubmit() {

			document.getElementById("logoutForm").submit();

		}

	</script>
	
	<form class="navbar-form navbar-right" >

       	     <span style="color: gray;" ><h5> ${username} 님 반갑습니다. 

                                <a href = "javascript:formSubmit()"> 로그아웃 </a> </h5></span>

   	  </form>

   
</body>
</html>