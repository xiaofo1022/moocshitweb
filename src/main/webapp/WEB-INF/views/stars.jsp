<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	double stars = Double.valueOf(request.getParameter("stars"));
%>
<c:set var="count" value="<%=stars%>" />
<c:choose>
	<c:when test="${count >= 2}">
		<span class="glyphicon glyphicon-star yellow-star"></span>
	</c:when>
	<c:otherwise>
		<span class="glyphicon glyphicon-star-empty yellow-star"></span>
	</c:otherwise>
</c:choose>
<c:choose>
	<c:when test="${count >= 4}">
		<span class="glyphicon glyphicon-star yellow-star"></span>
	</c:when>
	<c:otherwise>
		<span class="glyphicon glyphicon-star-empty yellow-star"></span>
	</c:otherwise>
</c:choose>
<c:choose>
	<c:when test="${count >= 6}">
		<span class="glyphicon glyphicon-star yellow-star"></span>
	</c:when>
	<c:otherwise>
		<span class="glyphicon glyphicon-star-empty yellow-star"></span>
	</c:otherwise>
</c:choose>
<c:choose>
	<c:when test="${count >= 8}">
		<span class="glyphicon glyphicon-star yellow-star"></span>
	</c:when>
	<c:otherwise>
		<span class="glyphicon glyphicon-star-empty yellow-star"></span>
	</c:otherwise>
</c:choose>
<c:choose>
	<c:when test="${count >= 9}">
		<span class="glyphicon glyphicon-star yellow-star"></span>
	</c:when>
	<c:otherwise>
		<span class="glyphicon glyphicon-star-empty yellow-star"></span>
	</c:otherwise>
</c:choose>
					