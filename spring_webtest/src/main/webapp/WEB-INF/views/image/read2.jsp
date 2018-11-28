<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="img.ImgDAO"></jsp:useBean>
<jsp:useBean id="dto" class="img.ImgDTO"></jsp:useBean>
<%
	String upDir = application.getRealPath("/img/storage/");

	int no = Integer.parseInt(request.getParameter("no"));
	dto = dao.read2(no);
	List list = dao.readFname2(no);
	
	int[] imgNo = (int[]) list.get(0);
	String[] imgFname = (String[]) list.get(1);
	int maxCount = imgNo.length;
	
%>  
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>img</title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
.container {
  margin-left: auto;
  margin-right: auto;
}
.img-table {
  width: 50%;
  margin-left: auto;
  margin-right: auto;
  margin-bottom: 20px;
}
.big-image {
	width: 200px;
	height: 200px;
}
ul {
  list-style: none;
}
li {
  float: left;
  margin-left: 10px;
  margin-right: 10px;
}
li img {
  width: 120px;
  height: 120px;
}
.bottom input {
  margin-left: auto;
  margin-right: auto;
}
</style> 
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<div class="container">
  <h2 class="title">title</h2>
  <table class="img-table">
    <tr>
      <td rowspan="3"><img class="big-image img-rounded" src="./storage/<%=dto.getFname()%>"></td>
      <th>title</th>
      <td><%=dto.getTitle() %></td>
    </tr>
    <tr>
      <th>name</th>
      <td><%=dto.getName() %></td>
    </tr>
    <tr>
      <th>mdate</th>
      <td><%=dto.getMdate() %></td>
    </tr>
  </table>
  <div class="button">
    <input type='button' value='수정' onclick='iupdate()'>
    <input type='button' value='삭제' onclick='idel()'>
  </div>
  <ul>
  <%
  	for(int cnt=0;cnt<maxCount;cnt++) {
  		if(imgNo[cnt]<0){
  %>
    <li class="thumbnail"><img src="./storage/member.jpg"></li>
  <%
  		}else{
  			if(imgNo[cnt] == no){
  %>
    <li class="thumbnail"><img src="./storage/<%=imgFname[cnt]%>"></a></li>		
  <%
  			}else{
  %>
    <li class="thumbnail"><a href="javascript:iread('<%=imgNo[cnt]%>')"><img src="./storage/<%=imgFname[cnt]%>"></a></li>
  <%				
  			}
  		}
  	}
  %>
  </ul>

</div>
<script>
function iupdate(){
	var url = "./updateForm.jsp";
	url = url +"?no=<%=no%>";
	location.href = url;
}
function idel(){
	var url = "./deleteForm.jsp";
	url = url + "?no=<%=no%>";
	location.href = url;
}
function iread(no){
	var url = "./read2.jsp";
	url = url + "?no=" + no;
	location.href = url;
}
</script>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 