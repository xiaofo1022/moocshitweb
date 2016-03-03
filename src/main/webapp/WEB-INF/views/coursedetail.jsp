<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="author" content="xiaofo">
<title>慕课学</title>
<link href="css/bootstrap.moocshit.css" rel="stylesheet"/>
<link href="css/core.css" rel="stylesheet"/>
<link href="css/coursedetail.css" rel="stylesheet"/>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-default" style="margin-bottom:0;">
	<div class="container-fluid">
		<div class="navbar-header">
			<a href="index.html" class="navbar-brand" style="padding-top:10px;">
				<span class="glyphicon glyphicon-education"></span>
				慕课学
			</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="index.html">首页</a></li>
				<li class="active"><a href="course.html">课程</a></li>
				<li><a href="bbs.html">讨论区</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="background.html">[个人中心 ]</a></li>
				<li><a href="#">退出</a></li>
			</ul>
			<form class="navbar-form navbar-right" role="search">
				<div class="input-group">
					<input type="text" class="form-control" style="width:260px;border-radius:1px;" placeholder="输入课程名称，如：大学英语">
					<span class="input-group-btn">
						<button class="btn btn-default" style="border-radius:1px;" type="button">检索</button>
					</span>
				</div>
			</form>
		</div>
	</div>
</nav>

<div class="container">
<div class="row" style="margin:60px 0;">
	<div class="col-md-8">
		<div>
			<video controls style="width:100%;">
				<source src="video/1.mp4" type="video/mp4"/>
			</video>
			<div class="video-bar clearfix">
				<p class="fleft">
					第一课：语法详解
				</p>
				<p class="fright">
					评分：
					<span class="glyphicon glyphicon-star yellow-star"></span>
					<span class="glyphicon glyphicon-star yellow-star"></span>
					<span class="glyphicon glyphicon-star yellow-star"></span>
					<span class="glyphicon glyphicon-star yellow-star"></span>
					<span class="glyphicon glyphicon-star yellow-star"></span>
					9.9
				</p>
				<p class="fright">评论：20条</p>
				<p class="fright">播放次数：1320次</p>
			</div>
		</div>
	</div>
	<div class="col-md-4">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="btn-group btn-group-justified" role="group">
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default btn-course active" onclick="changeCoursePage(this, 'course-list')">目录</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default btn-course" onclick="changeCoursePage(this, 'comment-list')">评论</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default btn-course" onclick="changeCoursePage(this, 'course-detail')">简介</button>
					</div>
				</div>
			</div>
			<div class="panel-body" style="height:390px;">
				<div id="course-list" class="course-page">
					<ul class="list-group" style="margin-bottom:0;">
						<li class="list-group-item active">
							第1课：语法详解
							<span style="float:right;">44:56</span>
						</li>
						<li class="list-group-item">
							第2课：语法详解
							<span style="float:right;">44:56</span>
						</li>
						<li class="list-group-item">
							第3课：语法详解
							<span style="float:right;">44:56</span>
						</li>
						<li class="list-group-item">
							第4课：语法详解
							<span style="float:right;">44:56</span>
						</li>
						<li class="list-group-item">
							第5课：语法详解
							<span style="float:right;">44:56</span>
						</li>
						<li class="list-group-item">
							第6课：语法详解
							<span style="float:right;">44:56</span>
						</li>
						<li class="list-group-item">
							第7课：语法详解
							<span style="float:right;">44:56</span>
						</li>
						<li class="list-group-item">
							第8课：语法详解
							<span style="float:right;">44:56</span>
						</li>
					</ul>
				</div>
				
				<div id="comment-list" class="course-page comment-page">
					<div class="clearfix comment-row">
						<div class="clearfix">
							<a href="#" class="fleft">张自力</a>
							<p class="fright ml10">
								<span class="glyphicon glyphicon-star yellow-star"></span>
								<span class="glyphicon glyphicon-star yellow-star"></span>
								<span class="glyphicon glyphicon-star yellow-star"></span>
								<span class="glyphicon glyphicon-star yellow-star"></span>
								<span class="glyphicon glyphicon-star yellow-star"></span>
							</p>
							<p class="fright">2015-9-3 20:22</p>
						</div>
						<p>
							确实不错，讲得很细，赞！
						</p>
					</div>
					<div class="clearfix comment-row">
						<div class="clearfix">
							<a href="#" class="fleft">梁志军</a>
							<p class="fright ml10">
								<span class="glyphicon glyphicon-star yellow-star"></span>
								<span class="glyphicon glyphicon-star yellow-star"></span>
								<span class="glyphicon glyphicon-star yellow-star"></span>
								<span class="glyphicon glyphicon-star yellow-star"></span>
								<span class="glyphicon glyphicon-star-empty yellow-star"></span>
							</p>
							<p class="fright">2015-9-2 21:20</p>
						</div>
						<p>
							有些地方听的不是很明白，需要多看几遍。
						</p>
					</div>
					<div class="clearfix comment-row">
						<div class="clearfix">
							<a href="#" class="fleft">吴志贞</a>
							<p class="fright ml10">
								<span class="glyphicon glyphicon-star yellow-star"></span>
								<span class="glyphicon glyphicon-star yellow-star"></span>
								<span class="glyphicon glyphicon-star yellow-star"></span>
								<span class="glyphicon glyphicon-star yellow-star"></span>
								<span class="glyphicon glyphicon-star yellow-star"></span>
							</p>
							<p class="fright">2015-9-1 12:20</p>
						</div>
						<p>
							很喜欢这个老师讲课的风格！
						</p>
					</div>
					<div class="comment-block clearfix">
						<textarea class="form-control" placeholder="我的评论" rows="3"></textarea>
						<button class="btn btn-primary mt10 fright">提交</button>
						<p class="mt10 comment-star fleft">
							<span class="glyphicon glyphicon-star-empty yellow-star"></span>
							<span class="glyphicon glyphicon-star-empty yellow-star"></span>
							<span class="glyphicon glyphicon-star-empty yellow-star"></span>
							<span class="glyphicon glyphicon-star-empty yellow-star"></span>
							<span class="glyphicon glyphicon-star-empty yellow-star"></span>
						</p>
					</div>
				</div>
				
				<div id="course-detail" class="course-page detail-block">
					<h3>课程：语法详解1</h3>
					<h5>讲师：柳发银</h5>
					<p>	
						简介：英语是世界上使用最广泛的的语言，直接影响每个人的工作生活。
						学好英语，升学求职更如意。本专题将从三个方面教你如何玩转英语
						~原来英语如此有趣~
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
</div>

<div class="footer" style="position:absolute;bottom:0;">
	Copyright © 2015 Neau Computer Department All Rights Reserved
	| 网站首页
	| 高校联盟
	| 关于我们
	| 意见反馈
	| 友情链接
</div>

<script>
	function changeCoursePage(element, id) {
		$(".btn-course").removeClass("active");
		$(element).addClass("active");
		$(".course-page").css("display", "none");
		$("#" + id).css("display", "block");
	}
</script>
</body>
</html>