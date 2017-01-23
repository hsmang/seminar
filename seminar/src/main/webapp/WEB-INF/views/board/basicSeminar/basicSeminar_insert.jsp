<%@include file="../../head.jsp"%>
<%@include file="../../nav.jsp"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<link href="http://hayageek.github.io/jQuery-Upload-File/4.0.10/uploadfile.css" rel="stylesheet">
<script src="http://hayageek.github.io/jQuery-Upload-File/4.0.10/jquery.uploadfile.min.js"></script>

<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>

<link rel="stylesheet" href="/resources/dropzone/dropzone.css">
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


<form id="frm" action="/seminar/insertProc.do" method="post" class="form-horizontal">
	<div class="form-group">
		<label for="inputEmail3" class="col-sm-2 control-label">제목</label>
    	<div class="col-sm-10">
    		<input class="form-control" type="text" id="subject" name="subject">
    	</div>
    </div>
    <div class="form-group">
    	<label for="inputEmail3" class="col-sm-2 control-label">작성자</label>
    	<div class="col-sm-10">
    		<input class="form-control" type="text" id="user_idx" name="user_idx" value="2">
    	</div>
    </div>
    <div class="form-group">
    	<label for="inputEmail3" class="col-sm-2 control-label">첨부파일</label>
    	<div class="col-sm-10">
    		<div id="fileuploader">Upload</div>
				<script>
					$(document).ready(function() {
						$("#fileuploader").uploadFile({
							url : "/seminar/fileUpload_jquery_fileUpload.do",
							fileName : "myfile",
							sequential : true,
							sequentialCount : 1
						});

					});
				</script>
		</div>
	</div>
	<div class="form-group">
    	<label for="inputEmail3" class="col-sm-2 control-label">내용</label>
    	<div class="col-sm-10">
    		<textarea name="content" id="content" rows="10" cols="107"></textarea>
		</div>
    </div>
    <hr>
     
    <input class="btn btn-default" type="button" value="이전" onclick="javascript:history.back(-1);">
    <input class="btn btn-default" type="button" id="btn_save" value="저장">
    
</form>

<form action="/seminar/fileUpload.do" class="dropzone"></form>

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
			frm.submit();
		});
	});
</script>

</div>
</body>
</html>