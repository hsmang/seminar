<%@include file="../../head.jsp"%>
<%@include file="../../nav.jsp"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<script type="text/javascript" src="/resources/dropzone/dropzone.js" charset="utf-8"></script>

<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>

<c:set var="board_user_idx" value="${board_user_idx }"/>
<%
	
	if(user== null){
		response.sendRedirect("/businessAdmin.do");
	}else if(user.getUser_role() == 0){
		
	}else if(user.getUser_role() == 1){
		
	}
	else if(user.getUser_role() == 2){
		int board_user_idx = (int)pageContext.getAttribute("board_user_idx");
		int user_idx = user.getUser_idx();
		if(board_user_idx != user_idx){
			response.sendRedirect("/businessAdmin.do");
		}
	}
%>

<div class="container">
	<!-- Page Heading/Breadcrumbs -->
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				About <small>Subheading</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="/index.do">Home</a></li>
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
				    		<input class="form-control" type="text" id="subject" name="board_subject" value="${board.board_subject }">
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
				    		<textarea name="board_content" id="content" style="width:100%; height:500px;">${board.board_content }</textarea>
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
		
		var file_name = [];
		var file_oriSize = [];
		var file_path = [];
		<c:choose>
			<c:when test="${fn:length(fileList) > 0}">
				<c:forEach items="${fileList }" var="fileList" varStatus="status">
					file_path[${status.index}] = "${fileList.f_attach_path}${fileList.f_attach_name}";
					file_name[${status.index}] = "${fileList.f_attach_name}";
					file_oriSize[${status.index}] =  "${fileList.original_fileSize}";
				</c:forEach>
			</c:when>
		</c:choose>
		
		$(document).ready(function(){
			
			Dropzone.autoDiscover = false;
			var idx = $("#board_idx").val();
			var myDropzone = new Dropzone("div#file-dropzone", {
				url: "/businessAdmin/fileUpload.do?board_idx="+idx,
				filesizeBase: 1024,
				addRemoveLinks: true,
				maxFilesize: 10, // MB
				maxFiles: 10,
				parallelUploads: 10,
				dictMaxFilesExceeded : "You can only upload upto 10 Files",
				dictRemoveFile : "delete",
				dictCancelUploadConfirmation:"Are you sure to cancel upload?",
				
				autoProcessQueue : false,			
				
				preventDuplicates: true,
				dictDuplicateFile: "Duplicate Files Cannot Be Uploaded",
				
				dictFallbackMessage: "Your browser does not support drag'n'drop file uploads.",
				dictInvalidFileType: "You can't upload files of this type.",
				dictResponseError: "Server responded with {{statusCode}} code.",
				
				init:function(file){
					for(var i=0; i<file_name.length; i++){
						var mockFile = { name : file_name[i], size : file_oriSize[i] };
						this.emit("addedfile", mockFile);
						//this.createThumbnailFromUrl(mockFile, "F:\\seminar\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\seminar\\resources\\file_upload\\2017\\02\\07\\22484\\Hydrangeas.jpg");
						//this.createThumbnailFromUrl(mockFile, "http://localhost:8080\\resources\\file_upload\\2017\\02\\07\\26501\\test22222.png");
						this.emit("complete", mockFile);
						//var existingFileCount = 5;
						//this.options.maxFiles = this.options.maxFiles - existingFileCount;
					}
				}
				
			});
			
			myDropzone.on("maxfilesexceeded", function(file){
				alert('You can only upload upto 10 Files');
				this.removeFile(file);
			});
			
			var index = 0;
			var prevFilename = [];
			myDropzone.on("addedfile", function(file){
				/* 중복체크 if문 */
				if(fn_checkFileDuplicate(file.name, index++) == 0){
					alert('Duplicate file 중복 파일');
					this.removeFile(file);
				}
			});

			/* 중복 체크 함수 */
			function fn_checkFileDuplicate(filename, idx){
				if(idx != 0){
					for(var i=0; i<idx; i++){
						if(prevFilename[i] == filename){
							return 0;
						}				
					}
					prevFilename[idx] = filename;
					return 1;
				}else{
					prevFilename[idx] = filename;
					return 1;
				}
			}
			
			var rIdx = 0;
			var fileName = [];
			myDropzone.on('removedfile', function(file){
				fileName[rIdx] = file.name;
				rIdx++;
			});
			
			$('#btn_save').on("click", function(){
				board_idx = $("#board_idx").val();
				smartEditor.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
				$("#frm").attr("action", "/businessAdmin/updateProc.do");
				for(var i=0; i<=rIdx; i++){
					$.post("/businessAdmin/fileDelete.do", {
						name : fileName[i],
	  					index : board_idx
					});
				}
				myDropzone.processQueue();
				frm.submit();
			});
		});
	</script>


<%@include file="../../footer.jsp"%>