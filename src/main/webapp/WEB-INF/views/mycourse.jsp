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
<script src="js/angular/mycourse.js"></script>
</head>
<body ng-app="mycourse">

<jsp:include page="header.jsp" flush="true"/>

<div class="container">
<div class="row" style="padding-top:20px;">
	<div class="col-md-3">
		<jsp:include page="bgnavigator.jsp" flush="true">
			<jsp:param value="mycourse" name="active"/>
		</jsp:include>
	</div>
	
	<div class="col-md-9" ng-controller="MyCourseController">
		<h3>我的课程</h3>
		<div class="clearfix">
			<div ng-repeat="course in courseList" class="fleft class-list" ng-click="toCourseDetail(course.id)">
				<div class="class-block">
					<img src="images/class-1.jpg"/>
					<h5>{{course.courseType.typeName}} - {{course.courseName}}</h5>
				</div>
			</div>
		</div>
	</div>
</div>
</div>

<jsp:include page="footer.jsp" flush="true"/>

</body>
</html>