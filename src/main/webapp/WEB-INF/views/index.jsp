<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<script src="js/angular/login.js"></script>
</head>
<body>

<jsp:include page="header.jsp" flush="true">
	<jsp:param value="index" name="active" />
</jsp:include>

<div id="index-loop" class="carousel slide" data-ride="carousel">
	<ol class="carousel-indicators">
		<li data-target="#index-loop" data-slide-to="0" class="active"></li>
		<li data-target="#index-loop" data-slide-to="1"></li>
		<li data-target="#index-loop" data-slide-to="2"></li>
	</ol>

	<div class="carousel-inner" role="listbox">
		<div class="item active">
			<img src="images/loop/loop-4.jpg">
		</div>
		<div class="item">
			<img src="images/loop/loop-5.png">
		</div>
		<div class="item">
			<img src="images/loop/loop-1.jpg">
		</div>
	</div>

	<a class="left carousel-control" href="#index-loop" role="button" data-slide="prev">
		<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	</a>
	<a class="right carousel-control" href="#index-loop" role="button" data-slide="next">
		<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	</a>
</div>

<div class="outer-block">
	<div class="row-margin">
		<div class="class-col clearfix">
			<div class="fleft hot-title" style="background-color:#DB5700;">
				<h2 onclick="seeMore()">热门课程 &gt;</h2>
			</div>
			<c:forEach items="${hotestCourseList}" var="hotestCourse">
				<div class="fleft class-list" onclick="toDetail(${hotestCourse.id})">
					<div class="class-block">
						<img src="images/class-1.jpg"/>
						<h5>${hotestCourse.courseType.typeName }：${hotestCourse.courseName}</h5>
						<h6>播放：${hotestCourse.playTimes}次</h6>
					</div>
				</div>
			</c:forEach>
			<div class="fleft class-list">
				<div data-type="see-more" class="class-block" onclick="seeMore()">
					<img src="images/class-10.jpg"/>
					<h6>&nbsp;</h6>
					<h6>查看更多 &gt;</h6>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row row-margin">
		<div class="class-col clearfix">
			<div class="fleft hot-title" style="background-color:#F39D00;">
				<h2 onclick="seeMore()">精品课程 &gt;</h2>
			</div>
			<c:forEach items="${bestCourseList}" var="bestCourse">
				<div class="fleft class-list" onclick="toDetail(${bestCourse.id})">
					<div class="class-block">
						<img src="images/class-12.jpg"/>
						<h5>${bestCourse.courseType.typeName }：${bestCourse.courseName}</h5>
						<h6>
							评分：
							<jsp:include page="stars.jsp">
								<jsp:param value="${bestCourse.totalScore}" name="stars"/>
							</jsp:include>
							${bestCourse.totalScore}
						</h6>
					</div>
				</div>
			</c:forEach>
			<div class="fleft class-list">
				<div data-type="see-more" class="class-block" onclick="seeMore()">
					<img src="images/class-10.jpg"/>
					<h6>&nbsp;</h6>
					<h6>查看更多 &gt;</h6>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row row-margin">
		<div class="class-col clearfix">
			<div class="fleft hot-title" style="background-color:#5CABFE;">
				<h2 onclick="seeMore()">最新课程 &gt;</h2>
			</div>
			<c:forEach items="${hotestCourseList}" var="latestCourse">
				<div class="fleft class-list" onclick="toDetail(${latestCourse.id})">
					<div class="class-block">
						<img src="images/class-7.jpg"/>
						<h5>${latestCourse.courseType.typeName }：${latestCourse.courseName}</h5>
						<h6>更新时间：<fmt:formatDate pattern="yyyy-MM-dd" value="${latestCourse.updateDatetime}" /></h6>
					</div>
				</div>
			</c:forEach>
			<div class="fleft class-list">
				<div data-type="see-more" class="class-block" onclick="seeMore()">
					<img src="images/class-10.jpg"/>
					<h6>&nbsp;</h6>
					<h6>查看更多 &gt;</h6>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="footer.jsp" flush="true"/>

<script>
	$('.carousel').carousel();
	
	function toDetail(courseId) {
		location.assign("<c:url value='/courseDetail/" + courseId + "'/>");
	}
	
	function seeMore() {
		location.assign("<c:url value='/course'/>");
	}
</script>
</body>
</html>