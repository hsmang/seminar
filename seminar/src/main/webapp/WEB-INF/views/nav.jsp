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
                <a class="navbar-brand" href="/index.do">HOME</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="/introduce.do">教員紹介</a>
                    </li>
                    <li>
                        <a href="/qna.do">お問い合わせ</a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">授業資料 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="/seminar.do?pageNumber=1&pageSize=10">基礎ゼミ</a>
                            </li>
                            <li>
                                <a href="/businessAdmin.do?pageNumber=1&pageSize=10">経営学</a>
                            </li>
                            <li>
                                <a href="/businessStrategy.do?pageNumber=1&pageSize=10">経営戦略論</a>
                            </li>
                            <li>
                                <a href="/businessSystem.do?pageNumber=1&pageSize=10">事業システム論</a>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">ゼミナール紹介<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="/product.do">商品開発</a>
                            </li>
                            <li>
                                <a href="/contest.do?pageNumber=1&pageSize=6">ビジネスコンテスト</a>
                            </li>
                            <li>
                                <a href="/tour.do">観光事業関連</a>
                            </li>
                            <li>
                                <a href="/album.do?pageNumber=1&pageSize=12">アルバム</a>
                            </li>
                        </ul>
                    </li>
                    
                    <%
                    	if(user != null){%>
                    		
                    		<li>
                                <a href="/board.do?pageNumber=1&pageSize=10">メンバー専用</a>
                         </li>
                    		
                    		<%String user_name = user.getUser_name();
                    %>
                   		 <%if(user.getUser_role() == 0){ %>
                   		 <li>
                                <a href="/user/userList.do?order=all&pageNumber=1&pageSize=10">管理者ページ</a>
                         </li>
                            <%} %>
                            <li>
                    <!-- <div class="top-big-link"> -->
                            	<a class="modal_btn btn-link-1 loging" href="#" data-modal-id="modal-login"><%=user_name %>様</a>
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
