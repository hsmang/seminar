<%@include file="../../head.jsp"%>
<%@include file="../../nav.jsp"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>

<div class="container">
	<!-- Page Heading/Breadcrumbs -->
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				About <small>Subheading</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="index.html">Home</a></li>
				<li class="active">About</li>
			</ol>
		</div>
	</div>
	<br>

	<form id="frm" method="post" class="form-horizontal">
		<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
		<c:choose>
			<c:when test="${fn:length(list) > 0}">
				<c:forEach items="${list }" var="detail">
				<input type="hidden" id="board_idx" name="board_idx" value="${detail.board_idx }">
					<div class="form-group">
						<label for="inputSubject" class="col-sm-1 control-label">제목</label>
				    	<div class="col-sm-11">
				    		<input type="text" id="subject" name="subject" value="${detail.board_subject }">
				    	</div>
				    </div>
				    <div class="form-group">
				    	<label for="inputFile" class="col-sm-1 control-label">첨부파일</label>
				    	<div class="col-sm-11">첨부파일 히히
				    	</div>
				    </div>
				    <div class="form-group">
				    	<label for="inputContent" class="col-sm-1 control-label">내용</label>
				    	<div class="col-sm-11">
				    		<textarea name="content" id="content" rows="10" cols="100">${detail.board_content }</textarea>
				    	</div>
				    </div>
				    <hr>
					<input class="btn btn-default" type="button" id="btn_save" value="저장"> 
					<input class="btn btn-default" type="button" value="이전" onclick="javascript:history.back(-1);">
				</c:forEach>
			</c:when>
		</c:choose>
	</form>

	<script type="text/javascript">
		var smartEditor = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : smartEditor,
			elPlaceHolder : "content",
			sSkinURI : "/resources/se2/SmartEditor2Skin.html",
			fCreator : "createSEditor2"
		});
		$(document).ready(function(){
			$('#btn_save').on("click", function(){
				smartEditor.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
				$("#frm").attr("action", "/seminar/updateProc.do");
				frm.submit();
			});
		});
	</script>


<%@include file="../../footer.jsp"%>