<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>


<%
// 	MemoDTO dto = (MemoDTO)request.getAttribute("dto");
// 	String col = (String)request.getAttribute("col");
// 	String word = (String)request.getAttribute("word");
// 	int nowPage = (Integer)request.getAttribute("nowPage");
// 	int memono = (Integer)request.getAttribute("memono");
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

}

table {


}



th, td {

}
</style>

<script type="text/javascript">
	function mcreate() {
		var url = "create";
		location.href = url;
	}
	function mupdate(memono) {
		var url = "update";
		url += "?memono=" + memono;
		url = url + "&col=${param.col}";
		url = url + "&word=${param.word}";
		url = url + "&nowPage=${param.nowPage}";
		location.href = url;
	}
	function mdelete(memono) {
		var url = "delete";
		url += "?memono=" + memono;
		url = url + "&col=${param.col}";
		url = url + "&word=${param.word}";
		url = url + "&nowPage=${param.nowPage}";
		location.href = url;
	}
	function mlist() {
		var url = "list";
		url = url + "?col=${param.col}";
		url = url + "&word=${param.word}";
		url = url + "&nowPage=${param.nowPage}";
		location.href = url;
	}
	function mreply(){
		var url= "./reply";
		
		url=url+"?memono=${dto.memono}";
		url = url + "&col=${param.col}";
		url = url + "&word=${param.word}";
		url = url + "&nowPage=${param.nowPage}";
		location.href=url;
		
	}
</script>
</head>
<body>

	<div>조회</div>
	<table class="table table-bordered">
		<tr>
			<th>제목</th>
			<td>${dto.title }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${dto.content }</td>
		</tr>
		<tr>
			<th>조회 수</th>
			<td>${dto.viewcnt }</td>
		</tr>
		<tr>
			<th>등록 일</th>
			<td>${dto.wdate }</td>
		</tr>
	</table>

	<div>
		<input type="button" value="등록" onclick="mcreate()"> <input
			type="button" value="수정"
			onclick="mupdate('${dto.memono}')"> 
			<input type="button" value="삭제"	onclick="mdelete('${dto.memono}')"> 
			<input type="button" value="목록" onclick="mlist()">
		<button onclick="mreply()">답변</button>
	</div>

</body>
</html>