<%@include file="../../head.jsp"%>
<%@include file="../../nav.jsp"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript" src="/resources/dropzone/dropzone.js" charset="utf-8"></script>

<%
	if(user== null){
		response.sendRedirect("/seminar.do");
	}
%>

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
	<br>
	
	<div class="row">
		<div class="col-lg-12">
			
			<form id="frm" action="/seminar/insertProc.do" method="post" class="form-horizontal" >
				<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
				<hr>
				<div class="form-group">
					<label for="inputSubject" class="col-sm-1 control-label">제목</label>
			    	<div class="col-sm-11">
			    		<input class="form-control" type="text" id="subject" name="board_subject">
			    	</div>
			    </div>
			   <hr>
			   <div class="form-group">
			    	<label for="inputFile" class="col-sm-1 control-label">첨부파일</label>
			    	<div class="col-sm-11">
						<div class="dropzone" id="file-dropzone" style="border:2px dashed #0087F7;">
							<div class="dz-message" style="font-size: large;">Drag and Drop files here or click to upload</div>
						</div>
					</div>
				</div>
				<hr>
				
				<div class="form-group">
			    	<label for="inputContent" class="col-sm-1 control-label">내용</label>
			    	<div class="col-sm-11">
			    		<textarea name="board_content" id="content" style="width:100%; height:500px;"></textarea>
					</div>
			    </div>
			    <hr>
			     
			    <input class="btn btn-default" type="button" value="이전" onclick="javascript:history.back(-1);">
			    <input class="btn btn-default" type="button" id="btn_save" value="저장">
			</form>
		</div>
    </div>


<script type="text/javascript">

	var smartEditor = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : smartEditor,
		elPlaceHolder : "content",
		sSkinURI : "/resources/se2/SmartEditor2Skin.html",
		htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,            
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,    
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true,
        }
	});
	$(document).ready(function() {
		Dropzone.autoDiscover = false;
		var myDropzone = new Dropzone("div#file-dropzone", {
			url: "/seminar/fileUpload.do",
			addRemoveLinks: true,
			maxFileSize: 10, // MB
			maxFile: 5,
			dictMaxFilesExceeded : "You can only upload upto 5 Files",
			dictRemoveFile : "delete",
			dictCancelUploadConfirmation:"Are you sure to cancel upload?"
		});
		
 		$('#btn_save').on("click", function() {
			if(frm.subject.value == "") {
				alert("제목을 입력해주세요");
				return;
			}
			if(smartEditor.getById["content"] == "") {
				alert("내용을 입력해주세요.");
				return;
			}
			smartEditor.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
			frm.submit();
		});
		
	});
</script>


<%@include file="../../footer.jsp"%>