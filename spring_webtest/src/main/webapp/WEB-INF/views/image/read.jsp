<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>

 <%

// 	List list = (List)request.getAttribute("list");
//  	ImgDTO dto = (ImgDTO)request.getAttribute("dto");
//  	String col = (String)request.getAttribute("col");
//  	String word = (String)request.getAttribute("word");
//  	String[] fname1 = (String[])request.getAttribute("fname1");
//  	int nowPage = (Integer)request.getAttribute("nowPage");
//  	int no = (Integer)request.getAttribute("no");
//  	int[] no1 = (int[])request.getAttribute("no1");
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
td{
	text-align: center;
}
</style> 
<script type="text/javascript">
function blist(){
	var url= "list";
	url=url+"?col=${col}";
	url=url+"&word=${word}";
	url=url+"&nowPage=${nowPage}";
	location.href=url;
}
function del(){
	var url = "delete";
	url += "?no=#{no}";		
	url=url+"&col=${col}";
	url=url+"&word=${word}";
	url=url+"&nowPage=${nowPage}";
	location.href=url;
}

function imgread(no1){
	var url = "read";
	url += "?no="+no1;		
	url=url+"&col=${col}";
	url=url+"&word=${word}";
	url=url+"&nowPage=${nowPage}";
	location.href=url;
}
function bupdate(){
	var url = "update";
	
	url += "?no=${dto.no}";	
	url=url+"&col=${col}";
	url=url+"&word=${word}";
	url=url+"&nowPage=${nowPage}";
	location.href=url;
}

</script>
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
<div class="container">
<h2><span class="glyphicon glyphicon-th list"></span>
조회
</h2>
 

  <TABLE class="table table-bordered">
    <TR>
      <td rowspan="2" width="50%">
      <img width="500px" height="250px" src= "./storage/${dto.fname }"></TD>
      <TH style="text-align: center; margin-top: auto;">제목</TH>
      <td style="text-align: center; margin-top: auto;">${dto.title }      
      </td>
    </TR>
    <tr>
    <th style="text-align: center; margin-top: auto;">작성자</th>
    <td style="text-align: center; margin-top: auto;">${dto.name }</td>
    </tr>
   
  </TABLE>
  <table style="margin-left: auto; margin-right: auto;">
  <tr>
  <c:forEach var="i" begin="0" end="4" step="1">
  <c:choose>

  <c:when test="${empty fname1[i]}">
  <td  style="padding: 10px" width="180px" height="120px" ></td>	
  </c:when>
   
   <c:when test="${empty no1[i] }">
   <td style="padding: 10px">
	<img width="180px" height="120px" src="./storage/${fname1[i] }"></td>
   </c:when>
  <c:otherwise>
   
   	<td style="padding: 10px"><a href="javascript:imgread('${no1[i] }')">
	<img width="180px" height="120px" src="./storage/${fname1[i] }"></a></td>	
  </c:otherwise> 

  </c:choose>
  </c:forEach>
 


  
  
  </table>
  </div>
  <DIV class='bottom' style="text-align: center">
    <input type="button" value='수정' onclick="bupdate()">
    <input type='button' value='목록' onclick="blist()">
    <input type='button' value='삭제' onclick="del()">
  </DIV>

 
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 
