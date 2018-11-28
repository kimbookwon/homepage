<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%> 

<c:choose>
	<c:when test="${empty str }">
	
	</c:when>
<c:otherwise>
 <%
//String str = (String)request.getAttribute("str");

 
 //if(str==null){

 
 %>


<%
//return;}
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
 
<DIV class="title">아이디 이메일 중복확인</DIV>
 
<div class="container">
${str }

</div>
 
  
  <DIV class='bottom'>

    <input type='button' value='다시시도' onclick="history.back()">

  </DIV>

 
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> </c:otherwise>

</c:choose>

