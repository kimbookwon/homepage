<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%> 

<%	
/* 	MemoDTO dto = (MemoDTO)request.getAttribute("dto");
	boolean flag = (Boolean)request.getAttribute("flag"); */


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
</script>
<link href="${root }/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>

	<div>답변 등록</div>
	<form name="frm" method="post" action="./reply" 
	onsubmit="return incheck(this)">
	<input type="hidden" name="memono" value="${dto.memono }">
	<input type="hidden" name="col" value="${param.col }">
	<input type="hidden" name="word" value="${param.word }">
	<input type="hidden" name="nowPage" value="${param.nowPage }">

	<input type="hidden" name="grpno" value="${dto.grpno }">
	<input type="hidden" name="indent" value="${dto.indent }">
	<input type="hidden" name="ansnum" value="${dto.ansnum }">
		<table class="table table-bordered">
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" size="30" value="${dto.title }"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="30" name="content"></textarea>
				</td>
			</tr>
		</table>
		<div>
			<input type="submit" value="전송">
			<input type="button" value="취소" onclick="history.back()">
		</div>
	</form>

</body>
</html>
