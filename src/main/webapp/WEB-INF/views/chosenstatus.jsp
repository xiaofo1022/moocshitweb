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
<script src="<c:url value='/js/angular/chosenstatus.js' />"></script>
<script src="<c:url value='/js/jquery-ui.js'/>"></script>
</head>
<body ng-app="ChosenStatusModel">

<jsp:include page="header.jsp" flush="true">
	<jsp:param value="background" name="active" />
</jsp:include>

<div class="container">
<div class="row" style="padding-top:20px;">
	<div class="col-md-3">
		<jsp:include page="bgnavigator.jsp" flush="true">
			<jsp:param name="active" value="chosen"/>
		</jsp:include>
	</div>
	
	<div class="col-md-9">
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<td>#</td>
					<td>课程名称</td>
					<td>讲师</td>
					<td>选课人数</td>
					<td>状态</td>
					<td>操作</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${chosenStatusList}" var="chosen" varStatus="status">
					<tr>
						<td>${status.index + 1}</td>
						<td>
							<a href="<c:url value='/courseedit/${chosen.courseMasterplan.id}'/>">
								${chosen.courseMasterplan.planName}
							</a>
						</td>
						<td>${chosen.courseMasterplan.uploader.username}</td>
						<td>${chosen.studentCount}</td>
						<c:choose>
							<c:when test="${chosen.isStart == 0}">
								<td style="color:#D9534F;">未开课</td>
								<td><button class="btn btn-warning btn-xs" onclick="startCourse(${chosen.coursePlanId})">开课</button></td>
							</c:when>
							<c:otherwise>
								<td style="color:#449D44;">已开课 [结课日期:${chosen.deadLine}]</td>
								<td><button class="btn btn-info btn-xs">查看进度</button></td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div id="startCourseModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title">开课</h4>
					</div>
					<form name="start_course_form" class="form-horizontal" ng-controller="ChosenStatusController">
						<div class="modal-body">
							<div class="form-group">
								<label class="col-sm-4 control-label">结课日期</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="datepicker" id="datepicker" ng-model="chosen.deadLine" required/>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button class="btn btn-primary" ng-click="submit(start_course_form.$valid)">确定</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</div>

<jsp:include page="footer.jsp" flush="true"/>

<script>
	$('#datepicker').datepicker({minDate:1});
	
	var baseUrl = '<c:url value="/"/>';
	
	function startCourse(planId) {
		coursePlanId = planId;
		$('#startCourseModal').modal('show');
	}
</script>
</body>
</html>