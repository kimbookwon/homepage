<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%> 

 <%
// 	boolean flag = (Boolean)request.getAttribute("flag");
// 	String id = (String)request.getAttribute("id");
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
 

 

<div class="content" style="text-align: center">
<c:if test="${flag}">
<p >로그인성공</p>
<h2>${id }님 환영합니다.</h2>
	    <input type="button" value='홈' onclick="location.href='${root}'">

</c:if>
<c:if test="${flag eq false }">
<p>로그인 실패(아이디, 비밀번호를 확인하세요)<br>
회원이 아니시면 회원가입을 하세요
</p>
	    <input type="button" value='다시시도' onclick="history.back()">
    <input type="button" value='회원가입' onclick="location.href='agreement'" >

</c:if>
 
</div>
 
  

 
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 
