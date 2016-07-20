<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="author" content="xiaofo">
<title>慕课学</title>
<link href="css/bootstrap.moocshit.css" rel="stylesheet" />
<link href="css/core.css" rel="stylesheet" />
<link href="css/coursemanage.css" rel="stylesheet" />
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/angular.min.js"></script>
<script src="js/angular/coursemanage.js"></script>
<script src="js/plupload.full.min.js"></script>
<script src="js/qiniu.js"></script>
<script src="js/qiniu_uploader.js"></script>
</head>
<body ng-app="coursemanage">

	<jsp:include page="header.jsp" flush="true">
		<jsp:param value="background" name="active" />
	</jsp:include>

	<div class="container">
		<div class="row" style="padding-top: 20px;">
			<div class="col-md-3">
				<jsp:include page="bgnavigator.jsp" flush="true">
					<jsp:param name="active" value="coursemanage" />
				</jsp:include>
			</div>

			<div class="col-md-9" ng-controller="CourseManageController">
				<div style="width: 100%; padding: 0 10px 10px 0; border-bottom: 1px solid #ccc;">
					<button class="btn btn-primary btn-lg" style="border-radius: 0px;" data-toggle="modal"
						data-target="#add-course-modal">添加课程</button>
				</div>

				<div id="add-course-modal" class="modal fade">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 id="search-result-title" class="modal-title">添加课程</h4>
							</div>
							<form name="add_course_form" class="form-horizontal">
								<div class="modal-body">
									<div class="form-group">
										<label class="col-sm-2 control-label">课程名称</label>
										<div class="col-sm-6">
											<input id="course-name" type="text" class="form-control" ng-model="course.planName" required>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">课程分类</label>
										<div class="col-sm-6">
											<input type="text" class="form-control" ng-model="course.planType" required>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">课程封面</label>
										<div class="col-sm-6">
											<input id="qiniu-key" type="text" class="form-control" readonly>
										</div>
										<div id="container" class="col-sm-4">
											<button id="pickfiles" type="button" class="btn btn-primary">点击上传</button>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">课程简介</label>
										<div class="col-sm-10">
											<textarea id="course-remark" class="form-control" rows="3" ng-model="course.planDescription" required></textarea>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<div class="form-group">
										<label class="col-sm-2 control-label"></label>
										<div class="col-sm-10">
											<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
											<button class="btn btn-primary" ng-click="submit(add_course_form.$valid)">提交</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>

				<div class="clearfix course-row">
					<c:forEach items="${courseList}" var="course">
						<div class="fleft class-block course-block">
							<div onclick="toCourseEdit(${course.id})" class="course-pic"
								style="background-image:url(http://7xrbxj.com1.z0.glb.clouddn.com/${course.planPicKey});"></div>
							<p style="padding-top: 10px;">
								<span>课程：${course.planName}</span> <span>(共 ${course.courseCount} 课时)</span>
							</p>
							<p>
								<span>讲师：${course.uploader.username}</span>
								<button class="btn btn-success btn-xs fright" onclick="toUploadVideo(${course.id})">上传视频</button>
							</p>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp" flush="true" />

	<script>
	var baseUrl = '<c:url value="/"/>';
	var uploader;
	
	+function init() {
		$.get("upload/getUpToken", function(data) {
			uploader = getUploader(data);
		});
	}();
	
	function toUploadVideo(planId) {
		location.assign('<c:url value="/uploadvideo/' + planId + '"/>');
	}
	
	function toCourseEdit(planId) {
		location.assign('<c:url value="/courseedit/' + planId + '"/>');
	}
</script>
</body>
</html>