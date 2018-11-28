<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>

  
 
 <%
 	boolean flag= (Boolean)request.getAttribute("flag");
 
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
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
<h2 style="text-align: center"> 등록</h2>
 
<div class="content" style="text-align: center">

<c:if test="${flag}">
<p>등록 성공.</p>
    <DIV class='bottom' style="text-align: center">
    <input type='button' value='계속등록' onclick="location.href='./create.do'">
    <input type='button' value='목록' onclick="location.href='./list.do'">
  </DIV>
  

</c:if>
<c:if test="${flag eq false}">
<p>등록 실패.</p>
    <DIV class='bottom' style="text-align: center">
 
    <input type='button' value='목록' onclick="history.back()">
  </DIV>
  

</c:if>

</div>


 
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 