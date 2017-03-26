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
				ビジネスコンテスト 
			</h1>
			<ol class="breadcrumb">
				<li><a href="/index.do">Home</a></li>
				<li class="active">ビジネスコンテスト</li>
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
							<button type="button" class="btn btn-default" onclick="location.href='/contest/update.do?board_idx=${detail.board_idx}'">修正</button>
							<button type="button" class="btn btn-default" onclick="location.href='/contest/deleteProc.do?board_idx=${detail.board_idx}'">削除</button>
							<% }
						}else{%>
							<button type="button" class="btn btn-default" onclick="location.href='/contest/update.do?board_idx=${detail.board_idx}'">修正</button>
							<button type="button" class="btn btn-default" onclick="location.href='/contest/deleteProc.do?board_idx=${detail.board_idx}'">削除</button>	
						<%} %>
				<%} %>
				<button type="button" class="btn btn-default" onclick="javascript:history.back(-1);">目録</button>
				<br><br>
		
				<!-- Comments Form -->
                <div class="well">
                    <h4>Leave a Comment:</h4>
                    <form role="form" id="frm" method="post">
                        <div class="form-group">
                            <textarea class="form-control" id="reply_content" name="reply_content" rows="3" form="frm" ></textarea>
                        </div>
                        <input class="btn btn-primary" type="button" id="btn_save" value="コメントセーブ">
                    </form>
                </div>
                <hr> 
                
			<c:choose>
				<c:when test="${fn:length(replyList) > 0}">
					<c:forEach items="${replyList }" var="replyList">
						<div class="media">
							<div class="media-body">
								<h4 class="media-heading">${replyList.user_name }&nbsp;&nbsp;<small>${replyList.reply_write_date }</small>
								<%
								if(user != null){
										if(user.getUser_role() == 2){
											int reply_user_idx = (int)pageContext.getAttribute("reply_user_idx");
											int user_idx = user.getUser_idx();
											if(reply_user_idx == user_idx){%>
											<small class="pull-right"><a href="/contest/deleteReplyProc.do?reply_idx=${replyList.reply_idx}">削除</a></small>
											<% }
										}else{%>
											<small class="pull-right"><a href="/contest/deleteReplyProc.do?reply_idx=${replyList.reply_idx}">削除</a></small>	
										<%} %>
								<%} %>
								</h4>
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
				$("#frm").attr("action","/contest/insertReply.do?board_idx="+ board_idx + "&f_type=CO");
				if(frm.reply_content.value == "") {
					alert("コメントを入力してください。");
					return;
				}
				frm.submit();
				history.pushState(null, 'page -1',"/contest.do");
			});
			
			$('a[id="file"]').on("click", function(e){
				e.preventDefault();
				fn_downloadFile($(this));
			});
		});
		
		function fn_downloadFile(obj){
			var filePath = $('#path').val()+obj.html(); 
			$("#fileFrm").attr("action", "/contest/fileDownload.do");
			$("#fileFrm").append('<input type="hidden" name="filePath" id="filePath" value="' +filePath+ '">');
			fileFrm.submit();
		}		
	</script>
<%@include file="../../footer.jsp"%>