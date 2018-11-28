<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%> 
 
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
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.js"></script> 
<script type="text/javascript">
function check(){
	if(frm.email.value==""){
		alert("이메일을 입력하세요");
		frm.email.focus();
	}else{
		var email= frm.email.value;
		var url = "email_jquery";
		$.ajax({
			url:url,
			type : "GET",
			dataType:'text',
			data:{"email":email},
			success : function(data){
				$("#emailcheck").text(data.trim()).css("color","red");
				if(data.trim().indexOf("중복아님")!=-1){
					$("#emailcheck").append("<button onclick='use()'>적용</button>");
				}
			}
		})

		/*
		url = url + "?email=" + email;
		
		wr = window.open(url,"이메일검색","width=480,height=300");
		wr.moveTo((window.screen.width-500)/2,(window.screen.height-500)/2);
		*/
	}
}
function use(){
	opener.frm.email.value = document.frm.email.value;
	self.close();
}
</script>
<link href="${root }/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>

 
<DIV class="title">Email 중복확인</DIV>
 <div class="content">
<FORM name='frm' method='POST' action="update">
  <TABLE>
    <TR>
      <TH>이메일</TH>
      <TD><input type="email" name="email" size="20"></TD>
          
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type="button" value='중복확인' onclick="return check(this.frm)">

    <input type='button' value='취소' onclick="window.close()">
    <span id="emailcheck"></span>
  </DIV>
</FORM>
 </div>
 

</body>
<!-- *********************************************** -->
</html> 
