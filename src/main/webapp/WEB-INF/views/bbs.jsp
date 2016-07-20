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
<style>
	p {
		display:inline-block;
		margin:0;
	}

	.bbs-bar {
		border-top:1px solid #ccc;
		margin-top:5px;
		padding-top:5px;
		font-size:12px;
	}
</style>
</head>
<body>
<jsp:include page="header.jsp" flush="true">
	<jsp:param value="bbs" name="active" />
</jsp:include>

<div class="container">
<div class="row">
	<div class="col-md-8">
		<div class="bbs-block clearfix">
			<div class="panel panel-default">
				<div class="panel-heading">
					<a href="#">张自力</a>：
					<p>谁有第一课的讲义，急！</p>
				</div>
				<div class="panel-body">
					<div class="clearfix">
						<p>谁有第一课的讲义课件，我的电子版的找不到了，急需最新版下载地址，谁有...</p>
						<button class="btn btn-primary btn-xs fright" onclick="toBBSDetail()">查看详情</button>
					</div>
					<div class="bbs-bar clearfix">
						分类：
						<a href="#">大学英语</a>
						<a href="#">语言学习</a>
						<a href="#" class="fright ml10">发布于 2015-9-4 9:18</a>
						<a href="#" class="fright ml10">回帖：3</a>
						<a href="#" class="fright">浏览：12</a>
					</div>
				</div>
			</div>
			
			<div class="panel panel-default">
				<div class="panel-heading">
					<a href="#">梁志军</a>：
					<p>求四级真题推荐！！！</p>
				</div>
				<div class="panel-body">
					<div class="clearfix">
						<p>最近准备开始攻四级真题，但是市面上真题种类太繁多，不知道如何选择...</p>
						<button class="btn btn-primary btn-xs fright" onclick="toBBSDetail()">查看详情</button>
					</div>
					<div class="bbs-bar clearfix">
						分类：
						<a href="#">四六级考试</a>
						<a href="#">真题详解</a>
						<a href="#" class="fright ml10">发布于 2015-9-3 12:8</a>
						<a href="#" class="fright ml10">回帖：6</a>
						<a href="#" class="fright">浏览：17</a>
					</div>
				</div>
			</div>
			
			<div class="panel panel-default">
				<div class="panel-heading">
					<a href="#">吴志贞</a>：
					<p>看原声电影对英语听力有没有帮助？</p>
				</div>
				<div class="panel-body">
					<div class="clearfix">
						<p>想练听力，很多人推荐看原声电影，不带字幕的，我想知道这样真的有效吗...</p>
						<button class="btn btn-primary btn-xs fright" onclick="toBBSDetail()">查看详情</button>
					</div>
					<div class="bbs-bar clearfix">
						分类：
						<a href="#">大学英语</a>
						<a href="#">听力</a>
						<a href="#" class="fright ml10">发布于 2015-9-2 11:22</a>
						<a href="#" class="fright ml10">回帖：3</a>
						<a href="#" class="fright">浏览：12</a>
					</div>
				</div>
			</div>
			
			<nav style="position:absolute;bottom:0;right:20px;">
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
	</div>
	<div class="col-md-4">
		<div class="panel panel-default" style="margin-top:20px;">
			<div class="panel-heading">
				发起讨论
			</div>
			<div class="panel-body">
				<div class="form-group">
					<label class="control-label">课程</label>
					<select class="form-control" style="width:90%;display:inline-block;">
						<option>大学英语</option>
						<option>托福雅思</option>
						<option>四六级考试</option>
					</select>
				</div>
				<div class="form-group">
					<label class="control-label">分类</label>
					<select class="form-control" style="width:90%;display:inline-block;">
						<option>语言学习</option>
						<option>日常实用英语</option>
						<option>出国考试英语</option>
					</select>
				</div>
				<div class="form-group">
					<label class="control-label">标题</label>
					<input type="text" class="form-control" placeholder="输入讨论标题" style="width:90%;display:inline-block;"/>
				</div>
				<div class="form-group clearfix">
					<textarea class="form-control fright" rows="4" placeholder="输入你想讨论的内容" style="width:90%;display:inline-block;"></textarea>
				</div>
				<div class="form-group">
					<button class="btn btn-primary fright" style="width:90%;display:inline-block;">发起讨论</button>
				</div>
			</div>
		</div>
	</div>
</div>
</div>

<div class="footer">
	Copyright © 2015 Neau Computer Department All Rights Reserved
	| 网站首页
	| 高校联盟
	| 关于我们
	| 意见反馈
	| 友情链接
</div>

<script>
	function toBBSDetail() {
		location.assign("<c:url value='/bbsdetail'/>");
	}
</script>

</body>
</html>