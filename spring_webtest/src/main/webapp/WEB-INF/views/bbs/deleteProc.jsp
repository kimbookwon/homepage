<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>  
<%
	
	
	boolean pflag = (Boolean)request.getAttribute("pflag");
	boolean flag = (Boolean)request.getAttribute("flag");
	
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>
<script type="text/javascript">
function blist(){
	var url = "list.do";
	url = url + "?col=<%=request.getParameter("col")%>";
	url = url + "&word=<%=request.getParameter("word")%>";
	url = url + "&nowPage=<%=request.getParameter("nowPage")%>";

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

 
<div class="container">
<h2>처리결과</h2>
 

 <%
 	if(pflag==false){
 		out.print("패스워드가 일치하지 않습니다.<br><br>");
 	}else if(flag){
 		out.print("글을 삭제했습니다.<br><br>");
 	}else{
 		out.print("글삭제를 실패했습니다.<br><br>");
 	}
 %>
 
<%if(pflag==false || flag==false){ %>  

    <input type='button' value='다시시도' onclick="history.back()">
    <input type='button' value='목록' onclick="blist()">


 <%}else{ %>

    <input type='button' value='목록' onclick="blist()">

 <%} %>
 
</div>
</body>
<!-- *********************************************** -->
</html> 