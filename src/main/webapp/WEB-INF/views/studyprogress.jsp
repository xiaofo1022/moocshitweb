<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="author" content="xiaofo">
<title>慕课学</title>
<link href="<c:url value='/css/bootstrap.moocshit.css' />" rel="stylesheet" />
<link href="<c:url value='/css/core.css' />" rel="stylesheet"/>
<link href="<c:url value='/css/course.css' />" rel="stylesheet"/>
<script src="<c:url value='/js/jquery.min.js' />"></script>
<script src="<c:url value='/js/bootstrap.min.js' />"></script>
</head>
<body>

<jsp:include page="header.jsp" flush="true">
	<jsp:param value="background" name="active" />
</jsp:include>

<div class="container">
<div class="row" style="padding-top:20px;">
	<div class="col-md-3">
		<jsp:include page="bgnavigator.jsp" flush="true">
			<jsp:param name="active" value="studyprogress"/>
		</jsp:include>
	</div>
	
	<div class="col-md-9">
		<div class="course-category clearfix" style="width:100%;">
			<div class="course-block clearfix">
				<c:forEach items="${planList}" var="plan">
					<c:choose>
						<c:when test="${plan.id == selectedPlan.id}">
							<p class="active">${plan.planName}</p>
						</c:when>
						<c:otherwise>
							<p onclick="changeProgress(${plan.id})">${plan.planName}</p>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
		</div>
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<td style="width:40px;">#</td>
					<td style="width:80px;">学生姓名</td>
					<td style="width:120px;">联系电话</td>
					<td>进度</td>
					<td style="width:100px;">结课日期</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${chosenList}" var="chosen" varStatus="status">
					<tr>
						<td>${status.index + 1}</td>
						<td>${chosen.student.username}</td>
						<td>${chosen.student.phone}</td>
						<td>
							<div class="progress" style="margin:0;border-radius:0;">
								<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="${chosen.studyPercent}" aria-valuemin="0" aria-valuemax="100" style="width:${chosen.studyPercent}%;min-width:3em;">
							    	${chosen.studyProgress} / ${maxCourseIndex}
								</div>
							</div>
						</td>
						<td>${chosen.deadLine}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
</div>

<jsp:include page="footer.jsp" flush="true"/>

<script>

	function changeProgress(planId) {
		location.assign('<c:url value="/studyprogress/' + planId + '"/>');
	}

</script>

</body>
</html>