<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %> 
 <%@ page contentType="text/html; charset=UTF-8" %> 

 
 <%
 //	String id = request.getParameter("id");
 //	String passwd = request.getParameter("passwd");
// 	String c_id = (String)request.getAttribute("c_id");
// 	String c_id_val = (String)request.getAttribute("c_id_val");
 
 %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
	text-align: center;
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<script type="text/javascript">
function check(f){
	if(f.id.value==""){
		alert("아이디를 입력하세요");
		f.id.focus();
		return false;
		
	}
	
	if(f.passwd.value==""){
		alert("비밀번호를 입력하세요");
		f.passwd.focus();
		return false;
	}
}


</script>
<link href="${root }/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
<DIV class="title">로그인</DIV>
 


 
<FORM name='frm' method='POST' action='${root }/member/login' onsubmit="return check(this)" class="form-inline" action="/action_page.php">

  
  
   <div class="form-group" align="center">
    <label for="id"></label>
    <input type="text" name="id"  class="form-control" value="${c_id_val }" style="width: 200px; align:center;">
  <c:choose>
  <c:when test="${c_id_val=='Y' }">
   <div class="checkbox">
    <label><input type="checkbox" name="c_id" value="Y" checked="checked">ID저장</label>
    </c:when>
    <c:otherwise>
    <label><input type="checkbox" name="c_id" value="Y">ID저장</label>
 
    </c:otherwise>
  
  </c:choose>
  

  </div>
  </div>
  <div class="form-group" >
    <label for="passwd"></label>
    <input type="password" name="passwd"  class="form-control" value="비밀번호" style="width: 200px;">
  </div>

  
  <DIV class='bottom'>
    <input type='submit' value='로그인'>
    <input type='button' value='회원가입' onclick="location.href='agreement'">
    <input type='button' value='ID 찾기' onclick="location.href='idsearch_form'">
    <input type='button' value='PW 찾기' onclick="location.href='passwdfindform'">
  </DIV>
    <input type="hidden" name="flag" value="${param.flag }">
    <input type="hidden" name="bbsno" value="${param.bbsno }">
    <input type="hidden" name="col" value="${param.col }">
    <input type="hidden" name="nowPage" value="${param.nowPage }">
    <input type="hidden" name="nPage" value="${param.nPage }">
</FORM>
 
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 
