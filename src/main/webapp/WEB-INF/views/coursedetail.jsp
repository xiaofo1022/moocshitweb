<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="author" content="xiaofo">
<title>慕课学</title>
<link href="<c:url value='/css/bootstrap.moocshit.css'/>" rel="stylesheet"/>
<link href="<c:url value='/css/core.css'/>" rel="stylesheet"/>
<link href="<c:url value='/css/coursedetail.css'/>" rel="stylesheet"/>
<script src="<c:url value='/js/jquery.min.js'/>"></script>
<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/js/angular.min.js'/>"></script>
<script src="<c:url value='/js/angular/coursedetail.js'/>"></script>
<script src="<c:url value='/js/angular/login.js'/>"></script>
</head>
<body>

<jsp:include page="header.jsp" flush="true"/>

<input id="course_id" type="hidden" value="${course.id}"/>

<div class="container" ng-app="coursedetail">
<div class="row" style="margin:60px 0;">
	<div class="col-md-8">
		<div>
			<video controls style="width:100%;">
				<source ng-model="course" src="http://7xrbxj.com1.z0.glb.clouddn.com/${course.courseVideoKey}" type="video/mp4"/>
			</video>
			<div class="video-bar clearfix">
				<p class="fleft" ng-model="course">
					${course.courseType.typeName} : ${course.courseName}
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
						<c:forEach items="${courseList}" var="courseItem" varStatus="status">
							<c:choose>
								<c:when test="${courseItem.id == course.id}">
									<li class="list-group-item active">
										第${status.index + 1}课：${courseItem.courseName}
										<span style="float:right;">44:56</span>
									</li>
								</c:when>
								<c:otherwise>
									<li class="list-group-item">
										第${status.index + 1}课：${courseItem.courseName}
										<span style="float:right;">44:56</span>
									</li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
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
					<h3>课程：${course.courseName}</h3>
					<h5>讲师：${course.uploadUser.username}</h5>
					<p>	
						简介：${course.courseRemark}
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
</div>

<jsp:include page="footer.jsp" flush="true"/>

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