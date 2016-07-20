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
							<button class="btn btn-info btn-xs">评分</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
	</div>
</div>
</div>

<jsp:include page="footer.jsp" flush="true"/>

<script>
	var baseUrl = '<c:url value="/"/>';
</script>
</body>
</html>