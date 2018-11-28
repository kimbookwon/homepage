<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//request.setCharacterEncoding("utf-8");
%>
<%@ include file="/ssi/ssi.jsp"%>

<%
// 	List<TeamDTO> list = (List)request.getAttribute("list");
// 	String col = (String)request.getAttribute("col");
// 	String word = (String)request.getAttribute("word");
// 	int nowPage = (Integer)request.getAttribute("nowPage");
// 	String paging = (String)request.getAttribute("paging");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}



div {
	text-align: center;
	
}

table, th, td{

}
*{
text-align: center;
}
.search{

	margin: 5px auto;
}
</style>
<script type="text/javascript">
function read(no){
	//alert(no);
	var url="read";
	url=url + "?no="+no;
	  	url=url+"&col=${col}";
  	  	url=url+"&word=${word}";
  	  	url=url+"&nowPage=${nowPage}";
	location.href=url;
}
function update(no){
	//alert(no);
	var url="update";
	url=url+"?no="+no;
  	url=url+"&col=${col}";
	  	url=url+"&word=${word}";
	  	url=url+"&nowPage=${nowPage}";
	location.href=url;
}
  function del(no){
  	//alert(no);
  	if(confirm("정말 삭제하시겠습니까?")){//삭제할건지 팝업창 생성
  	 	var url="delete";
  	  	url=url+"?no="+no;
	  	url=url+"&col=${col}";
  	  	url=url+"&word=${word}";
  	  	url=url+"&nowPage=${nowPage}";
  	  	location.href=url;
  	  	  	  	
  	}
  	

  }
  function reply(no){
	  var url="reply";
	  url=url+"?no="+no;
	  location.href=url;
	  
	  
  }
</script>

</head>
<body>

	<div>팀 목록</div>
	
	
	<table class="table table-bordered">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>성별</th>
			<th>기술</th>
			<th>전화번호</th>
			<th>grpno</th>
			<th>indent</th>
			<th>ansnum</th>
			<th>수정/삭제/답변</th>
		</tr>
		<c:forEach var="dto" items="${list }">
		<tr>
			<td>${dto.no }</td>

			<td>
			<c:forEach begin="1" end="${dto.indent }">
			
			
			 &nbsp;&nbsp;
			
			</c:forEach>
			<c:if test="${dto.indent >0 }">
		 <i class='fab fa-replyd'></i> 
		</c:if>
		
		<a href="javascript:read('${dto.no }')">
			${dto.name }</a>
			</td>
			<td>${dto.gender }</td>
			<td>${dto.skills }</td>
			<td>${dto.phone }</td>
			<td>${dto.grpno }</td>
			<td>${dto.indent }</td>
			<td>${dto.ansnum }</td>
			<td>
			<a href="javascript:update('${dto.no }')">수정</a>
			/
			<a href="javascript:del('${dto.no }')">삭제</a>
			/
			<a href="javascript:reply('${dto.no }')">답변</a>
			</td>
		</tr>
		

		
		
		</c:forEach>
		
		
		
	</table>
	<form action="list.do" method="post">
	<input type="hidden" value="">
	
	<div class="search">
	
	<select name="col">
	<option value="total">전체</option>
	<option value="name"
	<c:if test="${col eq name }">
	selected
	</c:if>
	
	>이름</option>
	<option value="phone"
		<c:if test="${col eq phone }">
	selected
	</c:if>
	
	>전화번호</option>
	<option value="skills"
		<c:if test="${col eq skills }">
	selected
	</c:if>

	>보유기술</option>		
	</select>
	</div>
	<input type="text" name="word">
	<button>검색</button>
	<button type="button" onclick="location.href='create'">등록</button>
	</form>
	<div>
		${paging }
	</div>

</body>
</html>
