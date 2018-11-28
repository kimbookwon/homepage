<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %> 

<%
/* 	List<ImgDTO> list = (List)request.getAttribute("list");
	String col = (String)request.getAttribute("col");
	String word = (String)request.getAttribute("word");
	String paging = (String)request.getAttribute("paging");
	int nowPage = (Integer)request.getAttribute("nowPage"); */
%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: ; 
  font-size: 24px; 
} 
.serch{
	width:80%;
	text-align:center;
	margin:20px auto;
}
form{
width: 100%;
height:100%;

}
</style> 
<script type="text/javascript">
	function read(no){
		var url="read";
		url=url+"?no="+no;
		url=url+"&col=${col}";
		url=url+"&word=${word}";
		url=url+"&nowPage=${nowPage}";

		
		location.href=url;
	}

</script>
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->


 <div class="container">
 <h2><span class="glyphicon glyphicon-th-list"></span>
 목록</h2>
  <TABLE class="table table-hover" style="width: 90%; height: 90%">
 <c:choose>
  <c:when test="${fn:length(list) < 1 }">
   

      
    <tr>
    	<td colspan="3">
    	등록된글이없습니다
    	</td>
    </tr>
    </c:when>
  	<c:otherwise>
    	<c:forEach var="dto" items="${list }">

    <tr>
  	<td rowspan="3"	 width="30%">
<c:forEach var="r" begin="0" end="${dto.indent }" step="1">
&nbsp;&nbsp;
</c:forEach>
<c:if test="${dto.indent > 0 }">
<i class='fab fa-replyd'></i>
</c:if>

  	<a href="javascript:read('${dto.no }')">
  	<img src="./storage/${dto.fname }" width="200px" height="130px">
 
	<c:if test="${ut:newImg(dto.mdate) }">
  	<i class='far fa-star'></i> 
  	</c:if>
  	</a>
  	 
  	<th>이름</th>
  	<td>${dto.name }
  	 
  	</td>
  	</tr>
  	
  	<tr>
  	<th>제목</th>
  	<td>${dto.title }</td>
  	</tr>
  	<tr>
  	<th>등록일</th>
  	<td>${dto.mdate }</td>
  	</tr>

    </c:forEach>

</c:otherwise>
    </c:choose>
  </TABLE>
 <div class="serch">
 <FORM name='frm' method='POST' action='./list' >



 <select name="col">
<option value="name"
<c:if test="${col eq name }">
<p>selected</p>
</c:if>

>이름</option>
<option value="title"
<c:if test="${col eq title }">
<p>selected</p>
</c:if>
>제목</option>

<option value ="total">전체검색</option>
  </select>
 <input type="text" name="word" value="${word }">
 <input type="submit" value="검색">
 <input type="button" value ="등록" onclick="location.href='create'">
</form>
 </div>  
  
  
  <DIV class='bottom'>
   ${paging }
  </DIV>
</div>
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
 
</html> 