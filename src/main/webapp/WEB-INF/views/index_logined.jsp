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
</head>
<body>

<jsp:include page="header.jsp" flush="true"/>

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
				<h2 onclick="seeMore()">热门课程 ></h2>
			</div>
			<div class="fleft class-list">
				<div class="class-block">
					<img src="images/class-1.jpg"/>
					<h5>大学英语：第1课</h5>
					<h6>播放：1320次</h5>
				</div>
			</div>
			<div class="fleft class-list">
				<div class="class-block">
					<img src="images/class-2.jpg"/>
					<h5>大学英语：第2课</h5>
					<h6>播放：1221次</h5>
				</div>
			</div>
			<div class="fleft class-list">
				<div class="class-block">
					<img src="images/class-3.jpg"/>
					<h5>大学英语：第3课</h5>
					<h6>播放：1199次</h5>
				</div>
			</div>
			<div class="fleft class-list">
				<div data-type="see-more" class="class-block" onclick="seeMore()">
					<img src="images/class-10.jpg"/>
					<h6>&nbsp;</h6>
					<h6>查看更多 ></h6>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row row-margin">
		<div class="class-col clearfix">
			<div class="fleft hot-title" style="background-color:#F39D00;">
				<h2 onclick="seeMore()">精品课程 ></h2>
			</div>
			<div class="fleft class-list">
				<div class="class-block">
					<img src="images/class-12.jpg"/>
					<h5>考试培训：第1课</h5>
					<h6>
						评分：
						<span class="glyphicon glyphicon-star yellow-star"></span>
						<span class="glyphicon glyphicon-star yellow-star"></span>
						<span class="glyphicon glyphicon-star yellow-star"></span>
						<span class="glyphicon glyphicon-star yellow-star"></span>
						<span class="glyphicon glyphicon-star yellow-star"></span>
						9.9
					</h6>
				</div>
			</div>
			<div class="fleft class-list">
				<div class="class-block">
					<img src="images/class-5.jpg"/>
					<h5>考试培训：第2课</h5>
					<h6>
						评分：
						<span class="glyphicon glyphicon-star yellow-star"></span>
						<span class="glyphicon glyphicon-star yellow-star"></span>
						<span class="glyphicon glyphicon-star yellow-star"></span>
						<span class="glyphicon glyphicon-star yellow-star"></span>
						<span class="glyphicon glyphicon-star yellow-star"></span>
						9.8
					</h6>
				</div>
			</div>
			<div class="fleft class-list">
				<div class="class-block">
					<img src="images/class-6.jpg"/>
					<h5>考试培训：第3课</h5>
					<h6>
						评分：
						<span class="glyphicon glyphicon-star yellow-star"></span>
						<span class="glyphicon glyphicon-star yellow-star"></span>
						<span class="glyphicon glyphicon-star yellow-star"></span>
						<span class="glyphicon glyphicon-star yellow-star"></span>
						<span class="glyphicon glyphicon-star yellow-star"></span>
						9.7
					</h6>
				</div>
			</div>
			<div class="fleft class-list">
				<div data-type="see-more" class="class-block" onclick="seeMore()">
					<img src="images/class-10.jpg"/>
					<h6>&nbsp;</h6>
					<h6>查看更多 ></h6>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row row-margin">
		<div class="class-col clearfix">
			<div class="fleft hot-title" style="background-color:#5CABFE;">
				<h2 onclick="seeMore()">最新课程 ></h2>
			</div>
			<div class="fleft class-list">
				<div class="class-block">
					<img src="images/class-7.jpg"/>
					<h5>单词强化：第1课</h5>
					<h6>更新时间：2015-9-3</h6>
				</div>
			</div>
			<div class="fleft class-list">
				<div class="class-block">
					<img src="images/class-8.jpg"/>
					<h5>单词强化：第2课</h5>
					<h6>更新时间：2015-9-2</h6>
				</div>
			</div>
			<div class="fleft class-list">
				<div class="class-block">
					<img src="images/class-9.jpg"/>
					<h5>单词强化：第3课</h5>
					<h6>更新时间：2015-9-1</h6>
				</div>
			</div>
			<div class="fleft class-list">
				<div data-type="see-more" class="class-block" onclick="seeMore()">
					<img src="images/class-10.jpg"/>
					<h6>&nbsp;</h6>
					<h6>查看更多 ></h6>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="footer.jsp" flush="true"/>

<script>
	$('.carousel').carousel();
	
	$(".class-block [data-type!='see-more']").click(function(e) {
		location.assign("coursedetail.html");
	});
	
	function seeMore() {
		location.assign("course.html");
	}
</script>
</body>
</html>