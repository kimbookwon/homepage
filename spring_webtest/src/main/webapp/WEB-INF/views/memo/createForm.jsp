<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	

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
function incheck(f){
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
function blist(){
	var url = "list";
	 url = url + "?memono=${dto.memono}";
	url = url + "&col=${col}";
	url = url + "&word=${word}";
	url = url + "&nowPage=${nowPage}";
	location.href=url;
}
</script>
</head>
<body>

	<div class="container">
	<h2><span class="glyphicon glyphicon-th-list"></span>
	등록</h2>
	
	<form name="frm" method="post" action="./create" 
	onsubmit="return incheck(this)">
		<table class="table table-bordered">
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" size="30" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="30" name="content"></textarea>
				</td>
			</tr>
		</table>
		<div>
			<input type="submit" value="전송">
			<input type="button" value="목록" onclick="blist()">
			<input type="button" value="취소" onclick="history.back()">
		</div>
	</form>
	</div>

</body>
</html>
