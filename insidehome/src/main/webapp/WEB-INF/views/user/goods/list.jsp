<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<%@include file="/WEB-INF/views/user/main/userHeader.jsp"%>
<script type="text/javascript">
var selectBoxChange = function(value){
	var type = value;
	window.location.href="<%=request.getContextPath()%>/goods/list.do?type=" + type;
}
var result = "<c:out value="${orderRequest}"/>";
if(result == 'fail'){
	alert('구매하고자 하는 상품의 가격보다 보유 포인트가 부족합니다.');
}
</script>
<link href="<c:url value="/resources/css/goodsMain.css" />" rel="stylesheet" />
 
 
 <div class="body-info">
 <div class="info-detail">
	   <div class="goods-title3">
	   		추천상품
    	  <p class="goods-title3">이런 상품은 어때요?</p>
	   </div>
	   <select name="type" onchange="selectBoxChange(this.value);">
			<option value="dateDesc" <c:if test="${type eq 'dateDesc'}">selected="selected"</c:if>>최신순</option>
			<option value="priceDesc" <c:if test="${type eq 'priceDesc'}">selected="selected"</c:if>>높은 가격순</option>
			<option value="priceAsc" <c:if test="${type eq 'priceAsc'}">selected="selected"</c:if>>낮은 가격순</option>
		</select>
   </div>
   <hr>


<div>
	
</div>
<table>
	<tbody>
	<c:forEach items="${mainHeart}" var="heartOne" varStatus="status">
			<c:if test="${status.index != 0 and status.index %5 == 0}">
				<tr></tr>
			</c:if>
			<c:if test="${status.index != 0 and status.index %5 != 0}">
					<td>
					<a href="<c:url value="/goods/detail.do/${heartOne.GOODSCODE}" />">
						<div class="goods-box">
							<div class="image-box">
								<c:choose>
									<c:when test="${heartOne.SAVENAME == null}">
										<c:set var="imagePath" value="/resources/img/noGoods.gif" />
									</c:when>
									<c:otherwise>
										<c:set var="imagePath" value="/display?goodsCode=${heartOne.GOODSCODE}&saveName=${heartOne.SAVENAME}" />							
									</c:otherwise>
								</c:choose>			
								<img class="image-goods" src="<c:url value="${imagePath}" />" /><br>
								</div>
								<div class="goods-txt">
									<b><c:out value="${heartOne.GOODSNAME}"/></b>
									<fmt:formatNumber var="price" value="${heartOne.PRICE}" pattern="#,###" />
									<c:out value="${price += ' point'}"/>
								</div>
						</div>
					</a>
					</td>
			</c:if>
			</c:forEach>
	</tbody>
</table>

<table>
	<caption>
		전체 상품 목록
	</caption>
	<tbody>
		<tr>
		<c:forEach items="${goodsList}" var="goodsOne" varStatus="status">
		<c:set var="name" value=""/>
		<c:if test="${status.index != 0 and status.index %5 == 0}">
		</tr><tr>
		</c:if>
				<td>
				<a href="<c:url value="/goods/detail.do/${goodsOne.GOODSCODE}" />">
					<div class="goods-box" title="${goodsOne.goodsName}">
						<div class="image-box">
							<c:choose>
								<c:when test="${goodsOne.SAVENAME == null}">
									<c:set var="imagePath" value="/resources/img/noGoods.gif" />
								</c:when>
								<c:otherwise>
									<c:set var="imagePath" value="/display?goodsCode=${goodsOne.GOODSCODE}&saveName=${goodsOne.SAVENAME}" />							
								</c:otherwise>
							</c:choose>			
							<img class="image-goods" src="<c:url value="${imagePath}" />" alt="<c:out value="${goodsOne.GOODSNAME}" />"/><br>
							</div>
							<div class="goods-txt">
								<b><c:out value="${goodsOne.GOODSNAME}"/></b>
								<fmt:formatNumber var="price" value="${goodsOne.PRICE}" pattern="#,###" />
								<c:out value="${price += ' point'}"/>
							</div>
					</div>
				</a>
				</td>
		</c:forEach>
		</tr>
	</tbody>
</table>     
</div>
<%@include file="/WEB-INF/views/user/main/userFooter.jsp"%>