<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<body ng-app="coursedetail">

<jsp:include page="header.jsp" flush="true"/>

<input id="course_id" type="hidden" value="${course.id}"/>
<input id="user_id" type="hidden" value="${userId}"/>
<input id="course_plan_id" type="hidden" value="${course.coursePlanId}"/>

<div class="container">
<div class="row" style="margin:60px 0;">
	<div class="col-md-8">
		<div>
			<video id="video" controls autoplay style="width:100%;">
				<source ng-model="course" src="http://7xrbxj.com1.z0.glb.clouddn.com/${course.courseVideoKey}" type="video/mp4"/>
			</video>
			<div class="video-bar clearfix">
				<p class="fleft" ng-model="course">
					${coursePlan.planName} : ${course.courseName}
				</p>
				<p class="fright">
					评分：
					<jsp:include page="stars.jsp">
						<jsp:param value="${course.totalScore}" name="stars"/>
					</jsp:include>
					${course.totalScore}
				</p>
				<p class="fright">评论：${commentCount}条</p>
				<p class="fright">播放次数：${course.playTimes}次</p>
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
										<c:choose>
											<c:when test="${courseItem.courseIndex == lastCourseIndex}">
												<span style="float:right;">
													[已修]
													<a style="color:#fff;" onclick="getExercises(event, ${courseItem.id})">做题</a>
												</span>
											</c:when>
											<c:when test="${courseItem.courseIndex == studyProgress}">
												<span style="float:right;">[学习中]</span>
											</c:when>
											<c:when test="${courseItem.courseIndex < studyProgress}">
												<span style="float:right;">
													[已修]
													<a style="color:#fff;" onclick="getExercises(event, ${courseItem.id})">做题</a>
												</span>
											</c:when>
											<c:otherwise>
												<span style="float:right;">[未修]</span>
											</c:otherwise>
										</c:choose>
									</li>
								</c:when>
								<c:otherwise>
									<li class="list-group-item" onclick="toSelectedCourse(this, ${courseItem.id})">
										第${status.index + 1}课：${courseItem.courseName}
										<c:choose>
											<c:when test="${courseItem.courseIndex == lastCourseIndex}">
												<span style="float:right;">
													[已修]
													<a onclick="getExercises(event, ${courseItem.id})">做题</a>
												</span>
											</c:when>
											<c:when test="${courseItem.courseIndex == studyProgress}">
												<span style="float:right;">[学习中]</span>
											</c:when>
											<c:when test="${courseItem.courseIndex < studyProgress}">
												<span style="float:right;">
													[已修]
													<a onclick="getExercises(event, ${courseItem.id})">做题</a>
												</span>
											</c:when>
											<c:otherwise>
												<span style="float:right;">[未修]</span>
											</c:otherwise>
										</c:choose>
									</li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</ul>
				</div>
				
				<div id="comment-list" class="course-page comment-page">
					<c:forEach items="${course.commentList}" var="comment">
						<div class="clearfix comment-row">
							<div class="clearfix">
								<a href="#" class="fleft">${comment.commentUser.username}</a>
								<p class="fright ml10">
									<jsp:include page="stars.jsp">
										<jsp:param value="${comment.score}" name="stars"/>
									</jsp:include>
								</p>
								<p class="fright"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${comment.insertDatetime}" /></p>
							</div>
							<p>
								${comment.comment}
							</p>
						</div>
					</c:forEach>
					<div class="comment-block clearfix" ng-controller="CourseDetailController">
						<form name="comment_form">
							<textarea class="form-control" placeholder="我的评论" rows="3" ng-model="comment.comment" required></textarea>
							<button class="btn btn-primary mt10 fright" ng-disabled="comment_form.$invalid" ng-click="submitComment()">提交</button>
							<p id="starBlock" class="mt10 comment-star fleft">
								<span class="glyphicon glyphicon-star-empty yellow-star" onclick="setCommentStar(this)"></span>
								<span class="glyphicon glyphicon-star-empty yellow-star" onclick="setCommentStar(this)"></span>
								<span class="glyphicon glyphicon-star-empty yellow-star" onclick="setCommentStar(this)"></span>
								<span class="glyphicon glyphicon-star-empty yellow-star" onclick="setCommentStar(this)"></span>
								<span class="glyphicon glyphicon-star-empty yellow-star" onclick="setCommentStar(this)"></span>
							</p>
						</form>
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

<div id="add-exercises-modal" class="modal fade" ng-controller="CourseEditController">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">课程习题</h4>
			</div>
			<form name="exercises_form" class="form-horizontal">
				<div class="modal-body">
					<textarea id="exercises_text" class="form-control" rows="18" ng-model="courseExercises.exercisesText" required></textarea>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button class="btn btn-primary" ng-click="submit(exercises_form.$valid)">提交</button>
				</div>
			</form>
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
	
	var baseUrl = '<c:url value="/" />'
	var starHtml = '<span class="glyphicon glyphicon-star yellow-star" style="margin-right:6px;" onclick="setCommentStar(this)"></span>';
	var emptyStarHtml = '<span class="glyphicon glyphicon-star-empty yellow-star mr10" style="margin-right:6px;" onclick="setCommentStar(this)"></span>';
	
	function setCommentStar(starNode) {
		var index = $(starNode).index();
		var score = (index + 1) * 2;
		var insertHtml = "";
		var starCount = 0;
		for (var i = 0; i < score; i += 2) {
			insertHtml += starHtml;
			starCount++
		}
		for (var j = starCount; i < 10; i += 2) {
			insertHtml += emptyStarHtml;
		}
		commentStar = score;
		$('#starBlock').empty();
		$('#starBlock').html(insertHtml);
	}
	
	var isPlayed = false;
	var courseId = $('#course_id').val();
	
	$('#video').bind('play', function(event) {
		if (!isPlayed) {
			$.get('<c:url value="/course/addPlayTimes/' + courseId + '"/>', function(data) {
				isPlayed = true;
			});
		}
	});
	
	var planId = $('#course_plan_id').val();
	
	$('#video').bind('ended', function(event) {
		$.get('<c:url value="/chosen/studyComplete/' + planId + '"/>', function(data) {
			location.reload();
		});
	});
	
	function toSelectedCourse(element, courseId) {
		var span = $(element).find('span');
		var text = span.text();
		if (text.indexOf('已修') >= 0 || text.indexOf('学习中') >= 0) {
			location.assign('<c:url value="/courseDetail/' + planId + '/' + courseId + '"/>');
		}
	}
	
	var globalCourseId;
	
	function getExercises(event, courseId) {
	  event.stopPropagation();
	  globalCourseId = courseId;
	  $.get('<c:url value="/course/courseExercises/' + courseId + '"/>', function(data) {
	    if (data == null || data.exercisesText == null) {
	      alert('此课程还未出题');
	    } else {
	      $('#exercises_text').val(data.exercisesText);
	      $('#add-exercises-modal').modal('show');
	    }
	  });
	}
</script>
</body>
</html>