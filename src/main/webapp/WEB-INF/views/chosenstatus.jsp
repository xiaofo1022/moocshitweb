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
					<td>已选人数</td>
					<td>状态</td>
					<td>操作</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td><a href="<c:url value='/courseedit/1'/>">武打教学</a></td>
					<td>计春华</td>
					<td>20</td>
					<td style="color:#D9534F;">未开课</td>
					<td><button class="btn btn-warning btn-xs">开课</button></td>
				</tr>
				<tr>
					<td>2</td>
					<td><a href="<c:url value='/courseedit/2'/>">吉他教学</a></td>
					<td>左轮老师</td>
					<td>5</td>
					<td style="color:#449D44;">已开课</td>
					<td><button class="btn btn-warning btn-xs" disabled>开课</button></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
</div>

<jsp:include page="footer.jsp" flush="true"/>

</body>
</html>