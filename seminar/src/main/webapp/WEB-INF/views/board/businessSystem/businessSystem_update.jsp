<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>

<title>update page</title>
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

	<form id="frm" method="post">
		<c:choose>
			<c:when test="${fn:length(list) > 0}">
				<c:forEach items="${list }" var="detail">
				<input type="hidden" id="board_idx" name="board_idx" value="${detail.board_idx }">
					<table>
						<tr>
							<td>제목</td>
							<td><input type="text" id="subject" name="subject" value="${detail.board_subject }"></td>
						</tr>
						<tr>
							<td>첨부파일</td>
							<td><input type="button" value="첨부하기(드래그앤드랍하든 버튼 하든...)"></td>
						</tr>
						<tr>
							<td style="width: 10%">내용</td>
							<td style="width: 90%"><textarea name="content" id="content" rows="10" cols="100">${detail.board_content }</textarea></td>
						</tr>
					</table>
							<input type="button" id="btn_save" value="저장"> 
							<input type="button" value="이전" onclick="javascript:history.back(-1);">
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

</body>
</html>