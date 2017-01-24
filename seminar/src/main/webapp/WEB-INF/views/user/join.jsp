<%@include file="../head.jsp"%>
<%@include file="../nav.jsp"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!-- Page Content -->
    <div class="container">

        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Sign us
                    <small>회원가입</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="index.html">Home</a>
                    </li>
                    <li class="active">Sign us</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->

        <!-- Join Form -->
        <div class="row">
            <div class="col-md-8">
                <h3>Join Form</h3>
                <form name="sentMessage" action="/user/join_proc.do" id="joinForm" method="post" novalidate>
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Email Address :</label>
                            <input type="email" class="form-control" id="email" name="user_email" required data-validation-required-message="Please enter your email.">
                            <p class="help-block"></p>
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Password :</label>
                            <input type="password" class="form-control" id="password" name="user_pw" required data-validation-required-message="Please enter your password.">
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Again Password :</label>
                            <input type="password" class="form-control" id="password2" name="user_pw_2" required data-validation-required-message="Please enter your password.">
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Name :</label>
                            <input type="text" class="form-control" id="name" name="user_name" required data-validation-required-message="Please enter your email.">
                            <p class="help-block"></p>
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Student no :</label>
                            <input type="number" class="form-control" id="no" name="user_no" required data-validation-required-message="Please enter your student no.">
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>HP no :</label>
                            <input type="number" class="form-control" id="hp" name="user_hp" required data-validation-required-message="Please enter your hp number.">
                        </div>
                    </div>
                    <div id="success"></div>
                    <!-- For success/fail messages -->
                    <button type="submit" class="btn btn-primary">Join</button>
                </form>
            </div>

        </div>
	</div>
<%@include file="../footer.jsp"%>