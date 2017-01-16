<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" type="text/css" href="/resources/dropzone/dist/dropzone.css">

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="/resources/dropzone/dist/dropzone.js" charset="utf-8"></script>

<title>basicSeminar_insert</title>

<style>
table {
	border: 1px solid black;
	width: 100%;
}

tr, td {
	border: 1px solid black;
}
</style>

</head>
<body>

	<h3>세미나 게시판 insert</h3>



<form id="frm" action="/seminar/insertProc.do" method="post">
	<table>
		<tr>
			<td>제목</td>
			<td><input type="text" id="subject" name="subject"></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><input type="text" id="user_idx" name="user_idx" value="99">user_idx</td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td>
					
			</td>
		</tr>
		<tr>
			<td style="width:10%">내용</td>
			<td style="width:90%"><textarea name="content" id="content" rows="10" cols="100"></textarea></td>
		</tr>
	</table>

	<input type="button" id="btn_save" value="저장">
	<input type="button" value="이전" onclick="javascript:history.back(-1);">
</form>

<hr>

<form action="/board/file_upload.do" class="dropzone">
  <div class="fallback">
    <input name="file" type="file" multiple />
  </div>
</form>

<hr>

<form action="/board/upload.do" id="upload-widget" method="post"  class="dropzone">
</form>

<hr>
	<script type="text/javascript">
		var smartEditor = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : smartEditor,
			elPlaceHolder : "content",
			sSkinURI : "/resources/se2/SmartEditor2Skin.html",
			fCreator : "createSEditor2"
		});
		$(document).ready(function(){
			$(".fallback").dropzone({ url: "/file/post" });
			
			$('#btn_save').on("click", function(){
				smartEditor.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
				frm.submit();
			});
		});
		
		Dropzone.options.myAwesomeDropzone = {
			maxFilesize : 2				
		};
	</script>

</body>
</html>