<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
			<c:forEach items="${list }" var="list">
				<table>
					<tr>
						<td>제목</td>
						<td>${list.subject }</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td>${list.writter }</td>
						<td>등록일</td>
						<td>${list.date }</td>
						<td>조회수</td>
						<td>${list.count }</td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td></td>
					</tr>
					<tr>
						<td>내용</td>
						<td>${list.content }</td>
					</tr>
				</table>
			</c:forEach>
		</c:when>
	</c:choose>
	<input type="button" value="목록" onclick="javascript:history.back(-1);"><br/>
	이름 : <input type="text"> 비밀번호 : <input type="text"><br/>
	댓글달기 : <textarea rows="10" cols="10"></textarea><input type="button" value="댓글 저장">
	
</body>
</html>