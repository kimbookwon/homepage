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

<script type="text/javascript">
function check(){
	if(frm.name.value==""){
		alert("이름을 입력하세요");
		f.name.focus();
		return false;
	}
	if(frm.email.value==""){
		alert("이메일을 입력하세요");
		f.eamil.focus();
		return false;
	}
	var name = frm.name.value;
	var email = frm.email.value;

	var url = "idfind";
	$.ajax({
		url:url,
		type: "GET",
		dataType:'text',
		data:{"name":name,"email":email},
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
<!-- ID찾기 Modal -->
<div id="contact4" class="w3-modal"style="margin-left: 20px">
  <div class="w3-modal-content w3-animate-zoom">
    <div class="w3-container w3-black">
   
      <h1>ID찾기</h1>
    </div>
    <div class="w3-container">
      <p>가입하셨던 <strong>이름</strong>과 <strong>이메일</strong>을 입력하세요</p>
      <form method="GET" name="frm">
        <p><input class="w3-input w3-padding-16 w3-border" type="text" placeholder="이름" required name="name"></p>
        <p><input class="w3-input w3-padding-16 w3-border" type="text" placeholder="이메일 주소" required name="email"></p>
       
        <input type="button" value='ID찾기' onclick="return check(document.frm.value)"><br>
        <p>
        <p><button class="w3-button" type="button" onclick="history.back()" >뒤로가기</button></p>
       <span id="idcheck"></span>
      </form>
    </div>
  </div>
</div>
 
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 
