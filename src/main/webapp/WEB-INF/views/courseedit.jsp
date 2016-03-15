<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="author" content="xiaofo">
<title>慕课学</title>
<link href="<c:url value='/css/bootstrap.moocshit.css' />" rel="stylesheet"/>
<link href="<c:url value='/css/core.css' />" rel="stylesheet"/>
<link href="<c:url value='/css/course.css' />" rel="stylesheet"/>
<script src="<c:url value='/js/jquery.min.js' />"></script>
<script src="<c:url value='/js/bootstrap.min.js' />"></script>
<script src="<c:url value='/js/angular.min.js' />"></script>
<style>
	h1, h3, h5 {
		color: #286A46;
	}
	
	ul.course-list {
		text-align: left;
		padding-left: 20px;
		padding-top: 10px;
	}
	
	ul.course-list p {
		font-size: 12px;
		color: #787D82;
	}
</style>
</head>
<body>

<jsp:include page="header.jsp" flush="true">
	<jsp:param value="background" name="active" />
</jsp:include>

<div class="container">
<div class="row" style="padding-top:20px;">
	<div class="col-md-3">
		<jsp:include page="bgnavigator.jsp" flush="true">
			<jsp:param name="active" value="coursemanage"/>
		</jsp:include>
	</div>
	
	<div class="col-md-9">
		<div class="fleft" style="text-align:left;">
			<h1 class="main-color">课程简介</h1>
			<p style="font-size:16px;color:#787D82;">${masterplan.planDescription}</p>
		</div>
		<div class="course-category clearfix" style="border-width:1px 0 0 0;padding:0;width:100%;">
			<div style="text-align:left;">
				<h3>课程提纲</h3>
			</div>
			<ul class="course-list">
				<c:forEach items="${masterplan.courseList}" var="course">
					<li>
						<h5>
							第${course.courseIndex}课 ${course.courseName} 
							<button class="btn btn-success btn-xs">编辑</button>
							<button class="btn btn-danger btn-xs">删除</button>
						</h5>
						<p>${course.courseRemark}</p>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</div>
</div>

<jsp:include page="footer.jsp" flush="true"/>

</body>
</html>