<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>  
<%
	//request.setCharacterEncoding("utf-8");
%>
<%
//	boolean flag = (Boolean)request.getAttribute("flag");


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
function blist(){
	var url = "list";
	url = url + "?col=${param.col}";
	url = url + "&word=${param.word}";
	url = url + "&nowPage=${param.nowPage}";
	location.href=url;
}

</script>

</head>
<body>

	<div>삭제 확인</div>
	<form action="./delete" method="post">
		<input type="hidden" name="memono" value="${dto.memono }">
		<input type="hidden" name="col" value="${param.col }">
		<input type="hidden" name="word" value="${param.word }">
		<input type="hidden" name="nowPage" value="${param.nowPage }">
		<c:choose>
		<c:when test="${flag }">

		<div class="container">
		댓글 달린 글은 삭제가 불가능합니다. 
		<input
				type="button" value="뒤로가기" onclick="history.back()">
		</div>
		</c:when>
		<c:otherwise>
		<div>
			삭제를 하면 복구 될 수 없습니다.<br>
			<br> 삭제하시려면 삭제버튼을 클릭하세요<br>
			<br> 취소는 '목록'버튼을 누르세요 <br>
		</div>
			<br> <input type="submit" value="삭제 처리"> 
			<input
				type="button" value="목록" onclick="blist()">
		</c:otherwise>
		</c:choose>
	</form>

</body>
</html>
