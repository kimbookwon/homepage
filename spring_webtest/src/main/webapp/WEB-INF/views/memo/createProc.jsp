<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>


<% 
// 	String title = request.getParameter("title"); 
// 	String content = request.getParameter("content");
	
// 	MemoDAO dao = new MemoDAO();
// 	MemoDTO dto = new MemoDTO();
// 	dto.setTitle(title);
// 	dto.setContent(content);
	boolean flag = (Boolean)request.getAttribute("flag");
	
	
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
  text-align: center; 
 
}
</style> 
</head> 
<body> 

<div>
<%
	if(flag){
		out.println("메모를 등록했습니다.");
	}else{
		out.println("메모 등록을 실패했습니다.");
	}
%>
<br><br>
<input type="button" value="계속 등록" onclick="location.href='./create.do'">
<input type="button" value="목록" onclick="location.href='./list.do'">
</div>

</body> 

</html> 