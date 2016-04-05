<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	boolean isLogined = (request.getSession(false).getAttribute("user") != null);
	String active = request.getParameter("active");
%>
<nav class="navbar navbar-default" style="margin-bottom:0;">
	<div class="container-fluid">
		<div class="navbar-header">
			<a href="<c:url value='/index' />" class="navbar-brand" style="padding-top:10px;">
				<span class="glyphicon glyphicon-education"></span>
				慕课学
			</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li <% if (active != null && active.equals("index")) { %> class="active" <% } %>><a href="<c:url value='/index' />">首页</a></li>
				<li <% if (active != null && active.equals("course")) { %> class="active" <% } %>><a href="<c:url value='/course' />">课程</a></li>
				<!-- 
				<li><a href="bbs">讨论区</a></li>
				-->
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<% if (isLogined) { %>
					<li <% if (active != null && active.equals("background")) { %> class="active" <% } %>><a href="<c:url value='/coursemanage' />">[个人中心 ]</a></li>
					<li><a href="#" onclick="logout()">退出</a></li>
					<script>
						function logout() {
							var result = confirm("是否确认退出？");
							if (result) {
								$.get("<c:url value='/user/logout' />", function(data) {
									location.replace("<c:url value='/index' />");
								});
							}
						}
					</script>
				<% } else { %>
					<li><a href="#" data-toggle="modal" data-target="#login-modal">登录 / 注册</a></li>
					<div id="login-modal" class="modal fade">
						<div class="modal-dialog modal-sm">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									<h4 class="modal-title">用户登录</h4>
								</div>
								<div class="modal-body">
									<form name="login_form">
										<div class="form-group">
											<input id="login-name" type="text" class="form-control" placeholder="用户名" ng-model="loginUser.account" required>
										</div>
										<div class="form-group">
											<input id="login-pass" type="password" class="form-control" placeholder="密码" ng-model="loginUser.password" required>
										</div>
										<div class="form-group" style="text-align:center;">
											<a href="<c:url value='/register' />">没有账号？点击注册 </a>
										</div>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary" onclick="login()">登录</button>
								</div>
							</div>
						</div>
					</div>
					<script>
						function login() {
							var account = $('#login-name').val();
							var password = $('#login-pass').val();
							
							if (!account) {
								alert('请填写用户名');
								return;
							}
							if (!password) {
								alert('请填写密码');
								return;
							}
							
							$.ajax({
								url: "<c:url value='/user/login'/>",
								type: "POST",
								contentType : "application/json",
								data: JSON.stringify({account:account, password:password}),
								success: function(data) {
									if (data.message != 'success') {
										alert(data.message);
										return;
									} else {
										location.reload();
									}
								}
							});
						}
					</script>
				<% } %>
			</ul>
			<form class="navbar-form navbar-right" role="search">
				<div class="input-group">
					<input type="text" class="form-control" style="width:260px;border-radius:1px;" placeholder="输入课程名称，如：大学英语">
					<span class="input-group-btn">
						<button class="btn btn-default" style="border-radius:1px;" type="button">检索</button>
					</span>
				</div>
			</form>
		</div>
	</div>
</nav>
