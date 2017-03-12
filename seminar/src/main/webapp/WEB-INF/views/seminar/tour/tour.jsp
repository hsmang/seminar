<%@include file="../../head.jsp"%>
<%@include file="../../nav.jsp"%>
<%@ page language ="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page session="true" %>
<%@page import="jp.seminar.user.model.UserVO"%>

<div class="container">
	<!-- Page Heading/Breadcrumbs -->
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Business System <small>Subheading</small></h1>
			<ol class="breadcrumb">
				<li><a href="/index.do">Home</a></li>
				<li class="active">Business System</li>
			</ol>
		</div>
	</div>
	<br>

	<table class="table table-hover table-responsive">
		<thead>
			<tr>
				<th style="width:10%">번호</th>
				<th style="width:40%">제목</th>
				<th style="width:20%">작성자</th>
				<th style="width:20%">날짜</th>
				<th style="width:10%">조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(boardList) > 0}">
					<c:forEach items="${boardList }" var="list">
						<tr>
							<td id="idx">${list.board_idx }</td>
							<td><a href="/businessSystem/detail.do?board_idx=${list.board_idx }&f_type=SY" id="subject">${list.board_subject }</a></td>
							<td>${list.user_name }</td>
							<td><fmt:parseDate value='${list.board_update_date }' var='update_date' pattern='yyyy-MM-dd'/>
								<fmt:formatDate value="${update_date}" pattern="yyyy.MM.dd"/></td>
							<td>${list.board_count }</td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</tbody>
	</table>

	<hr>
	<!-- Pagination -->
	<div class="row text-center">
		<div class="col-lg-12">

			<ul class="pagination">
				${paging.pagingHtml }
			</ul>
		</div>
	</div>
	<!-- /.row -->

	<form id="search_form" method="get"> 
		<div class="btn-group">
			<select class="form-control" id="search_type" name="search_type">
				<option value="subject" selected="selected">제목</option>
				<option value="subjectcontent">제목+내용</option>
				<option value="content">내용</option>
			</select>
		</div>
	<input type=hidden id="pageNumber" name="pageNumber" value="1">
	<input type=hidden id="pageSize" name="pageSize" value="10">
	<input class="btn btn-default" id="search_value" name="search_value" type="text" placeholder="검색내용">
	<button type="button" id="btn_search" class="btn btn-default" onclick="fn_search()">검색</button>
	
	
	<%
		if(user != null){
	%><button type="button" id="btn_insert" class="btn btn-default" onclick="location.href='/businessSystem/insert.do'" >작성</button>
	<%} %>
	</form>
	<hr>
	
	<script>
	function fn_search(){
		var search_value = $('#search_value').val();
		if(search_value == ""){
			alert("Please enter your search term.");
		}else{
			$("#search_form").attr("action", "/businessSystem.do?pageNumber=1&pageSize=10");
			search_form.submit();
		}
	}
	
	function fn_goList(){
		location.href='/businessSystem.do?pageNumber=1&pageSize=10';
	}
	
	$(document).ready(function() {
		var getUrlParameter = function getUrlParameter(sParam) {
		    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
		        sURLVariables = sPageURL.split('&'),
		        sParameterName,
		        i;

		    for (i = 0; i < sURLVariables.length; i++) {
		        sParameterName = sURLVariables[i].split('=');

		        if (sParameterName[0] === sParam) {
		            return sParameterName[1] === undefined ? true : sParameterName[1];
		        }
		    }
		};
		
		var search_value = getUrlParameter('search_value');
		if(search_value != null){
			$("#btn_search").after("&nbsp;<button type='button' id='btn_search' class='btn btn-default' onclick='fn_goList()'>목록</button>");
		}
	});
		
	</script>

<%@include file="../../footer.jsp"%>
