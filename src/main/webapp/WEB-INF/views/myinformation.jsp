<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="author" content="xiaofo">
<title>慕课学</title>
<link href="css/bootstrap.moocshit.css" rel="stylesheet"/>
<link href="css/core.css" rel="stylesheet"/>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/angular.min.js"></script>
<script src="js/angular/information.js"></script>
</head>
<body ng-app="information">

<jsp:include page="header.jsp" flush="true"/>

<div class="container">
<div class="row" style="padding-top:20px;">
	<div class="col-md-3">
		<jsp:include page="bgnavigator.jsp" flush="true">
			<jsp:param name="active" value="myinformation"/>
		</jsp:include>
	</div>
	
	<div class="col-md-6 col-md-offset-1" ng-controller="InformationController">
		<form name="information_form" class="clearfix" style="margin:40px 0;">
			<input id="user-id" type="hidden" ng-model="user.id" value="${userId}" />
			<div class="form-group">
				<input type="text" class="form-control" placeholder="用户名" ng-model="user.username" required>
			</div>
			<div class="form-group">
				<input type="password" class="form-control" placeholder="密码" ng-model="user.password" required>
			</div>
			<div class="form-group">
				<input type="text" class="form-control" placeholder="邮箱" ng-model="user.email">
			</div>
			<div class="form-group">
				<input type="text" class="form-control" placeholder="电话" ng-minlength="11" ng-maxlength="11" ng-model="user.phone">
			</div>
			<div class="form-group">
				<textarea class="form-control" placeholder="个人简介" rows="4" ng-model="user.remark"></textarea>
			</div>
			<div class="form-group" style="text-align:center;">
				<button class="btn btn-primary" ng-disabled="information_form.$invalid" ng-click="submit()">提交</button>
			</div>
		</form>
	</div>
</div>
</div>

<jsp:include page="footer.jsp" flush="true"/>

</body>
</html>