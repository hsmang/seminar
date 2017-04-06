<%@include file="../../head.jsp"%>
<%@include file="../../nav.jsp"%>
<%@ page language ="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page session="true" %>
<%@page import="jp.seminar.user.model.UserVO"%>

<div class="container">
	<!-- Page Heading/Breadcrumbs -->
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">アルバム</h1>
			<ol class="breadcrumb">
				<li><a href="/index.do">Home</a></li>
				<li class="active">アルバム</li>
			</ol>
		</div>
	</div>
	<br>

	
			<c:choose>
				<c:when test="${fn:length(boardList) > 0}">
					<c:forEach items="${boardList }" varStatus="i" var="list">
						<c:if test="${i.count%4 == 1 }">
							<div class="row">
						</c:if>
						<!-- Projects Row -->
				        
				            <div class="col-md-3 img-portfolio">
				                <a href="/album/detail.do?board_idx=${list.board_idx }&f_type=AL">
				                    <img class="img-responsive img-hover " src="${list.main_img }" alt="">
				                </a>
				                <h3 class="text_overflow"><a href="/album/detail.do?board_idx=${list.board_idx }&f_type=AL" id="subject">${list.board_subject }</a></h3>
				            </div>
						<c:if test="${i.count%4 == 0 }">
							</div>
						</c:if>
					</c:forEach>
				</c:when>
			</c:choose>
		
	<div class="row"></div>
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
				<option value="subject" selected="selected">タイトル</option>
				<option value="subjectcontent">タイトル＋内容</option>
				<option value="content">内容</option>
			</select>
		</div>
	<input type=hidden id="pageNumber" name="pageNumber" value="1">
	<input type=hidden id="pageSize" name="pageSize" value="10">
	<input class="btn btn-default" id="search_value" name="search_value" type="text" placeholder="検索語を入力してください。">
	<button type="button" id="btn_search" class="btn btn-default" onclick="fn_search()">検索</button>
	
	
	<%
	if(user != null && user.getUser_role() < 2){
	%><button type="button" id="btn_insert" class="btn btn-default" onclick="location.href='/album/insert.do'" >作成</button>
	<% 
	}%>
	</form>
	<hr>
	
	<script>
	function fn_search(){
		var search_value = $('#search_value').val();
		if(search_value == ""){
			alert("Please enter your search term.");
		}else{
			$("#search_form").attr("action", "/album.do?pageNumber=1&pageSize=10");
			search_form.submit();
		}
	}
	
	function fn_goList(){
		location.href='/album.do?pageNumber=1&pageSize=10';
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
