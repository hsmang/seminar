<%@include file="../head.jsp"%>
<%@include file="../nav.jsp"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<script>
$(function(){
	var order = getQuerystring("order");
	$("#role_view option[value=" + order + "]").attr('selected', 'selected');
})
</script>
<!-- Page Content -->
    <div class="container">

        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">会員登録仮完了
                </h1>
                <ol class="breadcrumb">
                    <li><a href="index.html">Home</a>
                    </li>
                    <li class="active">会員登録仮完了</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->

        <div class="row">

            <!-- Blog Entries Column -->
            <div class="col-md-8">
            	<c:if test="${type == 'join' }">
            	<h2>
            		管理者が確認しています。しばらくお待ちください。
            	</h2>
            	</c:if>
            	
            	
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
        <!-- /.row -->

        <hr>

<%@include file="../footer.jsp"%>
