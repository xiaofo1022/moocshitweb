<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String active = request.getParameter("active"); %>
<div class="panel panel-default">
	<div class="panel-heading" style="text-align:center;">
		个人中心
	</div>
	<div class="panel-body">
		<ul class="list-group" style="margin-bottom:0;text-align:left;">
			<a href="<c:url value='/coursemanage'/>" class="list-group-item <% if (active != null && active.equals("coursemanage")) {%> active <%} %>">
				课程管理
			</a>
			<a href="<c:url value='/uploadvideo/0'/>" class="list-group-item <% if (active != null && active.equals("uploadvideo")) {%> active <%} %>">
				视频上传
			</a>
			<a href="<c:url value='/chosenstatus'/>" class="list-group-item <% if (active != null && active.equals("chosen")) {%> active <%} %>">
				选课情况
			</a>
			<a href="<c:url value='/studyprogress'/>" class="list-group-item <% if (active != null && active.equals("studyprogress")) {%> active <%} %>">
				学习进度
			</a>
			<a href="#" class="list-group-item">
				视频审核
			</a>
			<a href="#" class="list-group-item">
				用户管理
			</a>
			<a href="<c:url value='/myinformation'/>" class="list-group-item <% if (active != null && active.equals("myinformation")) {%> active <%} %>">
				个人资料
			</a>
			<!-- 
			<a href="#" class="list-group-item">
				我的讨论
			</a>
			<a href="#" class="list-group-item">
				讨论管理
			</a>
			-->
		</ul>
	</div>
</div>