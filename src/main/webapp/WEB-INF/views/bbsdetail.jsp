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
	h6 {
		color:#000;
		background-color:#fff;
		padding:0px;
		padding-bottom:10px;
		margin-bottom:10px;
		border-bottom:1px solid #ccc;
	}
	
	h5 {
		font-size:12px;
		background-color:#F0F3F5;
		color:#ccc;
		padding:10px;
	}
	
	.main-info {
		border-bottom:1px solid #ccc;
		padding-bottom:10px;
	}
	
	.comment-info {
		padding-left:10px;
		padding-bottom:10px;
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
			<h3>谁有第一课的讲义，急！</h3>
			<h6>2015-9-4 9:18 来自：<a href="#">张自力</a></h6>
			<p class="main-info">
				谁有第一课的讲义课件，我的电子版的找不到了，急需最新版下载地址，谁有下载链接？<br/>
				百度网盘，360云盘的都可以！<br/>
				谢啦！
			</p>
			<p>
				<h5>2015-9-4 12:12 来自：<a href="#">梁志军</a></h5>
				<p class="comment-info">建议去pan1234看看，那里资源比较全。</p>
			</p>
			<p>
				<h5>2015-9-4 14:12 来自：<a href="#">吴志贞</a></h5>
				<p class="comment-info">还是问老师要吧，网上应该不太好找。</p>
			</p>
			<p>
				<h5>2015-9-4 15:12 来自：<a href="#">柳发银</a></h5>
				<p class="comment-info">http://pan.baidu.com/sfgk987</p>
			</p>
		</div>
	</div>
	
	<div class="col-md-4">
		<div class="panel panel-default" style="margin-top:20px;">
			<div class="panel-heading">
				参与讨论
			</div>
			<div class="panel-body">
				<div class="form-group clearfix">
					<textarea class="form-control fright" rows="4" placeholder="我的回应"></textarea>
				</div>
				<div class="form-group">
					<button class="btn btn-primary fright">提交</button>
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

</body>
</html>