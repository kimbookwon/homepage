<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp"%> 

 <%
//  	String upDir = application.getRealPath("/member/storae");
//  	String id = request.getParameter("id");
//  	String oldfile = dao.getFname(id);
 	
 	 
 
//  boolean flag = dao.delete(id);
 
//  if(flag) {
// 	 	if(oldfile!=null && oldfile.equals("member.jpg"))
// 	 UploadSave.deleteFile(upDir, oldfile);
// 	 session.invalidate();
//  }
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
 
<DIV class="title">회원탈퇴 처리</DIV>
 <div class="content">
 <c:choose>
 <c:when test="${flag }">
 탈퇴되었습니다. 자동 로그아웃됩니다.<br>
    <input type='button' value='회원가입' onclick="location.href='create.do'">
    <input type='button' value='홈' onclick="location.href='../index.jsp'">
 </c:when>
 <c:otherwise>
 탈퇴가 실패되었습니다.<br>
 ${flag }
   <input type='button' value='다시시도' onclick="history.back()">
 </c:otherwise>
 
 </c:choose>

</div>
 
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 
