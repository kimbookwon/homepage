<%@ page contentType="text/html; charset=UTF-8"%>

<%@include file="../ssi/ssi.jsp"%>

<%
// 	boolean flag = (Boolean)request.getAttribute("flag");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 24px;
}

div {
	text-align: center;
	margin-top: 100px;
}
</style>
<script type="text/javascript">
function ilist() {
	var url = "list.do";

	location.href = url;
}
</script>
</head>
<body>
	<div>
	<c:if test="${flag }">
	<p>삭제했습니다</p>
<br> <input type="button" value="목록" onclick="ilist()">
	</c:if>
	<c:if test="${flag eq false}">
	<p>삭제를 실패했습니다</p>
<br> <input type="button" value="다시시도" onclick="history.back()">
	</c:if>


	</div>

</body>
</html>