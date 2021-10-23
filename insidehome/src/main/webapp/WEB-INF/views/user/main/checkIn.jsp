<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="/WEB-INF/views/user/main/userHeader.jsp"%>


출석페이지입니다.

<div class="calender">
	<div class="cal-header">
		<div></div>
		<div>
			<button>◁</button>
			<button>today</button>
			<button>▷</button>
		</div>
	</div>
	<div>
		<ol class="daylist">
			<li class="day">일</li>
			<li class="day">월</li>
			<li class="day">화</li>
			<li class="day">수</li>
			<li class="day">목</li>
			<li class="day">금</li>
			<li class="day">토</li>
		</ol>
	</div>
</div>
<div>
	<img
		src="<%= request.getContextPath()%>/resources/img/check-off.png" 
		onmouseover="this.src='<%= request.getContextPath() %>/resources/img/check-on.png'" 
		onmouseout="this.src='<%= request.getContextPath() %>/resources/img/check-off.png'" 
		onclick="<c:url value="/inside/check.do"/>" />
</div>
<div>
	<a href="<c:url value="/inside/check.do"/>">
		<img src="<%= request.getContextPath()%>/resources/img/check-on.png">
	</a>
</div>

<%@include file="/WEB-INF/views/user/main/userFooter.jsp"%>