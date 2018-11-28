<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%> 

 <%

 //	boolean flag = dao.update(dto);
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
<script type="text/javascript">
function mread(){
	var url = "read.do";
	url = url + "?id=${dto.id}"
	location.href=url;
	
}

</script>
<link href="${root }/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
<DIV class="title">회원 정보 수정 처리</DIV>
<div class="content"> 
<c:choose>
<c:when test="${flag }">
회원정보 수정되었습니다.<br>
  <input type='button' value='정보확인' onclick="location.href='read'">
</c:when>
<c:otherwise>
수정 실패

 <input type="button" value="다시시도" onclick="history.back()">
</c:otherwise>

</c:choose>

  </div>


 
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 
