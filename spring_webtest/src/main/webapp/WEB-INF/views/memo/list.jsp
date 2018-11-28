<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/ssi/ssi.jsp" %>

<%

// 	List<MemoDTO> list = (List)request.getAttribute("list");
// 	String paging = (String)request.getAttribute("paging");
// 	String col = (String)request.getAttribute("col");
// 	String word = (String)request.getAttribute("word");
// 	int nowPage = (Integer)request.getAttribute("nowPage");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
<script type="text/javascript">
function read(memono){
	//alert(memono);
	var url = "./read";
	url = url + "?memono=" + memono;
	url = url + "&col=${col}";
	url = url + "&word=${word}";
	url = url + "&nowPage=${nowPage}";
	location.href = url;
}
</script>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}
/*
div {
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
}

table {
	width: 60%;
	margin: 0 auto;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	padding: 10px
}
a:LINK {
color:#000000;
text-decoration: none;
}
a:VISITED {
color:#000000;
text-decoration: none;
}
a:HOVER {
color:#ff0000;
text-decoration: none;
}
a:ACTIVE {
color:#000000;
text-decoration: none;
}
*/
.search{
	margin: 10px auto;
	text-align: center;

}
</style>
</head>
<body>
	
	<div class="container">
	<h2><span class="glyphicon glyphicon-th-list"></span>
	메모 목록	
	</h2>
	
	
	<table class="table table-hover">
	<tbody>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>날짜</th>
			<th>조회 수</th>
			<th>grpno</th>
			<th>indent</th>
			<th>ansnum</th>
		</tr>
		
		</tbody>
		 <c:choose>
		  <c:when test="${empty list}">
	
		<tbody>
		<tr>
			<td colspan="4">등록된 메모가 없습니다.</td>
		</tr>
		 </c:when>
		 <c:otherwise> 
  <c:forEach var="dto" items="${list}">

		</tbody>
		<tbody>
		<tr>
			<td>${dto.memono }</td>
			<td>
			 <c:forEach begin="1" end="${dto.indent}">&nbsp;&nbsp;</c:forEach>
       <c:if test="${dto.indent>0 }"><i class='fab fa-replyd'></i></c:if>
       <a href="javascript:read('${dto.memono}')">${dto.title}</a>
   <c:if test="${ut:newImg(dto.wdate) }"> <i class='far fa-star'></i>
       </c:if></td>
			<td>${dto.wdate }</td>
			<td>${dto.viewcnt }</td>
			<td>${dto.grpno }</td>			
			<td>${dto.indent }</td>
			<td>${dto.ansnum }</td>						
		</tr>
		</tbody>

	  </c:forEach>
 </c:otherwise>
 </c:choose>  
	</table>
	
	
	<div class="search">
	<form action="list" method="post">
	<select name="col">
	
	<option value="total">전체</option>	
	<option value="title"
	<c:if test="${col eq title }">selected</c:if>

	>제목</option>
	
	<option value="content"
		<c:if test="${col eq title }">selected</c:if>

	>내용</option>

	</select>
	
	<input type="text" name="word">
	<button>검색</button>
	<button type="button" onclick="location.href='create'">등록</button>
	
	
	</form>
	</div>
	
	<div>
${paging }
	</div>
	</div>



</body>
</html>