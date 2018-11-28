<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%> 


 <%
//	String id = (String)request.getAttribute("id");

 
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
<c:choose>
<c:when test="${empty id }">
<script type="text/javascript">
alert("일치하는 정보가 없습니다. 회원가입 후 이용부탁드립니다.");
history.go(-1);
</script>

</c:when>
<c:otherwise>
<script type="text/javascript">
alert("찾으시는 계정은 '${id}'입니다.");
location.href="../index.jsp";
</script>

</c:otherwise>

</c:choose>


<link href="${root }/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
