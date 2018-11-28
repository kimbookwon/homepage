<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%> 


 <%
 /* //검색관련
 	String col = Utility.checkNull(request.getParameter("col"));
 	String word = Utility.checkNull(request.getParameter("word"));
 	
 	if(col.equals("total")) word="";
 	
 	//페이징 관련
 	int nowPage = 1;
 	int recordPerPage = 5;
 	if(request.getParameter("nowPage")!=null){
 		nowPage=Integer.parseInt(request.getParameter("nowPage"));
 	}
 	int sno = ((nowPage-1)*recordPerPage)+1;
 	int eno = (nowPage*recordPerPage);
 	
 	Map map = new HashMap();
 	map.put("col", col);
 	map.put("word", word);
 	map.put("sno", sno);
 	map.put("eno", eno); 
 	
 	List<MemberDTO> list = dao.list(map);
 	int total = dao.total(map);
 	Iterator<MemberDTO> iter = list.iterator();
 	
 	String paging = Utility.paging3(total, nowPage, recordPerPage, col, word);		
 			 */
 
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
.search{
	text-align:center;
	margin: 10px auto;
}

</style> 
<script type="text/javascript">
function read(id){
	var url = "${root}/member/read";
	url = url + "?id="+id;
	url = url + "&col=${col}";
	url = url + "&word=${word}";
	url = url + "&nowPage=${nowPage}";

	
	location.href=url;
}

</script>
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 

 <div class="search">
<FORM name='frm' method='POST' action='./list'>
<select name="col">

<option value="total">전체</option>
<option value="mname"
 <c:if test="${col eq 'mname' }">
 selected
 </c:if>>
<option value="email"

 <c:if test="${col eq 'email' }">
 selected
 </c:if>
>이메일</option>
<option value="id"

 <c:if test="${col eq 'id' }">
 selected
 </c:if>>
</select>
<input type="text" name="word" value="${word }">
<input type="submit" value="검색">
<input type="button" value="회원가입" onclick="location.href='create'">

</FORM>
</div> 
<div class="container">
<h2><span class="glyphicon glyphicon-th list"></span>
회원 목록
</h2>

  <TABLE class="table table-hover">
    
 <c:choose>
  <c:when test="${empty list}">
없습니다.
</c:when>
 <c:otherwise> 
  <c:forEach var="dto" items="${list}">
  <TR>
    	<td rowspan="5" width="30%">
    	<img src="${root}/member/storage/${dto.fname }" width="250px" height="250px" >
    	
    	</td>
      <TH style="width: 30%">아이디</TH>
      <TD style="width: 30%">
      <a href="javascript:read('${dto.id }')">
      ${dto.id }</a></TD>
    </TR>
    
    <tr>
      <TH>이름</TH>
      <TD>${dto.mname }</TD>
    </TR>
    
    <tr>
      <TH>전화번호</TH>
      <TD> ${dto.tel }</TD>
    </TR>
    
    <tr>
      <TH>이메일</TH>
      <TD> ${dto.email }</TD>
    </TR>
    
    <tr>
      <TH>주소</TH>
      <TD>${dto.address1 }
      ${Utility.checkNull(dto.getAddress2())} </TD>
    </TR>
    
    </c:forEach>
 </c:otherwise>
 </c:choose>   

  </TABLE>

  <DIV class='bottom'>
${paging }
  </DIV>
 
</div>
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 
