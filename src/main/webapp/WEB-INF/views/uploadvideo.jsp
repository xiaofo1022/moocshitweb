<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="author" content="xiaofo">
<title>慕课学</title>
<link href="<c:url value='/css/bootstrap.moocshit.css' />" rel="stylesheet"/>
<link href="<c:url value='/css/core.css' />" rel="stylesheet"/>
<script src="<c:url value='/js/jquery.min.js' />"></script>
<script src="<c:url value='/js/bootstrap.min.js' />"></script>
<script src="<c:url value='/js/angular.min.js' />"></script>
<script src="<c:url value='/js/angular/uploadvideo.js' />"></script>
<script src="<c:url value='/js/plupload.full.min.js' />"></script>
<script src="<c:url value='/js/qiniu.js' />"></script>
<script src="<c:url value='/js/qiniu_uploader.js' />"></script>
</head>
<body ng-app="uploadvideo">

<jsp:include page="header.jsp" flush="true">
	<jsp:param value="background" name="active" />
</jsp:include>

<div class="container">
<div class="row" style="padding-top:20px;">
	<div class="col-md-3">
		<jsp:include page="bgnavigator.jsp" flush="true">
			<jsp:param name="active" value="uploadvideo"/>
		</jsp:include>
	</div>
	
	<div class="col-md-6" ng-controller="UpdateCourseController">
		<form name="add_course_form" class="form-horizontal">
			<div class="form-group">
				<label class="col-sm-2 control-label">课程归属</label>
				<div class="col-sm-6">
			    	<select id="course-plan" class="form-control col-sm-10" required onchange="changePlan()">
			    		<option value=""> --- 选择 --- </option>
			    		<c:forEach items="${planList}" var="plan">
			    			<c:choose>
			    				<c:when test="${plan.id == selectedPlan.id}">
			    					<option value="${plan.id}" selected>${plan.planName}</option>
			    				</c:when>
			    				<c:otherwise>
			    					<option value="${plan.id}">${plan.planName}</option>
			    				</c:otherwise>
			    			</c:choose>
			    		</c:forEach>
			    	</select>
			    </div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">课程名称</label>
				<div class="col-sm-6">
			    	<input id="course-name" type="text" class="form-control" ng-model="course.courseName" required>
			    </div>
			    <c:if test="${selectedPlan.id != 0}">
			    	<input id="course-index" type="hidden" ng-model="course.courseIndex" value="${selectedPlan.courseCount + 1}"/>
		    		<label class="col-sm-2 control-label" style="text-align:left;">第 ${selectedPlan.courseCount + 1} 课</label>
		    	</c:if>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">课程视频</label>
				<div class="col-sm-6">
			    	<input id="qiniu-key" type="text" class="form-control" readonly ng-model="course.courseVideoKey">
			    </div>
				<div id="container" class="col-sm-4">
			    	<button id="pickfiles" type="button" class="btn btn-primary">点击上传</button>
			    </div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">课程简介</label>
				<div class="col-sm-10">
			    	<textarea id="course-remark" class="form-control" rows="3" ng-model="course.courseRemark" required></textarea>
			    </div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label"></label>
				<div class="col-sm-10">
					<button class="btn btn-primary" ng-click="submit(add_course_form.$valid)">提交</button>
				</div>
			</div>
		</form>
	</div>
</div>
</div>

<jsp:include page="footer.jsp" flush="true"/>

<script>
	var baseUrl = "<c:url value='/'/>";
	var uploader;
	
	+function init() {
		$.get("<c:url value='/upload/getUpToken'/>", function(data) {
			uploader = getUploader(data);
		});
	}();
	
	function changePlan() {
		var planId = parseInt($('#course-plan').val());
		if (planId) {
			location.assign('<c:url value="/uploadvideo/' + planId + '" />');
		} else {
			location.assign('<c:url value="/uploadvideo/0" />');
		}
	}
</script>
</body>
</html>