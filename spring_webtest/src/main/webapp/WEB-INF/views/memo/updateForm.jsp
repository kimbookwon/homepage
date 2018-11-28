<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>


<%
// 	int memono = (Integer)request.getAttribute("memono");
// 	MemoDTO dto = (MemoDTO)request.getAttribute("dto");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}

div {
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
}




</style>
<script type="text/javascript">
function input(f){
	if(f.title.value==""){
		alert("제목을 입력하세요.");
		f.title.focus();
		return false;
	}
	if(f.content.value==""){
		alert("내용을 입력하세요.");
		f.content.focus();
		return false;
	}
}
</script>
</head>
<body>
	<h2>수정</h2>
	<div class="container">
	<form name="frm" method="post" action="./update" 
	onsubmit="return input(this)">
	<input type="hidden" name="memono" value="${dto.memono }">
	<input type="hidden" name="col" value="${param.col }">
	<input type="hidden" name="word" value="${param.word }">
	<input type="hidden" name="nowPage" value="${param.nowPage }">
	
		<table class="table table-bordered">
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" size="30" 
				value="${dto.title }" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="30" name="content">${dto.content }</textarea>
				</td>
			</tr>
		</table>
		<div>
			<input type="submit" value="수정">
			<input type="button" value="취소" onclick="history.back()">
		</div>
	</form>
</div>
</body>
</html>