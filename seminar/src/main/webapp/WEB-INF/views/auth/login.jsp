<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<title>로그인 페이지</title>
		<link rel="stylesheet" type="text/css" href="https://static.navercorp.com/static/site/nss/css/sso_login.css?20160704">
		<link rel="stylesheet" href='<c:url value="./resources/se2/css/login/login.css"/>'/>
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
	
	<body>
		<input type="hidden" id="_uiMode" value=""/> 
		<span id="spnValue" style="display: none"></span>
		<div id="wrap">
			<div class="heading"></div>
			<div class="container">
				<div class="content">
					<h1 class="p_logo">
						HELLO, SEMINAR
					</h1>
					<h1 class="t_logo">
						<!-- <img src="https://static.navercorp.com/static/site/nss/img/t_logo.gif" width="263" height="45" alt="CONNECT"> -->
						HELLO, SEMINAR
					</h1>
					<h1 class="m_logo">
						<!-- <img src="https://static.navercorp.com/static/site/nss/img/m_logo.gif" width="183" height="31" alt="CONNECT"> -->
						HELLO, SEMINAR
					</h1>
					<fieldset>
						<section class="loginform cf">
							<form name="frm" action="/user/login_proc.do" method="post">
								<legend class="blind">Login Information</legend>
								<p c lass="error_noti" style="display: block"></p>
								<div class="inp_area">
									<div class="inp_txt">
										<input type="text" placeholder="ID" id="userID" name="user_email" style="ime-mode: disabled;" tabindex="2" required /> 
										<a href="javascript:;" class="txt_clear" style="cursor: hand;">
											<span class="blind"></span>
										</a>
									</div>
									<div class="inp_txt">
										<input type="password" placeholder="PASSWORD" id="password" name="user_pw" tabindex="2" required>
										<a href="javascript:;" class="txt_clear" style="cursor: hand;"><span class="blind"></span></a>
									</div>
								</div>
								<p id="capslock" style="position: absolute; background-color: #595959;; width: 100%; height: 20px; display: none">
									&nbsp;&nbsp;&nbsp;<font style="color: white; font-weight: bold;">Keyboard</font>
									<font style="color: yellow; font-weight: bold;">[ CapsLock ] </font>
									<font style="color: white; font-weight: bold;"> is on</font>
								</p>
								<div class="btn_area">
									<input type="submit" value="로그인" onclick="doLogin()"/>
									<!-- <a href="javascript:;" onclick="doLogin();" tabindex="3">LOG IN</a> -->
								</div>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							</form>
						</section>
					</fieldset>
				</div>
			</div>
		</div>
		<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if>
	</body>
</html>