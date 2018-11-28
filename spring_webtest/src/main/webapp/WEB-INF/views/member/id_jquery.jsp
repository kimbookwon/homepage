<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>


<c:choose>
<c:when test="${flag }">
중복된 아이디 입니다.

</c:when>
<c:otherwise>

사용이 가능합니다.

</c:otherwise>

</c:choose>