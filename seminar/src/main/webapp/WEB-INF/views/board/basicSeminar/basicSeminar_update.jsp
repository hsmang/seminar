<%@include file="../../head.jsp"%>
<%@include file="../../nav.jsp"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<script type="text/javascript" src="/resources/dropzone/dropzone.js" charset="utf-8"></script>

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
		<hr>
				<input type="hidden" id="board_idx" name="board_idx" value="${board.board_idx }">
					<div class="form-group">
						<label for="inputSubject" class="col-sm-1 control-label">제목</label>
				    	<div class="col-sm-11">
				    		<input class="form-control" type="text" id="subject" name="subject" value="${board.board_subject }">
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
				    		<textarea name="content" id="content" style="width:100%">${board.board_content }</textarea>
				    	</div>
				    </div>
				    <hr>
					<input class="btn btn-default" type="button" id="btn_save" value="저장"> 
					<input class="btn btn-default" type="button" value="이전" onclick="javascript:history.back(-1);">
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
			var json = new Object();
			<c:choose>
			<c:when test="${fn:length(fileList) > 0}">
				<c:forEach items="${fileList }" var="fileList">
					json.path = "${fileList.f_attach_path}${fileList.f_attach_name}";
					json.name = "${fileList.f_attach_name}";
					json.oriFilesize = "${fileList.original_fileSize}";
				</c:forEach>
			</c:when>
			</c:choose>
			console.log(json);
			
			Dropzone.autoDiscover = false;
			var myDropzone = new Dropzone("div#file-dropzone", {
				url: "/seminar/fileUpload.do",
				addRemoveLinks: true,
				maxFileSize: 10, // MB
				maxFile: 5,
				dictMaxFilesExceeded : "You can only upload upto 5 Files",
				dictRemoveFile : "delete",
				dictCancelUploadConfirmation:"Are you sure to cancel upload?",
				init:function(file){
					var mockFile = { name : json.name, size : json.oriFilesize };
					//this.emit("addedfile", mockFile, json.path);
					this.emit("addedfile", mockFile);
					//this.createThumbnailFromUrl(mockFile, "F:\\seminar\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\seminar\\resources\\file_upload\\2017\\02\\07\\22484\\Hydrangeas.jpg");
					this.createThumbnailFromUrl(mockFile, "http://localhost:8080\\resources\\file_upload\\2017\\02\\07\\22484\\Hydrangeas.jpg");
					this.emit("complete", mockFile);
					var existingFileCount = 5;
					this.options.maxFiles = this.options.maxFiles - existingFileCount;
				}
			});
			
			
			$('#btn_save').on("click", function(){
				smartEditor.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
				$("#frm").attr("action", "/seminar/updateProc.do");
				frm.submit();
			});
		});
	</script>


<%@include file="../../footer.jsp"%>