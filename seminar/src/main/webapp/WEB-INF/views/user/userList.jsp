<%@include file="../head.jsp"%>
<%@include file="../nav.jsp"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<script>
$(function(){
	var order = getQuerystring("order");
	$("#role_view option[value=" + order + "]").attr('selected', 'selected');
	
	$("#role_view").change(function(){
		location.href="/user/userList.do?order=" + this.value + "&pageNumber=1&pageSize=10";
	})
})
</script>
<script type="text/javascript" src="/resources/js/admin/user_script.js"></script>
<div class="container">
	<!-- Page Heading/Breadcrumbs -->
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				Members<small> Member List</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="index.html">Home</a></li>
				<li class="active">Members</li>
			</ol>
		</div>
	</div>
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
						<option value="admin">Admin</option>
						<option value="manager">Manager</option>
						<option value="member">Memeber</option>
					</select>
				</div>
			</div>
		
	
		<div class="table-responsive">
			<table class="table">
				<tr>
					<td>no</td>
					<td>email</td>
					<td>name</td>
					<td>student no</td>
					<td>phone no</td>
					<td>date</td>
					<td>role</td>
					<td>role_change</td>
					<td>state_change</td>
				</tr>
				<c:choose>
					<c:when test="${fn:length(userList) > 0}">
						<c:forEach items="${userList }" var="user">
							<tr>
								<td>${user.user_idx }</td>
								<td>${user.user_email }</td>
								<td>${user.user_name }</td>
								<td>${user.user_no }</td>
								<td>${user.user_hp}</td>
								<td>${user.reg_date }</td>
								<c:if test="${user.user_role == 0 }">
									<td>Admin</td>
								</c:if>
								<c:if test="${user.user_role == 1 }">
									<td>Manager</td>
								</c:if>
								<c:if test="${user.user_role == 2 }">
									<td>Member</td>
								</c:if>
								<td>
								<div class="btn-group">
									<select class="form-control" id="role_change" onchange="role_change(${user.user_idx } , this.value)">
								<c:if test="${user.user_role == 0 }">
									<option selected value="0">Admin</option>
									<option value="1">Manager</option>
									<option value="2">Member</option>
								</c:if>
								<c:if test="${user.user_role == 1 }">
									<option value="0">Admin</option>
									<option selected value="1">Manager</option>
									<option value="2">Member</option>
								</c:if>
								<c:if test="${user.user_role == 2 }">
									<option value="0">Admin</option>
									<option value="1">Manager</option>
									<option selected value="2">Member</option>
								</c:if>
									</select>
									</div>
								</td>
								<td>
								<div class="btn-group">
									<select class="form-control" id="state_change" onchange="state_change(${user.user_idx } , this.value)">
								<c:if test="${user.user_state == 0 }">
									<option selected value="0">waiting</option>
									<option value="1">Member</option>
									<option value="2">Out</option>
								</c:if>
								<c:if test="${user.user_state == 1 }">
									<option value="0">Waiting</option>
									<option selected value="1">Member</option>
									<option value="2">Out</option>
								</c:if>
								<c:if test="${user.user_state == 2 }">
									<option value="0">Waiting</option>
									<option value="1">Member</option>
									<option selected value="2">Out</option>
								</c:if>
									</select>
									</div>
								</td>
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
