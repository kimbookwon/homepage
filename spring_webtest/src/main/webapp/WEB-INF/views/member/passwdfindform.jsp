<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/ssi/ssi.jsp" %> 
    <%
	//String root = request.getContextPath();
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function check(){
	if(frm.id.value==""){
		alert("이름을 입력하세요");
		frm.id.focus();
		return false;
	}
	if(frm.name.value==""){
		alert("이메일을 입력하세요");
		frm.name.focus();
		return false;
	}
	var url = "pwfind";
	var id = frm.id.value;
	var name = frm.name.value;
	$.ajax({
		url:url,
		type:"GET",
		dataType:'text',
		data:{"id":id,"name":name},
		success : function(data){
			$("#pwcheck").text(data.trim()).css("color","black");
	
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- PW찾기 Modal -->
<div id="contact5" class="w3-modal" style="margin-left: 20px">
  <div class="w3-modal-content w3-animate-zoom">
    <div class="w3-container w3-black">
   
      <h1>PW찾기</h1>
    </div>
    <div class="w3-container" style="align:center">
    <p>가입하셨던 <strong>아이디</strong>와 <strong>이름</strong>을 입력하세요</p>
      <form method="GET" name="frm">
        <p><input class="w3-input w3-padding-16 w3-border" type="text" placeholder="아이디" required name="id" value=""></p>
        <p><input class="w3-input w3-padding-16 w3-border" type="text" placeholder="이름" required name="name" value=""></p>
       
       
        <input type="button" value='PW찾기' onclick="return check(this.frm)"><br>
        <p><button class="w3-button" type="button" onclick="history.back()" >뒤로가기</button></p>
          <span id="pwcheck"></span>
      </form>
    </div>
  </div>
</div>
</body>
</html>