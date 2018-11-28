<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %> 

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
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
function check(f){
	if(f.id.value==""){
		alert("아이디를 입력하세요");
		f.id.focus();
		return false;
	}
	if(f.name.value==""){
		alert("이름을 입력하세요");
		f.name.focus();
		return false;
	}
		var id = f.id.value;
		var name = f.name.value;
	var url = "passwdcheck_jquery.jsp";
	$.ajax({
		url:url,
		dataType:'text',
		data:{"id":id,"name":name},
		success : function(data){
			$("#idcheck").text(data.trim()).css("color","black");
	
}
})
}
$.ajaxSetup({
    error: function(jqXHR, exception) {
        if (jqXHR.status === 0) {
            alert('Not connect.\n Verify Network.');
        }
        else if (jqXHR.status == 400) {
            alert('Server understood the request, but request content was invalid. [400]');
        }
        else if (jqXHR.status == 401) {
            alert('Unauthorized access. [401]');
        }
        else if (jqXHR.status == 403) {
            alert('Forbidden resource can not be accessed. [403]');
        }
        else if (jqXHR.status == 404) {
            alert('Requested page not found. [404]');
        }
        else if (jqXHR.status == 500) {
            alert('Internal server error. [500]');
        }
        else if (jqXHR.status == 503) {
            alert('Service unavailable. [503]');
        }
        else if (exception === 'parsererror') {
            alert('Requested JSON parse failed. [Failed]');
        }
        else if (exception === 'timeout') {
            alert('Time out error. [Timeout]');
        }
        else if (exception === 'abort') {
            alert('Ajax request aborted. [Aborted]');
        }
        else {
            alert('Uncaught Error.n' + jqXHR.responseText);
        }
    }
});



</script>
<link href="${root }/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
<DIV class="title">PW 찾기</DIV>
 <div class="content">
<FORM name='frm' method='POST'>
ID와 이름을 입력하세요<br>
 
  <TABLE>
    <TR>
      <TH>ID</TH>
      <TD><input type="text" name="id" size="20"></TD>
    </TR>
    <TR>
      <TH>이름</TH>
      <TD><input type="text" name="name" size="20"></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
  
    <input type="button" value='PW찾기' onclick="return check(this)"><br>
    <input type='button' value='취소' onclick="window.close()">
    <strong><div id="idcheck"></div></strong>
  </DIV>
</FORM>
  </div>
 
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 
