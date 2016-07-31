<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="author" content="xiaofo">
<title>慕课学</title>
<link href="<c:url value='/css/bootstrap.moocshit.css' />" rel="stylesheet"/>
<link href="<c:url value='/css/jquery-ui/jquery-ui.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/css/core.css' />" rel="stylesheet"/>
<link href="<c:url value='/css/course.css' />" rel="stylesheet"/>
<script src="<c:url value='/js/jquery.min.js' />"></script>
<script src="<c:url value='/js/bootstrap.min.js' />"></script>
<script src="<c:url value='/js/angular.min.js' />"></script>
</head>
<body>

<jsp:include page="header.jsp" flush="true">
	<jsp:param value="background" name="active" />
</jsp:include>

<div class="container">
<div class="row" style="padding-top:20px;">
	<div class="col-md-3">
		<jsp:include page="bgnavigator.jsp" flush="true">
			<jsp:param name="active" value="score"/>
		</jsp:include>
	</div>
	
	<div class="col-md-9">
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<td>#</td>
					<td>学生姓名</td>
					<td>课程名称</td>
					<td>得分</td>
					<td>操作</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${resultList}" var="result" varStatus="status">
					<tr>
						<td>${status.index + 1}</td>
						<td>
							${result.user.username}
						</td>
						<td>${result.courseMasterplan.planName} - ${result.course.courseName}</td>
						<c:choose>
							<c:when test="${result.isDone == 0}">
								<td style="color:#D9534F;">未评分</td>
							</c:when>
							<c:otherwise>
								<td style="color:#449D44;">${result.score}</td>
							</c:otherwise>
						</c:choose>
						<td>
							<button class="btn btn-info btn-xs" onclick="scoreTheExercise(${result.courseId}, ${result.userId})">评分</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
	</div>
</div>
</div>

<div id="exercises-modal" class="modal fade" ng-controller="CourseEditController">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">试题评分</h4>
			</div>
			<form name="exercises_form" class="form-horizontal">
				<div class="modal-body">
					<textarea id="exercises_text" class="form-control" rows="18"></textarea>
				</div>
				<div class="modal-footer">
					<input id="score" type="number" />分数
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="doneTheExercises()">提交</button>
				</div>
			</form>
		</div>
	</div>
</div>

<jsp:include page="footer.jsp" flush="true"/>

<script>
	var baseUrl = '<c:url value="/"/>';
	var baseCourseId;
	var baseUserId;
	
	function scoreTheExercise(courseId, userId) {
	  baseCourseId = courseId;
	  baseUserId = userId;
	  $.get(baseUrl + '/course/getExercisesResult?courseId=' + courseId + '&userId=' + userId, function(data) {
	    $('#exercises_text').val(data.exercisesText);
	    $('#exercises-modal').modal('show');
	  });
	}
	
	function doneTheExercises() {
	  var score = $('#score').val();
	  $.get(baseUrl + '/course/doneTheExercises?courseId=' + baseCourseId + '&userId=' + baseUserId + '&score=' + score, function(data) {
	    $('#exercises-modal').modal('hide');
	    location.reload();
	  });
	}
</script>
</body>
</html>