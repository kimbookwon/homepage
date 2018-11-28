<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
<%@ include file="/ssi/ssi.jsp" %>


<%
//	boolean flag = (Boolean)request.getAttribute("flag");

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

div{
	text-align:center;

}
</style> 
<script type="text/javascript">
function tlist(){
	var url="list";
	  	url=url+"?col=${param.col}";
  	  	url=url+"&word=${param.word}";
  	  	url=url+"&nowPage=${param.nowPage}";
	location.href=url;
	
}
</script>
</head> 
<body> 

<div id="title">처리결과</div>
<div>
<c:if test="${flag }">
삭제되었습니다.
<button onclick="tlist()">목록</button>
</c:if>

<c:if test="${flag eq false }">
삭제에 실패하였습니다.
<input type="button" value="다시시도" onclick="history.back()">
</c:if>




</div>

</body> 
</html> 