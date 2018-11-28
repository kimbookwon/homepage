<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>


<% 
// boolean flag=(Boolean)request.getAttribute("flag");
// boolean flag2=(Boolean)request.getAttribute("flag2");
// String col = (String)request.getAttribute("col");
// String word = (String)request.getAttribute("word");
// int nowPage = (Integer)request.getAttribute("nowPage");
// ImgDTO dto = (ImgDTO)request.getAttribute("dto");	
 	
%>   
  
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function mread(){
	var url = "read.do";
	url += "?no=${dto.no}";
	url = url + "&col=${col}";
	url = url + "&word=${word}";
	url = url + "&nowPage=${nowPage}";
	
	location.href=url;
}
function blist(){
	var url= "list.do";
	url=url+"?col=${param.col}";
	url=url+"&word=${param.word}";
	url=url+"&nowPage=${param.nowPage}";
	location.href=url;
}
</script>
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
<DIV class="title">정보수정</DIV>
 
 
  <DIV class="content">
  <c:if test="${flag2}" >
  <p>정보가 수정되었습니다.</p>
      <input type='button' value='정보확인' onclick="mread()">
      <input type='button' value='목록' onclick="blist()">
      
  </c:if>
  
  <c:if test="${flag2 eq false}" >
  <p>정보수정이 실패했습니다.</p>
      <input type='button' value='다시시도' onclick="history.back()">
  </c:if>

  

   
  </DIV>
  
 
  <DIV class='bottom'>


  </DIV>

 
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 