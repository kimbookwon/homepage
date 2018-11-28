<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%> 


 <%

	//String passwd = (String)request.getAttribute("passwd");
 
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
<c:if test="${empty passwd }">
<script type="text/javascript">
alert("회원 정보가 없습니다.");
history.go(-1);
</script>

</c:if>
<c:if test="${not empty passwd }">
<script type="text/javascript">
alert("찾으시는 계정의 PASSWORD: '${passwd}'입니다.");
location.href="../index.jsp";
</script>

</c:if>

<link href="${root }/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
