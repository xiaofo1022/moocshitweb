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