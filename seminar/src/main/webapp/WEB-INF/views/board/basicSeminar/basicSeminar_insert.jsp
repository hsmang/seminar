<%@include file="../../head.jsp"%>
<%@include file="../../nav.jsp"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<script src="http://hayageek.github.io/jQuery-Upload-File/4.0.10/jquery.uploadfile.min.js"></script>

<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript" src="/resources/dropzone/dropzone.js" charset="utf-8"></script>


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
	
	<div class="row">
		<div class="col-lg-12">
			<form id="frm" action="/seminar/insertProc.do" method="post" class="form-horizontal">
				<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
				<hr>
				<div class="form-group">
					<label for="inputSubject" class="col-sm-1 control-label">제목</label>
			    	<div class="col-sm-11">
			    		<input class="form-control" type="text" id="subject" name="subject">
			    	</div>
			    </div>
			    <hr>
			    <div class="form-group">
			    	<label for="inputWriter" class="col-sm-1 control-label">작성자</label>
			    	<div class="col-sm-11">
			    		<input class="form-control" type="text" id="user_idx" name="user_idx" value="2">
			    	</div>
			    </div>
			    <div class="form-group">
			    	<label for="inputFile" class="col-sm-1 control-label">첨부파일</label>
			    	<div class="col-sm-11">
			    		<div id="fileuploader">Upload</div>
							<script>
								$(document).ready(function() {
									$("#fileuploader").uploadFile({
										url : "/seminar/fileUpload.do",
										fileName : "myfile",
										sequential : true,
										sequentialCount : 1
									});
			
								});
							</script>
					</div>
				</div>
				<hr>
				<div class="form-group">
			    	<label for="inputContent" class="col-sm-1 control-label">내용</label>
			    	<div class="col-sm-11">
			    		<textarea name="content" id="content" rows="10" cols="107"></textarea>
					</div>
			    </div>
			    <hr>
			     
			    <input class="btn btn-default" type="button" value="이전" onclick="javascript:history.back(-1);">
			    <input class="btn btn-default" type="button" id="btn_save" value="저장">
			    
			</form>
			
			<form action="/seminar/fileUpload.do" class="dropzone"></form>
		</div>
	</div>

<script type="text/javascript">
	var smartEditor = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : smartEditor,
		elPlaceHolder : "content",
		sSkinURI : "/resources/se2/SmartEditor2Skin.html",
		fCreator : "createSEditor2"
	});
	$(document).ready(function() {
		$('#btn_save').on("click", function() {
			smartEditor.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
			if(frm.subject.value == "") {
				alert("제목을 입력해주세요.");
				return;
			}
			if(frm.content.value == "") {
				alert("내용을 입력해주세요.");
				return;
			}
			frm.submit();
		});
	});
</script>


<%@include file="../../footer.jsp"%>