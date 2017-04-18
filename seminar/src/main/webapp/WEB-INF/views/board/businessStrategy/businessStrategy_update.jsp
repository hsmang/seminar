<%@include file="../../head.jsp"%>
<%@include file="../../nav.jsp"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<script type="text/javascript" src="/resources/dropzone/dropzone.js" charset="utf-8"></script>

<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>

<c:set var="board_user_idx" value="${board_user_idx }"/>
<%
	
	if(user== null){
		response.sendRedirect("/businessStrategy.do");
	}else if(user.getUser_role() == 0){
		
	}else if(user.getUser_role() == 1){
		
	}
	else if(user.getUser_role() == 2){
		int board_user_idx = (int)pageContext.getAttribute("board_user_idx");
		int user_idx = user.getUser_idx();
		if(board_user_idx != user_idx){
			response.sendRedirect("/businessStrategy.do");
		}
	}
%>

<div class="container">
	<!-- Page Heading/Breadcrumbs -->
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				経営戦略論
			</h1>
			<ol class="breadcrumb">
				<li><a href="/index.do">Home</a></li>
				<li class="active">経営戦略論</li>
			</ol>
		</div>
	</div>
	<br>

	<form id="frm" method="post" class="form-horizontal">
		<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
		<hr>
				<input type="hidden" id="board_idx" name="board_idx" value="${board.board_idx }">
					<div class="form-group">
						<label for="inputSubject" class="col-sm-1 control-label">タイトル</label>
				    	<div class="col-sm-11">
				    		<input class="form-control" type="text" id="subject" name="board_subject" value="${board.board_subject }">
				    	</div>
				    </div>
				    <hr>
				    <div class="form-group">
				    	<label for="inputFile" class="col-sm-1 control-label">添付ファイル</label>
				    	<div class="col-sm-11">
				    		<div class="dropzone" id="file-dropzone" style="border:2px dashed #0087F7;">
								<div class="dz-message" style="font-size: large;">Drag and Drop files here or click to upload</div>
							</div>
				    	</div>
				    </div>
				    <hr>	
				    <div class="form-group">
				    	<label for="inputContent" class="col-sm-1 control-label">内容</label>
				    	<div class="col-sm-11">
				    		<textarea name="board_content" id="content" style="width:100%; height:500px;">${board.board_content }</textarea>
				    	</div>
				    </div>
				    <hr>
					<input class="btn btn-default" type="button" id="btn_save" value="セーブ"> 
					<input class="btn btn-default" type="button" value="以前" onclick="javascript:history.back(-1);">
	</form>
	
	<script type="text/javascript">
	var smartEditor = [];
	var sLang = "ja_JP";
	var aDefaultFontSet = [];
	switch(sLang){
		case "ja_JP" :
			aDefaultFontSet = [["MS UI Gothic", "MS UI Gothic"], ["MS Pゴシック", "MS Pゴシック"], ["MS ゴシック", "MS ゴシック"], ["MS P明朝", "MS P明朝"], ["MS 明朝", "MS 明朝"], ["Arial", "Arial"], ["Arial Black", "Arial Black"], ["Comic Sans MS", "Comic Sans MS"], ["Courier New", "Courier New"], ["Times New Roman", "Times New Roman"], ["Verdana", "Verdana"]];
			break;
		case "zh_CN" :
			aDefaultFontSet = [["宋体", "宋体"], ["新宋体", "新宋体"], ["黑体", "黑体"], ["仿宋", "仿宋"], ["楷体", "楷体"], ["幼圆", "幼圆"], ["隶书", "隶书"], ["华文彩云", "华文彩云"], ["Arial", "Arial"], ["Comic Sans MS", "Comic Sans MS"], ["Verdana", "Verdana"], ["Times New Roman", "Times New Roman"], ["Tahoma", "Tahoma"]];
			break;
		case "en_US" :
			aDefaultFontSet = [["Gulim", "Gulim"], ["Batang", "Batang"], ["Gulimche", "Gulimche"], ["Sans Serif", "Sans Serif"], ["Serif", "Serif"], ["Wide", "Wide"], ["Narrow", "Narrow"], ["Comic Sans MS", "Comic Sans MS"], ["Courier New", "Courier New"], ["Garamond", "Garamond"], ["Georgia", "Georgia"], ["Tahoma", "Tahoma"], ["Trebuchet MS", "Trebuchet MS"], ["Verdana", "Verdana"]];
			break;
		default :
			break;
	}

	nhn.husky.EZCreator.createInIFrame({
		oAppRef : smartEditor,
		elPlaceHolder : "content",
		sSkinURI : "/resources/se2/SmartEditor2Skin_ja_JP.html",
		htParams : {
	        // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	        bUseToolbar : true,            
	        // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	        bUseVerticalResizer : true,    
	        // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	        bUseModeChanger : true,
	        SE2M_FontName: {
				aDefaultFontList: aDefaultFontSet
			},
	        I18N_LOCALE : sLang
	    }
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
				url: "/businessStrategy/fileUpload.do?board_idx="+idx,
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
					alert('Duplicate file 重複ファイル');
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
				$("#frm").attr("action", "/businessStrategy/updateProc.do");
				for(var i=0; i<=rIdx; i++){
					$.post("/businessStrategy/fileDelete.do", {
						name : fileName[i],
	  					index : board_idx
					});
				}
				myDropzone.processQueue();
				$.LoadingOverlay("show");
				myDropzone.on("queuecomplete", function(progress) {
					$.LoadingOverlay("hide");
					frm.submit();
				});
			});
		});
	</script>


<%@include file="../../footer.jsp"%>