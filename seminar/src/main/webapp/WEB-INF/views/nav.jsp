<%@page import="jp.seminar.user.model.UserVO"%>
<body>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
	UserVO user = (UserVO)session.getAttribute("user");
	
%>
    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/index.do">메인페이지로</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="/introduce.do">교수 소개</a>
                    </li>
                    <li>
                        <a href="/qna.do">문의사항</a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">수업 자료용 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="/seminar.do?pageNumber=1&pageSize=10">기초세미나</a>
                            </li>
                            <li>
                                <a href="/businessadmin.do">경영학</a>
                            </li>
                            <li>
                                <a href="/businessstrategy.do">경영전략론</a>
                            </li>
                            <li>
                                <a href="/businesssystem.do">사업시스템론</a>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">세미나 자료용<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="/productdev.do">상품개발</a>
                            </li>
                            <li>
                                <a href="/businesscontest.do">비지니스 컨테스트</a>
                            </li>
                            <li>
                                <a href="/tourbusiness.do">관광사업</a>
                            </li>
                            <li>
                                <a href="/album.do">앨범</a>
                            </li>
                        </ul>
                    </li>
                    
                    <%
                    	if(user != null){
                    		String user_name = user.getUser_name();
                    %>
                   		 <%if(user.getUser_role() == 0){ %>
                   		 <li>
                                <a href="/user/userList.do?order=all&pageNumber=1&pageSize=10">Members</a>
                         </li>
                            <%} %>
                            <li>
                    <!-- <div class="top-big-link"> -->
                            	<a class="modal_btn btn-link-1 loging" href="#" data-modal-id="modal-login"><%=user_name %>님 환영합니다 !</a>
                            <!-- </div> -->
                            </li>
                            <li>
                    <a href="/user/logout.do">Logout</a>
                    </li>      
                    
                    <%}else { %>
                    <li>
                    <div class="top-big-link">
                            	<a class="modal_btn btn-link-1 launch-modal" href="#" data-modal-id="modal-login">Sign in</a>
                            </div>
                            </li>        
                    <%} %>
                    
                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    <!-- MODAL -->
        <div class="modal fade" id="modal-login" tabindex="-1" role="dialog" aria-labelledby="modal-login-label" aria-hidden="true">
        	<div class="modal-dialog">
        		<div class="modal-content">
        			
        			<div class="modal-header">
        				<button type="button" class="close" data-dismiss="modal">
        					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
        				</button>
        				<h3 class="modal-title" id="modal-login-label">Login to our site</h3>
        				<p>Enter your email and password to log on:</p>
        			</div>
        			
        			<div class="modal-body">
        				
	                    <form role="form" action="/user/login_proc.do" method="post" class="login-form">
	                    	<div class="form-group">
	                    		<label class="sr-only" for="form-username">Email</label>
	                        	<input type="text" name="user_email" placeholder="Username..." class="form-username form-control" id="form-username">
	                        </div>
	                        <div class="form-group">
	                        	<label class="sr-only" for="form-password">Password</label>
	                        	<input type="password" name="user_pw" placeholder="Password..." class="form-password form-control" id="form-password">
	                        </div>
	                        <button type="submit" class="modal_btn">Sign in!</button>
	                    </form>
	                    <br>
	                    <button type="button" id="join_btn" class="modal_btn">Join !</button>
        			</div>
        			
        		</div>
        	</div>
        </div>
