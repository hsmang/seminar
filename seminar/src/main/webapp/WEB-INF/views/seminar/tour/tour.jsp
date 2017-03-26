<%@include file="../../head.jsp"%>
<%@include file="../../nav.jsp"%>
<%@ page language ="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page session="true" %>
<%@page import="jp.seminar.user.model.UserVO"%>

<div class="container">
	<!-- Page Heading/Breadcrumbs -->
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">観光事業関連</h1>
			<ol class="breadcrumb">
				<li><a href="/index.do">Home</a></li>
				<li class="active">観光事業関連</li>
			</ol>
		</div>
	</div>
	<br>

	<c:choose>
				<c:when test="${fn:length(boardList) > 0}">
					<c:forEach items="${boardList }" var="list">
						<div class="row">
				            <div class="col-md-7">
				                <a href="/tour/detail.do?board_idx=${list.board_idx }&f_type=TO">
				                    <img class="img-responsive img-hover tour_main_img" src="${list.main_img }" alt="">
				                </a>
				            </div>
				            <div class="col-md-5">
				                <h3><a href="/tour/detail.do?board_idx=${list.board_idx }&f_type=TO" id="subject">${list.board_subject }</a></h3>
				                <h4>${list.user_name } <span class="pull-right"><fmt:parseDate value='${list.board_update_date }' var='update_date' pattern='yyyy-MM-dd'/>
								<fmt:formatDate value="${update_date}" pattern="yyyy.MM.dd"/></span></h4>
				                <p>${list.board_content }</p>
				                <a class="btn btn-primary" href="/tour/detail.do?board_idx=${list.board_idx }&f_type=TO">View</i></a>
				            </div>
				        </div>
				        <hr>
					</c:forEach>
				</c:when>
			</c:choose>

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
		if(user != null){
	%><button type="button" id="btn_insert" class="btn btn-default" onclick="location.href='/tour/insert.do'" >作成</button>
	<%} %>
	</form>
	<hr>
	
	<script>
	function fn_search(){
		var search_value = $('#search_value').val();
		if(search_value == ""){
			alert("Please enter your search term.");
		}else{
			$("#search_form").attr("action", "/tour.do?pageNumber=1&pageSize=10");
			search_form.submit();
		}
	}
	
	function fn_goList(){
		location.href='/tour.do?pageNumber=1&pageSize=10';
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
