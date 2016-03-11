<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="author" content="xiaofo">
<title>慕课学</title>
<link href="<c:url value='/css/bootstrap.moocshit.css' />" rel="stylesheet" />
<link href="<c:url value='/css/core.css' />" rel="stylesheet"/>
<link href="<c:url value='/css/course.css' />" rel="stylesheet"/>
<script src="<c:url value='/js/jquery.min.js' />"></script>
<script src="<c:url value='/js/bootstrap.min.js' />"></script>
<script src="<c:url value='/js/angular.min.js'/>"></script>
<script src="<c:url value='/js/angular/login.js'/>"></script>
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

<jsp:include page="header.jsp">
	<jsp:param value="course" name="active" />
</jsp:include>

<div class="outer-block clearfix" style="position:relative;margin-bottom:0;margin-top:0;">
	<div class="course-category clearfix" style="border-top-width:0;padding:10px 0 10px 0;">
		<div class="fleft" style="text-align:left;">
			<h1>课程简介</h1>
			<p style="font-size:16px;color:#787D82;">${masterplan.planDescription}</p>
		</div>
		<div class="fright" style="padding-top:15px;">
			<button class="btn btn-danger btn-lg" style="border-radius:0px;">选修此课</button>
			<p style="margin-top:10px;">[已有 <span style="color:#D9534F;">18</span> 人选修]</p>
		</div>
	</div>
</div>

<div class="outer-block clearfix" style="position:relative;margin-bottom:10px;margin-top:0px;">
	<div class="course-category clearfix" style="border-width:0;padding:0;">
		<div style="text-align:left;">
			<h3>课程提纲</h3>
		</div>
		<ul class="course-list">
			<c:forEach items="${masterplan.courseList}" var="course">
				<li>
					<h5>第${course.courseIndex}课 ${course.courseName}</h5>
					<p>${course.courseRemark}</p>
				</li>
			</c:forEach>
		</ul>
	</div>
</div>

<jsp:include page="footer.jsp"></jsp:include>

<script>

</script>
</body>
</html>