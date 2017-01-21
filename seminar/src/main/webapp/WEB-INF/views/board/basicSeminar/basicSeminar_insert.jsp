<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="twitter:widgets:theme" content="light">
<meta name="twitter:widgets:link-color" content="#55acee">
<meta name="twitter:widgets:border-color" content="#55acee">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link href="http://hayageek.github.io/jQuery-Upload-File/4.0.10/uploadfile.css" rel="stylesheet">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="http://hayageek.github.io/jQuery-Upload-File/4.0.10/jquery.uploadfile.min.js"></script>

<!-- <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> -->
<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>

<link rel="stylesheet" href="/resources/dropzone/dropzone.css">
<script type="text/javascript" src="/resources/dropzone/dropzone.js" charset="utf-8"></script>

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
	
	
	<form action="/seminar/fileUpload.do" class="dropzone"></form>
	
<form id="frm" action="/seminar/insertProc.do" method="post">
	<table>
		<tr>
			<td>제목</td>
			<td><input type="text" id="subject" name="subject"></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><input type="text" id="user_idx" name="user_idx" value="2">user_idx</td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td>
				<div id="fileuploader">Upload</div>
				<script>
				$(document).ready(function()
				{
					$("#fileuploader").uploadFile({
						url:"/seminar/fileUpload_jquery_fileUpload.do",
						fileName:"myfile",
						sequential:true,
						sequentialCount:1
					});
					
					
				});
				</script>
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
				frm.submit();
			});
		});
	</script>

</body>
</html>