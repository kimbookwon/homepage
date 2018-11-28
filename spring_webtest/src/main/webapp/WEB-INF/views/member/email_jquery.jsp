<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%> 

 <%
	boolean flag = (Boolean)request.getAttribute("flag");
	String email = (String)request.getAttribute("email");
 
 


 if(flag){
	 out.print(" 검색하신 이메일 " +email+ "는 사용이 불가능합니다.");
 }else{
	 out.print("사용 가능");

 }
  
 %>
 