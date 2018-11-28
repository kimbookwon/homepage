<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%> 

 <%

 //	String email = request.getParameter("email");
   
 //	boolean flag=dao.duplicateEmail(email);
 
 
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
function use(){
	opener.frm.email.value='${email}';
	self.close(); 
}


</script>
<link href="${root }/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>

 
<DIV class="title">email 중복확인</DIV>
 <div class="content">
입력된 Email :${email }<br>
<c:choose>
<c:when test="${flag }">
검색하신 이메일 " +${email }+ "는 사용이 불가능합니다. <br><br>
    <input type="button" value='다시시도' onclick="location.href='email_form.do'">
</c:when>
<c:otherwise>
중복 아님 사용가능<br>
<input type='button' value='사용' onclick='use()'>
</c:otherwise>

</c:choose>

 
  </div>
  <DIV class='bottom'>

    <input type='button' value='닫기' onclick="window.close()">
  </DIV>

 
 

</body>
<!-- *********************************************** -->
</html> 
