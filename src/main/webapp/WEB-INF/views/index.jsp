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
			<img src="images/loop/index1.png">
		</div>
		<div class="item">
			<img src="images/loop/index2.png">
		</div>
		<div class="item">
			<img src="images/loop/index3.png">
		</div>
	</div>

	<a class="left carousel-control" href="#index-loop" role="button" data-slide="prev">
		<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	</a>
	<a class="right carousel-control" href="#index-loop" role="button" data-slide="next">
		<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	</a>
	
	<p style="padding:40px;font-size:14px;">
		MOOC（massive open online courses）是2012年由美国顶级大学陆续设立的网络学习平台，已为全球性网络系统学习的最新模式。在北京大学宣布“北大网络课程项目”启动后，哈师大西语学院顺应国际课程改革趋势，开设了以“当代大学生视角下中西方文化”为主题的MOOC微课程。
		哈师大学生MOOC讲师团是西语首创的一只学生网络教学团队，旨在打造网络教学平台，培训学生讲师，让学生参与到教学的全部环节，实现真正意义上的教学实践。
		西语MOOC讲师团遵循的教学特色是学生提出、学生筹备、学生授课、学生评估，把主导权全权交给学生。
		哈师大学生MOOC学院一直在为打造多种网络平台，进行课程内容的资源共享而前行。
	</p>
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