<%@include file="../../head.jsp"%>
<%@include file="../../nav.jsp"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<%
	

%>

<div class="container">
	<!-- Page Heading/Breadcrumbs -->
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				BusinessSystem <small>Subheading</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="/index.do">Home</a></li>
				<li class="active">BusinessSystem</li>
			</ol>
		</div>
	</div>


	<div class="row">
		<div class="col-lg-12">
		
		
 				<input type="hidden" id="board_idx" value="${detail.board_idx }">
				<hr>
				<h2>${detail.board_subject }</h2>
					<!-- Date/Time -->
					<p><i class="fa fa-clock-o"></i> Posted on <fmt:parseDate value='${detail.board_update_date }' var='update_date' pattern='yyyy-MM-dd HH:mm'/>
															   <fmt:formatDate value="${update_date}" pattern="yyyy.MM.dd HH:mm"/>
															   &nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-pencil" aria-hidden="true"></i>  ${user.user_name }</p>
					<form id="fileFrm" method="post">
					<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
					<c:choose>
						<c:when test="${fn:length(fileList) > 0}">
							<c:forEach items="${fileList }" var="fileList">
								<input type="hidden" id="path" value="${fileList.f_attach_path }">
								<i class="fa fa-file-o" aria-hidden="true"></i>
								<a href="#this" id="file">${fileList.f_attach_name }</a> (${fileList.fileSize })&nbsp;&nbsp;<br>
							</c:forEach>
						</c:when>
					</c:choose>
					</form>
				<hr>
				<p>${detail.board_content }</p>
				<hr>
				<c:set var="board_user_idx" value="${board_user_idx }"/>
				<%
				if(user != null){
						if(user.getUser_role() == 2){
							int board_user_idx = (int)pageContext.getAttribute("board_user_idx");
							int user_idx = user.getUser_idx();
							if(board_user_idx == user_idx){%>
							<button type="button" class="btn btn-default" onclick="location.href='/businessSystem/update.do?board_idx=${detail.board_idx}'">수정</button>
							<button type="button" class="btn btn-default" onclick="location.href='/businessSystem/deleteProc.do?board_idx=${detail.board_idx}'">삭제</button>
							<% }
						}else{%>
							<button type="button" class="btn btn-default" onclick="location.href='/businessSystem/update.do?board_idx=${detail.board_idx}'">수정</button>
							<button type="button" class="btn btn-default" onclick="location.href='/businessSystem/deleteProc.do?board_idx=${detail.board_idx}'">삭제</button>	
						<%} %>
				<%} %>
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
								<h4 class="media-heading">${replyList.user_name }&nbsp;&nbsp;<small>${replyList.reply_write_date }</small></h4>
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
			$('#btn_save').on("click",function(e) {
				e.preventDefault();
				var board_idx = document.getElementById('board_idx').value;
				$("#frm").attr("action","/businessSystem/insertReply.do?board_idx="+ board_idx + "&f_type=SE");
				if(frm.reply_content.value == "") {
					alert("댓글을 입력해주세요.");
					return;
				}
				frm.submit();
				history.pushState(null, 'page -1',"/businessSystem.do");
			});
			
			$('a[id="file"]').on("click", function(e){
				e.preventDefault();
				fn_downloadFile($(this));
			});
		});
		
		function fn_downloadFile(obj){
			var filePath = $('#path').val()+obj.html(); 
			$("#fileFrm").attr("action", "/businessSystem/fileDownload.do");
			$("#fileFrm").append('<input type="hidden" name="filePath" id="filePath" value="' +filePath+ '">');
			fileFrm.submit();
		}		
	</script>
<%@include file="../../footer.jsp"%>