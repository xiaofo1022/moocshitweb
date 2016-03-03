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
<script src="js/angular.min.js"></script>
<script src="js/angular/background.js"></script>
<script src="js/plupload.full.min.js"></script>
<script src="js/qiniu.js"></script>
<script src="js/qiniu_uploader.js"></script>
<style>
	h3 {
		border-bottom:1px solid #ccc;
		padding-bottom:10px;
	}
</style>
</head>
<body ng-app="background">

<jsp:include page="header.jsp" flush="true"/>

<div class="container">
<div class="row" style="padding-top:20px;">
	<div class="col-md-3">
		<jsp:include page="bgnavigator.jsp" flush="true"/>
	</div>
	
	<div class="col-md-6 col-md-offset-1" ng-controller="UpdateCourseController">
		<form name="add_course_form" class="form-horizontal">
			<div class="form-group">
				<label class="col-sm-2 control-label">课程名称</label>
				<div class="col-sm-6">
			    	<input id="course-name" type="text" class="form-control" ng-model="course.courseName" required>
			    </div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">课程分类</label>
				<div class="col-sm-6">
			    	<select id="course-type" class="form-control col-sm-10" ng-model="course.courseTypeId" required>
			    		<option value=""> --- 选择 --- </option>
			    		<option ng-repeat="courseType in courseTypes" value="{{courseType.id}}">{{courseType.typeName}}</option>
			    	</select>
			    </div>
			    <div class="col-sm-4">
			    	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#add-coursetype-modal">添加</button>
			    </div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">上传视频</label>
				<div class="col-sm-6">
			    	<input id="course-video-key" type="text" class="form-control" readonly ng-model="course.courseVideoKey">
			    </div>
				<div id="container" class="col-sm-4">
			    	<button id="pickfiles" type="button" class="btn btn-primary">点击上传</button>
			    </div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">课程信息</label>
				<div class="col-sm-10">
			    	<textarea id="course-remark" class="form-control" rows="3" ng-model="course.courseRemark"></textarea>
			    </div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label"></label>
				<div class="col-sm-10">
					<button class="btn btn-primary" ng-disabled="add_course_form.$invalid" ng-click="submit()">提交</button>
				</div>
			</div>
		</form>
		<div id="add-coursetype-modal" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
			        <div class="modal-header">
			        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        	<h4 id="search-result-title" class="modal-title">添加课程分类</h4>
			      	</div>
			      	<form name="add_type_form" class="form-horizontal">
				      	<div class="modal-body">
					      	<div class="form-group" style="margin-bottom:0;">
								<label class="col-sm-2 control-label">分类名称</label>
								<div class="col-sm-6">
							    	<input id="course-type-name" type="text" class="form-control" ng-model="courseType.typeName" required>
							    </div>
							</div>
				      	</div>
				      	<div class="modal-footer">
				        	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				        	<button class="btn btn-primary" ng-disabled="add_type_form.$invalid" ng-click="addCourseType()">添加</button>
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
	$(".class-block").click(function(e) {
		location.assign("coursedetail.html");
	});
	
	var uploader;
	
	+function init() {
		$.get("upload/getUpToken", function(data) {
			uploader = getUploader(data);
		});
	}();
</script>
</body>
</html>