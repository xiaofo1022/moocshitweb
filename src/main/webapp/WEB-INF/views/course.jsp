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
</head>
<body>

<jsp:include page="header.jsp">
	<jsp:param value="course" name="active" />
</jsp:include>

<div class="outer-block clearfix" style="position:relative;margin-bottom:0;">
	<div class="course-category clearfix">
		<div class="course-block clearfix">
			<span class="fleft" style="margin-top:6px;">课程分类：</span>
			<c:forEach items="${courseTypeList}" var="typeItem">
				<c:choose>
					<c:when test="${typeItem.typeName == selectedType}">
						<p class="active">${typeItem.typeName}</p>
					</c:when>
					<c:otherwise>
						<p onclick="changeCourseType('${typeItem.typeName}')">${typeItem.typeName}</p>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
	</div>
	
	<div class="row-course">
		<c:forEach items="${courseList}" var="course" varStatus="status">
			<div class="fleft class-block course-outer" onclick="courseIntro(${course.id})">
				<div class="course-pic" style="background-image:url(http://7xrbxj.com1.z0.glb.clouddn.com/${course.planPicKey});"></div>
				<p style="padding-top:10px;">
					<span style="font-weight:bold;">课程：${course.planName}</span>
					<span>(共 ${course.courseCount} 课时)</span>
				</p>
				<p>
					<span>简介：${course.planDescription}</span>
				</p>
			</div>
		</c:forEach>
	</div>
</div>

<div class="bottom-pager">
	<nav style="display:inline-block;">
		<ul class="pagination">
			<li>
				<a href="#" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
				</a>
			</li>
			<li class="active"><a href="#">1</a></li>
			<li>
				<a href="#" aria-label="Next">
					<span aria-hidden="true">&raquo;</span>
				</a>
			</li>
		</ul>
	</nav>
</div>

<jsp:include page="footer.jsp"></jsp:include>

<script>
	var baseUrl = "<c:url value='/'/>";

	function changeCourseType(typeName) {
		location.assign(encodeURI(baseUrl + 'course?typeName=' + typeName));
	}
	
	function courseIntro(courseId) {
		location.assign(baseUrl + 'courseintro/' + courseId);
	}
</script>
</body>
</html>