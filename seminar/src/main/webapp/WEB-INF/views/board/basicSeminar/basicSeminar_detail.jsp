<%@include file="../../head.jsp"%>
<%@include file="../../nav.jsp"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<div class="container">
	<!-- Page Heading/Breadcrumbs -->
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				Basic Seminar <small>Subheading</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="index.html">Home</a></li>
				<li class="active">Basic Seminar</li>
			</ol>
		</div>
	</div>


	<div class="row">
		<div class="col-lg-12">
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list }" var="detail">
						<input type="hidden" id="board_idx" value="${detail.board_idx }">
						<hr>
						<h3>${detail.board_subject }</h3>
							<!-- Date/Time -->
						<p><i class="fa fa-clock-o"></i> Posted on ${detail.board_reg_date }  ///////  ${detail.user_name }</p>
						<hr>
						<a href="#">첨부파일_추가.jpg</a>
						<hr>
						<p>${detail.board_content }</p>
						<hr>
					</c:forEach>
				</c:when>
			</c:choose>
				<button type="button" class="btn btn-default" onclick="location.href='/seminar/update.do?board_idx=${detail.board_idx}'">수정</button>
				<button type="button" class="btn btn-default" onclick="location.href='/seminar/deleteProc.do?board_idx=${detail.board_idx}'">삭제</button>
				<button type="button" class="btn btn-default" onclick="javascript:history.back(-1);">목록</button>
				<br><br>
				
				<!-- Comments Form -->
                <div class="well">
                    <h4>Leave a Comment:</h4>
                    <form role="form" id="frm" method="post">
                        <div class="form-group">
                            <textarea class="form-control" id="reply_content" name="reply_content" rows="3" form="frm" ></textarea>
                        </div>
                        <input class="btn btn-primary" type="button" id="btn_save" value="댓글 저장">
                    </form>
                </div>
                <hr>

			<c:choose>
				<c:when test="${fn:length(replyList) > 0}">
					<c:forEach items="${replyList }" var="replyList">
						<div class="media">
							<a class="pull-left" href="#"><img class="media-object"	src="http://placehold.it/64x64" alt=""></a>
							<div class="media-body">
								<h4 class="media-heading">username으로 ${replyList.user_idx }&nbsp;&nbsp;<small>${replyList.reply_write_date }</small></h4>
								${replyList.reply_content }
							</div>
						</div>
					</c:forEach>
				</c:when>
			</c:choose>

		</div>
	</div>

	<script>
		$(document).ready(function() {
			$('#btn_save').on("click",function() {
				var board_idx = document.getElementById('board_idx').value;
				$("#frm").attr("action","/seminar/insertReply.do?board_idx="+ board_idx + "&f_type=SE");
				if(frm.reply_content.value == "") {
					alert("댓글을 입력해주세요.");
					return;
				}
				frm.submit();
				history.pushState(null, 'page -1',"/seminar.do");
			});
		});
	</script>
<%@include file="../../footer.jsp"%>