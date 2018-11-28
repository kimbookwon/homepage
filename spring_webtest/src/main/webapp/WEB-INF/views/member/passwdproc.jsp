<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%> 

 <%
 
// 	String id = request.getParameter("id");
// 	String passwd = request.getParameter("passwd");
// 	String newpasswd = request.getParameter("newpasswd");

// 	Map map = new HashMap();
// 	map.put("id", id);
// 	map.put("passwd", passwd);
	
// 	boolean pflag=dao.checkPasswd(map);
	
// 	dto=dao.read(id);
	

// 	dto.setPasswd(newpasswd);
	

// 	boolean flag=false;
// 	if(pflag){
// 		flag=dao.update(dto);
// 	}

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
 
<DIV class="title">비밀번호 변경처리</DIV>
<div class="content">
<c:choose>
<c:when test="${pflag }">

<c:if test="${flag }">
변경<br>
    <input type="button" value='확인' onclick="location.href='${root}'">

</c:if>
<c:if test="${flag eq false }">
${flag }
실패<br>
    <input type="button" value='다시' onclick="history.back()">

</c:if>
</c:when>
<c:otherwise>
${pflag }

기존비밀번호가 다름<br>
    <input type="button" value='다시' onclick="history.back()">
    </c:otherwise>
</c:choose>

</div>

 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 
