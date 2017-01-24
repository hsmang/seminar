<%@include file="../../head.jsp"%>
<%@include file="../../nav.jsp"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<div class="container">
	<!-- Page Heading/Breadcrumbs -->
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				Basic Seminar <small>Subheading</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="index.html">Home</a></li>
				<li class="active">Basic Seminar</li>
			</ol>
		</div>
	</div>
	<br>

	<div class="table-responsive">
		<table class="table">
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
						<tr>
							<td id="idx">${list.board_idx }</td>
							<td><a
								href="/seminar/detail.do?board_idx=${list.board_idx }&f_type=SE"
								id="subject">${list.board_subject }</a></td>
							<td>${list.user_name }</td>
							<td>${list.board_reg_date }</td>
							<td>${list.board_count }</td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</table>
	</div>


	<hr>
	<!-- Pagination -->
	<div class="row text-center">
		<div class="col-lg-12">

			<ul class="pagination">
				<li><a href="#">&laquo;</a></li>
				<li class="active"><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">&raquo;</a></li>
			</ul>
		</div>
	</div>
	<!-- /.row -->

	<div class="btn-group">
		<select class="form-control">
			<option>제목</option>
			<option>제목+내용</option>
			<option>내용</option>
			<option>작성자</option>
		</select>
	</div>
	<input class="btn btn-default" type="text" placeholder="검색내용">
	<button type="button" class="btn btn-default">검색</button>
	<button type="button" id="btn_insert" class="btn btn-default" onclick="location.href='/seminar/insert.do'">작성</button>

	<hr>

	<h3>아래는 트위터</h3>

	<a class="twitter-timeline" href="https://twitter.com/sanggi_wjg"
		data-width="50%" data-height="500px">Tweets by @sanggi_wjg</a>
	<!--	<a class="twitter-timeline" href="https://twitter.com/kimzemi833">Tweets by @kimzemi833</a>-->
	<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

<%-- 	<c:choose>
		<c:when test="${fn:length(twitList) > 0}">
			<c:forEach items="${twitList }" var="twit">
						${twit.writter }<br>
						${twit.content }
			</c:forEach>
		</c:when>
	</c:choose> --%>

<%@include file="../../footer.jsp"%>
