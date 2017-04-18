<%@include file="head.jsp"%>
<%@include file="nav.jsp"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '1314406451979529',
      xfbml      : true,
      version    : 'v2.8'
    });
    FB.AppEvents.logPageView();
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
</script>
<script>
$(function(){
	$("#contactForm input,#contactForm textarea").jqBootstrapValidation({
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
            var param = $('#contactForm').serialize();
            $.ajax({
                url: "/qna/insert.do",
                type: "POST",
                data: param,
                cache: false,
                success: function(result) {
                    // Success message
                    $('#success').html("<div class='alert alert-success'>");
                    $('#success > .alert-success').html("<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
                        .append("</button>");
                    $('#success > .alert-success')
                        .append("<strong>Your message has been sent. </strong>");
                    $('#success > .alert-success')
                        .append('</div>'); 

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
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.8&appId=1314406451979529";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<!-- Header Carousel -->
<div class="container">
    <header id="myCarousel" class="carousel slide">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <div class="item active">
                <!-- <div class="fill" style="background-image:url('/resources/wordcloud_demo.jpg');"></div> -->
                <div class="fill"><img class="img-responsives" src="/resources/img/book.png" style="width:100%;"> 
                <!-- style="background-image:url('/resources/img/book.png');"> --></div>
                <div class="carousel-caption">
                    <!-- <h2>Caption 1</h2> -->
                </div>
            </div>
            <div class="item">
                <div class="fill"><img class="img-responsive" src="/resources/img/member.jpg" style="width:100%;"></div>
                <div class="carousel-caption">
                </div>
            </div>
            <div class="item">
                <div class="fill"><img class="img-responsive" src="/resources/img/member2.jpg" style="width:100%;"></div>
                <div class="carousel-caption">
                </div>
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="icon-prev"></span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="icon-next"></span>
        </a>
    </header>
</div>
    <!-- Page Content -->
    <div class="container">

        <!-- Marketing Icons Section -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    金泰旭ゼミナールへようこそ！
                </h1>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i> Tweet</h4>
                    </div>
                    <div class="panel-body">
            <a class="twitter-timeline" href="https://twitter.com/kindaikimzemi"
		data-width="100%" data-height="500px">Tweets by @kindaikimzemi</a>
	<!--	<a class="twitter-timeline" href="https://twitter.com/kimzemi833">Tweets by @kimzemi833</a>-->
	<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i> FaceBook</h4>
                    </div>
                    <div class="panel-body">
            <div class="fb-page" data-href="https://www.facebook.com/kindaibusiness" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><blockquote cite="https://www.facebook.com/kindaibusiness" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/kindaibusiness">Kindaibusinesskim</a></blockquote></div>
                    </div>
                </div>
            </div>
            <!-- </div>
            <div class="row"> -->
            
            <div class="col-md-4">
            	<div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i> News</h4>
                    </div>
                    <div class="panel-body">
            <table class="table table-hover table-responsive">
					<thead>
						<tr>
							<th style="width:100%">基礎ゼミ</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${fn:length(seminarList) > 0}">
								<c:forEach items="${seminarList }" var="list">
									<tr>
										<td><a href="/seminar/detail.do?board_idx=${list.board_idx }&f_type=SE" id="subject">${list.board_subject }</a></td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</tbody>
				</table>
				<table class="table table-hover table-responsive">
					<thead>
						<tr>
							<th style="width:100%">経営学</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${fn:length(adminList) > 0}">
								<c:forEach items="${adminList }" var="list">
									<tr>
										<td><a href="/businessAdmin/detail.do?board_idx=${list.board_idx }&f_type=AD" id="subject">${list.board_subject }</a></td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</tbody>
				</table>
				<table class="table table-hover table-responsive">
					<thead>
						<tr>
							<th style="width:100%">経営戦略論</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${fn:length(strategyList) > 0}">
								<c:forEach items="${strategyList }" var="list">
									<tr>
										<td><a href="/businessStrategy/detail.do?board_idx=${list.board_idx }&f_type=ST" id="subject">${list.board_subject }</a></td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</tbody>
				</table>
				<table class="table table-hover table-responsive">
					<thead>
						<tr>
							<th style="width:100%">事業システム論</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${fn:length(systemList) > 0}">
								<c:forEach items="${systemList }" var="list">
									<tr>
										<td><a href="/businessSystem/detail.do?board_idx=${list.board_idx }&f_type=SY" id="subject">${list.board_subject }</a></td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</tbody>
				</table>
                    </div>
                </div>
                
            </div>
        </div>
        <!-- /.row -->

        <!-- Portfolio Section -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">PHOTO</h2>
            </div>
           	<div class="col-md-4 col-sm-6">
                <a href="/product/detail.do?board_idx=${product.board_idx }&f_type=PR">
                    <img class="img-responsive img-portfolio img-hover w36h27_main_img" src="${product.main_img }" alt="">
                </a>
                <h3 class="text_overflow">${product.board_subject }</h3>
           	</div>	
            
            <div class="col-md-4 col-sm-6">
                <a href="/contest/detail.do?board_idx=${contest.board_idx }&f_type=CO">
                    <img class="img-responsive img-portfolio img-hover w36h27_main_img" src="${contest.main_img }" alt="">
                </a>
                <h3 class="text_overflow">${contest.board_subject }</h3>
            </div>
            <div class="col-md-4 col-sm-6">
                <a href="/album/detail.do?board_idx=${album.board_idx }&f_type=AL">
                    <img class="img-responsive img-portfolio img-hover w36h27_main_img" src="${album.main_img }" alt="">
                </a>
                <h3 class="text_overflow">${album.board_subject }</h3>
            </div>
        </div>
        <!-- /.row -->
		<hr>
        <!-- Content Row -->
        <div class="row">
        	<div class="col-lg-12">
                <h2 class="page-header">Contact</h2>
            </div>
            <!-- Map Column -->
            <div class="col-md-8">
                <!-- Embedded Google Map -->
                <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d6564.228538830766!2d135.588737!3d34.651817!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x222f1e658e84c664!2sKindai+University!5e0!3m2!1sen!2sus!4v1485276131512" width="100%" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
            </div>
            <!-- Contact Details Column -->
            <div class="col-md-4">
                <h3>Contact Details</h3>
                <p>
                    〒577-8502 大阪府東大阪市小若江3-4-1<br>
                </p>
                <p><i class="fa fa-phone"></i> 
                    <abbr title="Phone">P</abbr>: (06)6721-2332</p>
                <p><i class="fa fa-envelope-o"></i> 
                    <abbr title="Email">E</abbr>: <a href="mailto:kindaibusinesskim@gmail.com">kindaibusinesskim@gmail.com</a>
                </p>
                <p><i class="fa fa-clock-o"></i> 
                    <abbr title="Hours">H</abbr>: 月曜日　13：00 ~ 14：40分</p>
                <ul class="list-unstyled list-inline list-social-icons">
                    <li>
                        <a href="http://facebook.com/kindaibusinesskim"><i class="fa fa-facebook-square fa-2x"></i></a>
                    </li>
                    <li>
                        <a href="https://twitter.com/kindaikimzemi"><i class="fa fa-twitter-square fa-2x"></i></a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- /.row -->

        <hr>
<%@include file="footer.jsp"%>
