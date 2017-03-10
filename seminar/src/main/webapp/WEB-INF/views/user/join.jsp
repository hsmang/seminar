<%@include file="../head.jsp"%>
<%@include file="../nav.jsp"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<script src="/resources/js/jqBootstrapValidation.js"></script>
<script>
$(document).ready(function(){
	
	$("#joinForm input,#joinForm textarea").jqBootstrapValidation({
        preventSubmit: true,
        submitError: function($form, event, errors) {
            // something to have when submit produces an error ?
            // Not decided if I need it yet
        },
        submitSuccess: function($form, event) {
            event.preventDefault(); // prevent default submit behaviour
            // get values from FORM
            var name = $("input#name").val();
            var phone = $("input#phone").val();
            var email = $("input#email").val();
            var message = $("textarea#message").val();
            var firstName = name; // For Success/Failure Message
            // Check for white space in name for Success/Fail message
            if (firstName.indexOf(' ') >= 0) {
                firstName = name.split(' ').slice(0, -1).join(' ');
            }
            var param = $('#joinForm').serialize();
            $.ajax({
                url: "/user/join_proc.do",
                type: "POST",
                data: param,
                cache: false,
                success: function(result) {
                	if(result.result){
                		location.href="/user/login.do?type=join";
                	}else{
                		$('#success').html("<div class='alert alert-danger'>");
                        $('#success > .alert-danger').html("<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
                            .append("</button>");
                        $('#success > .alert-danger')
                            .append("<strong>Your email already used. </strong>");
                        $('#success > .alert-danger')
                            .append('</div>');
                        $('input#email').trigger("reset");
                	}
                    /* // Success message
                    $('#success').html("<div class='alert alert-success'>");
                    $('#success > .alert-success').html("<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
                        .append("</button>");
                    $('#success > .alert-success')
                        .append("<strong>Your message has been sent. </strong>");
                    $('#success > .alert-success')
                        .append('</div>'); */

                    //clear all fields
                    
                },
                error: function() {
                    // Fail message
                    $('#success').html("<div class='alert alert-danger'>");
                    $('#success > .alert-danger').html("<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
                        .append("</button>");
                    $('#success > .alert-danger').append("<strong>Sorry " + firstName + " it seems that my mail server is not responding...</strong> Could you please email me directly to <a href='mailto:me@example.com?Subject=Message_Me from myprogrammingblog.com;>me@example.com</a> ? Sorry for the inconvenience!");
                    $('#success > .alert-danger').append('</div>');
                    //clear all fields
                    $('#contactForm').trigger("reset");
                },
            })
        },
        filter: function() {
            return $(this).is(":visible");
        },
    });
	
	
})



</script>
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
                <form name="sentMessage" id="joinForm" novalidate>
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
                            <input type="password" class="form-control" id="password" name="user_pw" required minlength="4" maxlength="16" data-validation-required-message="Please enter your password.">
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Again Password :</label>
                            <input type="password" class="form-control" id="password2" name="user_pw_2" required minlength="4" maxlength="16" data-validation-matches-match="user_pw" data-validation-required-message="Please enter your password.">
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Name :</label>
                            <input type="text" class="form-control" id="name" name="user_name" required data-validation-required-message="Please enter your name.">
                            <p class="help-block"></p>
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Student no :</label>
                            <input type="text" class="form-control" id="no" name="user_no" required data-validation-required-message="Please enter your student no.">
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Phone no :</label>
                            <input type="number" class="form-control" id="hp" name="user_hp" required data-validation-required-message="Please enter your phone number.">
                        </div>
                    </div>
                    <div id="success"></div>
                    <!-- For success/fail messages -->
                    <button type="submit" id="joinButton" class="btn btn-primary">Join</button>
                </form>
            </div>

        </div>
	</div>
<%@include file="../footer.jsp"%>
