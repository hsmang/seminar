<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
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
			<td>번호idx</td>
			<td>제목subject</td>
			<td>작성자user_idx</td>
			<td>날짜reg_date or update_date</td>
			<td>조회수count</td>
		</tr>
		<c:choose>
			<c:when test="${fn:length(boardList) > 0}">
				<c:forEach items="${boardList }" var="list">
					<c:forEach items="${userList }" var="user">
						<tr>
							<td id="idx">${list.board_idx }</td>
							<td><a href="/seminar/detail.do?board_idx=${list.board_idx }&f_type=SE" id="subject">${list.board_subject }</a></td>
							<td>${list.user_idx } // ${user.user_idx }
								${user_user_name }</td>						
							<td>${list.board_reg_date }</td>
							<td>${list.board_count }</td>
						</tr>
					</c:forEach>
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
	
	<input type="text"><input type="button" value="검색"><input type="button" id="btn_insert" value="작성(권한있는자만)" onclick="location.href='/seminar/insert.do'">
	
	<h3>twitter4j</h3>
	
	<c:choose>
		<c:when test="${fn:length(twitList) > 0}">
			<c:forEach items="${twitList }" var="twit">
						${twit.writter }<br>
						${twit.content }
			</c:forEach>
		</c:when>
	</c:choose>
	
</body>
</html>