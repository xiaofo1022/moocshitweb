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

<jsp:include page="header.jsp"></jsp:include>

<div class="outer-block clearfix" style="position:relative;margin-bottom:0;">
	<div class="course-category clearfix">
		<div class="course-block clearfix">
			<c:forEach items="${courseTypeList}" var="typeItem">
				<c:choose>
					<c:when test="${typeItem.id == courseType.id}">
						<p class="active">${typeItem.typeName}</p>
					</c:when>
					<c:otherwise>
						<p onclick="changeCourseType(${typeItem.id})">${typeItem.typeName}</p>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
	</div>
	
	<div class="row-course">
		<c:forEach items="${courseList}" var="course" varStatus="status">
			<div class="fleft class-all-list">
				<div class="class-block" onclick="courseDetail(${course.id})">
					<img src="<c:url value='/images/class-1.jpg' />"/>
					<h5>${course.courseName}：第${status.index + 1}课</h5>
				</div>
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
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#">6</a></li>
			<li><a href="#">7</a></li>
			<li><a href="#">8</a></li>
			<li><a href="#">9</a></li>
			<li><a href="#">10</a></li>
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

	function changeCourseType(courseTypeId) {
		location.assign(baseUrl + 'course/' + courseTypeId);
	}
	
	function courseDetail(courseId) {
		location.assign(baseUrl + 'courseDetail/' + courseId);
	}
</script>
</body>
</html>