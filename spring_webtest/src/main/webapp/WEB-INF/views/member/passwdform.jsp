<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%> 

 <%


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
function incheck(f){

	if(f.passwd.value==""){
		alert("기존 비밀번호를 입력하세요");		
		
		f.passwd.focus();
		return false;
	}
	if(f.newpasswd.value==""){
		alert("새로운 비밀번호를 입력하세요");
		f.newpasswd.focus();
		return false;
	}

	if(f.newpasswd.value!=f.renewpasswd.value){
		alert("새로운 비밀번호 불일치")
		f.renewpasswd.focus();
		return false;
	}
	
	
}
</script>

<link href="${root }/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
<DIV class="title">비밀번호 변경</DIV>
 
<FORM name='frm' method='POST' onsubmit="return incheck(this)" action='./passwdproc'>
<input type="hidden" name="id" value="${param.id }">


  <TABLE>
    <TR>
      <TH>기존 비밀번호</TH>
      <TD>
      <input type="password" name="passwd" size="15">

      </TD>      
    </TR> 
    
    <TR>
      <TH>새로운 비밀번호</TH>
      <TD>
      <input type="password" name="newpasswd" size="15">
      </TD>      
    </TR>
    
    <TR>
      <TH>비밀번호 재확인</TH>
      <TD> 
      <input type="password" name="renewpasswd" size="15">
      </TD>      
    </TR>
    
  </TABLE>
  
  
  <DIV class='bottom'>
    <input type='submit' value='변경하기'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 
