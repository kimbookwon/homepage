<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%> 

 <%
  //boolean flag=(Boolean)request.getAttribute("flag");
 %>
  
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<link href="${root }/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
<DIV class="title">회원 가입 처리</DIV>
<div class="content">
<c:if test="${flag }">
회원가입을 축하합니다.<br>
	<input type="button" value="로그인" onclick="location.href='login'" >
      <input type='button' value='홈' onclick="location.href='${root}'" >
</c:if>
<c:if test="${flag eq false }">
회원가입 실패<br>
	<input type="button" value="다시 작성" onclick="history.back()">
      <input type='button' value='목록' onclick="location.href='${root}'">
</c:if>

</div>
</body>
<!-- *********************************************** -->
</html> 
