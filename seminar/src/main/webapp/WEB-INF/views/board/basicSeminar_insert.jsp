<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>

<title>basicSeminar_detail</title>

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

	<h3>세미나 게시판 detail</h3>

	<table>
		<tr>
			<td>제목</td>
			<td><input type="text"></td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td><input type="button" value="첨부하기(드래그앤드랍하든 버튼 하든...)"></td>
		</tr>
		<tr>
			<td style="width:20%">내용</td>
			<td style="width:80%"><textarea name="smartEditor" id="smartEditor" rows="10" cols="100"></textarea></td>
		</tr>
	</table>

	<input type="button" value="저장">
	<input type="button" value="이전" onclick="javascript:history.back(-1);">

	<script type="text/javascript">
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "smartEditor",
			sSkinURI : "/resources/se2/SmartEditor2Skin.html",
			fCreator : "createSEditor2"
		});
	</script>

</body>
</html>