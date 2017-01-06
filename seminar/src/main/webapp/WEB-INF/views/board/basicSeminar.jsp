<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>basciSeminar</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
table,tr,td{
border:1px solid black;
}
</style>

</head>
<body>
	<h2>세미나게시판 basicSeminar</h2>
	<table>
		<tr>
			<td>번호seq</td>
			<td>제목subject</td>
			<td>작성자writter</td>
			<td>날짜date</td>
			<td>조회수count</td>
		</tr>
		<c:choose>
			<c:when test="${fn:length(list) > 0}">
				<c:forEach items="${list }" var="list">
					<tr>
						<td>${list.seq }</td>
						<td><a href="#">${list.subject }</a></td>
						<td>${list.writter }</td>
						<td>${list.date }</td>
						<td>${list.count }</td>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</table>
</body>
</html>