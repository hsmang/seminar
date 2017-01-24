<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<title>basicSeminar_detail</title>

<style>
table, tr, td {
	border: 1px solid black;
}
</style>

</head>
<body>

<h3>세미나 게시판 detail</h3>

	<c:choose>
		<c:when test="${fn:length(list) > 0}">
			<c:forEach items="${list }" var="detail">
			<input type="hidden" id="board_idx" value="${detail.board_idx }">
				<table>
					<tr>
						<td>제목</td>
						<td>${detail.board_subject }</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td>${detail.user_idx }</td>
						<td>등록일</td>
						<td>${detail.board_reg_date }</td>
						<td>조회수</td>
						<td>${detail.board_count }</td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td><input type="button" value="드라그앤드랍? OR 버튼클릭?"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td>${detail.board_content }</td>
					</tr>
				</table>
				<input type="button" value="수정" onclick="location.href='/seminar/update.do?board_idx=${detail.board_idx}'"><br/>
				<input type="button" value="삭제" onclick="location.href='/seminar/deleteProc.do?board_idx=${detail.board_idx}'">
				<input type="button" value="목록" onclick="javascript:history.back(-1);"><br/>
			</c:forEach>
		</c:when>
	</c:choose>
	
	<div style="border:1px solid black">
		<h3>댓글 단 장소</h3>
		<c:choose>
			<c:when test="${fn:length(replyList) > 0}">
				<c:forEach items="${replyList }" var="replyList">
					${replyList.user_idx } ::	${replyList.reply_content } / ${replyList.reply_write_date }<br>
				</c:forEach>
			</c:when>
		</c:choose>
	</div>
	<form id="frm" method="post">
		<input type="hidden" id="f_type" name="f_type" value="SE">
		댓글달기 <textarea id="reply_content" form="frm" name="reply_content" rows="10" cols="100"></textarea>
		<input type="button" id="btn_save" value="댓글 저장">
	</form>
	
	<script>
		$(document).ready(function(){
			$('#btn_save').on("click", function(){
				var board_idx = document.getElementById('board_idx').value;
				$("#frm").attr("action", "/seminar/insertReply.do?board_idx="+board_idx);
				frm.submit();
			});
		});
	</script>
</body>
</html>