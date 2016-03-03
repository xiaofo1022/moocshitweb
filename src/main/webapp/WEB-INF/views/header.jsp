<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-default" style="margin-bottom:0;">
	<div class="container-fluid">
		<div class="navbar-header">
			<a href="index" class="navbar-brand" style="padding-top:10px;">
				<span class="glyphicon glyphicon-education"></span>
				慕课学
			</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="index">首页</a></li>
				<li><a href="course">课程</a></li>
				<!-- 
				<li><a href="bbs.html">讨论区</a></li>
				-->
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="active"><a href="background">[个人中心 ]</a></li>
				<li><a href="#">退出</a></li>
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

<div id="login-modal" class="modal fade">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">用户登录</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="用户名">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="密码">
				</div>
				<div class="form-group" style="text-align:center;">
					<a href="register.html">没有账号？点击注册 ></a>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary">登录</button>
			</div>
		</div>
	</div>
</div>
