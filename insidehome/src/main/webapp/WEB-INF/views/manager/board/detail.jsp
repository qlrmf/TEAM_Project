<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/manager/main/mgrHeader.jsp"%>



           <table>
            <tr>
               <td width="20%" bgcolor="#E8F6EF"><b>글 제목</b></td>
               <td><input style="width: 95%; padding : 5px 0 5px 2%;" type="text" value="${reboard.title}" name="title" required="required"></td>
            </tr>
            <tr>
               <td bgcolor="#E8F6EF"><b>글 내용</b></td>
               <td><textarea  style="width: 92%; padding : 2% 2% 2% 2%;resize: none; background: white; margin: 0;" rows="10" class="guideContent" name="content" required="required">${reboard.content}</textarea></td>
            </tr>
            
            <tr>
               <td bgcolor="#E8F6EF"><b>게시판 유형</b></td>
               <td align="left">
                  <c:set var="bCode" value="${reboard.boardCode}"/>
                  <c:if test="${bCode eq 'info'}">
                     <label><input name="boardCode" type="radio" value="info" name="notify" checked="checked">정보게시판</label>
                     <label><input name="boardCode" type="radio" value="who" name="notify"> 익명게시판</label>
                  </c:if>
                  <c:if test="${bCode eq 'who'}">
                     <label><input name="boardCode" type="radio" value="info" name="notify">정보게시판</label>
                     <label><input name="boardCode" type="radio" value="who" name="notify" checked="checked"> 익명게시판</label>
                  </c:if>
               </td>
            </tr>
            
            <tr>
               <td bgcolor="#E8F6EF"><b>상단표시여부</b></td>
               <td align="left">
                  <c:set var="noti" value="${reboard.notify}"/>
                  <c:if test="${noti eq 'yes'}">
                     <label><input type="radio" value="yes" name="notify"  checked="checked" > 상단공지 취소</label>
                     <label><input type="radio" value="notice" name="notify"> 상단공지</label>
                  </c:if>
                  <c:if test="${noti eq 'notice'}">
                     <label><input type="radio" value="yes" name="notify" > 상단공지 취소</label>
                     <label><input type="radio" value="notice" name="notify" checked="checked" > 상단공지</label>
                  </c:if>
               </td>
            </tr>
         </table>
         <input type="hidden" value="${reboard.num}" name="num">
         <input style="margin-top: 15px; padding: 10px 50px 10px 50px; font-size: 20px" type="submit" value="등 록">
    </form>
   </div>
</div>






<div class="body-info">
   <div class="info-detail">
      <h1 class="info-title">관리자 글상세</h1>
   </div>
   <hr>
   <div class="info-inner">
   <table border="1">
         <tr>
         	<th width="20%" bgcolor="#E8F6EF"><b>게시판 유형</b></th>
            <td>
              	<c:if test="${board.notify ne 'no'}"> [공지] </c:if>
				<c:if test="${board.boardCode eq 'info'}"> 정보게시판 </c:if>
				<c:if test="${board.boardCode eq 'who'}"> 익명게시판 </c:if>
            </td>
         </tr>
		<tr>
			<th width="20%" bgcolor="#E8F6EF">글 제목</th>
			<td>${board.title}</td>
		</tr>
		<tr>
			<th>글 작성자</th>
			<td>${board.writer}</td>
		</tr>
		<tr>
			<th>글 내용</th>
			<td>${board.content}</td>
		</tr>
	</table>
		<form style="padding: 0; float: left;" action="<c:url value="/manager/board/delete.do/${board.num}"/>" method="post">
	    <input type="submit" value="삭제">
		</form>
	<c:if test="${board.notify ne 'no'}">  
	    <input type="button" value="수정" onclick="location.href='<c:url value="/manager/board/updateForm.do/${board.num}"/>'">
	</c:if>
      
   </div>
</div>

<%@include file="/WEB-INF/views/manager/main/mgrFooter.jsp"%>