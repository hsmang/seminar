<%@include file="../head.jsp"%>
<%@include file="../nav.jsp"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<script>
$(function(){
	var order = getQuerystring("order");
	$("#role_view option[value=" + order + "]").attr('selected', 'selected');
	
	$("#role_view").change(function(){
		/*var pageNumber = getQuerystring("pageNumber");
		var pageSize= getQuerystring("pageSize");*/
		location.href="/qna/qnaList.do?order=" + this.value + "&pageNumber=1&pageSize=10";
	})
})
</script>
<script type="text/javascript" src="/resources/js/admin/user_script.js"></script>
<div class="container">
	<!-- Page Heading/Breadcrumbs -->
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				Qna List
			</h1>
			<ol class="breadcrumb">
				<li><a href="index.html">Home</a></li>
				<li class="active">Qna</li>
			</ol>
		</div>
	</div>
	<br>
	<div class="row">
			<div class="col-md-3">
               <div class="list-group">
                   <a href="/user/userList.do?order=all&pageNumber=1&pageSize=10" class="list-group-item">Members</a>
                   <a href="/qna/qnaList.do?order=all&pageNumber=1&pageSize=10" class="list-group-item">Contact</a>
               </div>
           </div>
           <div class="col-md-9">
				<div class="row">
					<div class="btn-group">
						<select class="form-control" id="role_view">
							<option value="all">All</option>
							<option value="not">Not</option>
							<option value="done">Done</option>
						</select>
					</div>
				</div>
	

	<div class="table-responsive">
		<table class="table">
			<tr>
				<td>no</td>
				<td>email</td>
				<td>name</td>
				<td>phone</td>
				<td>subject</td>
				<td>date</td>
				<td>state</td>
			</tr>
			<c:choose>
				<c:when test="${fn:length(qnaList) > 0}">
					<c:forEach items="${qnaList }" var="qna">
						<tr>
							<td>${qna.qna_idx }</td>
							<td>${qna.user_email }</td>
							<td>${qna.user_name }</td>
							<td>${qna.user_hp}</td>
							<td><a href="/qna/detail.do?qna_idx=${qna.qna_idx}">${qna.qna_subject}</a></td>
							<td>${qna.reg_date }</td>
							<c:if test="${qna.qna_state == 0 }">
								<td>Not</td>
							</c:if>
							<c:if test="${qna.qna_state == 1 }">
								<td>Done</td>
							</c:if>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</table>
	</div>
	</div>
	</div>


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

	

	<hr>

<%@include file="../footer.jsp"%>
