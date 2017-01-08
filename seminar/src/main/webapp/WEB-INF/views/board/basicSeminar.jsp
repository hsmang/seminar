<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>basciSeminar</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
table, tr, td {
	border: 1px solid black;
}
</style>

</head>
<body>

	<a href="">basicSeminar</a>
	<a href="">businessAdmin</a>
	<a href="">businessStrategy</a>
	<a href="">businessSystem</a>

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
						<td><a href="/seminar/detail.do">${list.subject }</a></td>
						<td>${list.writter }</td>
						<td>${list.date }</td>
						<td>${list.count }</td>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</table>
	
	<select>
		<option>제목</option>
		<option>내용</option>
		<option>제목+내용</option>
		<option>작성자</option>
	</select>
	
	<input type="text"><input type="button" value="검색"><input type="button" value="작성(권한있는자만)" onclick="location.href='/seminar/insert.do'">
	
</body>
</html>