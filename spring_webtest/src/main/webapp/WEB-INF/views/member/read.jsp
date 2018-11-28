<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%> 

<%
	//String id = request.getParameter("id");
	//if(id==null) id = (String)session.getAttribute("id");	
	//MemberDTO dto = dao.read(id);
	
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
function updateFile(){
	var url = "updateFile"
	url = url + "?id=${dto.id}";
	url = url + "&oldfile=${dto.fname}";
	
	wr = window.open(url,"사진수정","width=500,height=500");
	wr.moveTo((window.screen.width-500)/2,(window.screen.height-500)/2);
}
function update(){
	var url = "update";
	url = url + "?id=${dto.id}";
	url = url + "&col=${param.col}";
	url = url + "&word=${param.word}";
	url = url + "&nowPage=${param.nowPage}";
	location.href=url;
}
function passwd(){
	var url = "passwdform";
	url = url + "?id=${dto.id}";


	location.href=url;
	
}
function del(){
	var url = "delete";
	url += "?id=${dto.id}";
	
	location.href=url;
	
}
</script>
<link href="${root }/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
 <input type="hidden" name="id" value="${dto.id }">
<input type="hidden" name="oldfile" value="${param.oldfile }">
<DIV class="title">${dto.mname }의 회원정보</DIV>
 

  <TABLE class="table table-bordered">
  
    <tr>
   <td width="250px" height="250px" colspan="5">
   <img src="./storage/${dto.fname }">
   </td>
  </tr>
  
    <TR>
      <TH style="width: 50%">아이디</TH>
      <TD style="width: 50%">${dto.id }</TD>
    </TR>

    <TR>
      <TH>이름</TH>
      <TD>${dto.mname }</TD>
    </TR>
    <TR>
      <TH>생일</TH>
      <TD>${dto.bday }</TD>
    </TR>
    
    <TR>
      <TH>전화번호</TH>
      <TD>${dto.tel }</TD>
    </TR>
    
    <TR>
      <TH>이메일</TH>
      <TD>${dto.email }</TD>
    </TR>
    
    <TR>
      <TH>우편번호</TH>
      <TD>${dto.zipcode }</TD>
    </TR>
    
    <TR>
      <TH>주소</TH>
      <TD>
     ${dto.address1 }<br>
     ${dto.address2 }
      </TD>
    </TR>
    
    <TR>
      <TH>직업</TH>
      <TD>
      ${dto.job }
      ${ut:jobName(dto.job) }
      	</TD>
    </TR>
    
    
  </TABLE>
  
  <DIV class='bottom'>
    <input type="button" value='정보수정' onclick="update()">
    <input type='button' value='사진수정' onclick="updateFile()">
    <input type='button' value='패스워드 변경' onclick="passwd()">
    <input type='button' value='뒤로' onclick="history.back()">
    <input type='button' value='회원탈퇴' onclick="del()">
  </DIV>

 
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 
