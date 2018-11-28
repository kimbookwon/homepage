<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page contentType="text/html; charset=utf-8"  %>

  <c:set var="title" value="나의 여행 블로그"/>
    
    <c:if test="${not empty sessionScope.id && sessionScope.grade =='A' }">
    <c:set var="title" value="관리자 페이지"></c:set>
    </c:if>
    
    <c:choose>
	    
    <c:when test="${empty sessionScope.id }">
    <c:set var="str" value="메인페이지입니다."></c:set>
    </c:when>

    <c:otherwise>
      	<c:set var="str" value="${sessionScope.id}님 안녕하세요"></c:set>
</c:otherwise></c:choose>    
<html>
<head>
	<title>Home</title>
</head>
<body>


<div class="container">
<h1>${title }</h1><br>
<h3>${str }</h3><br>
<img src="images/main.jpg" width="50%"><br>
<c:choose>
<c:when test="${empty sessionScope.id }">
<button onclick="location.href='member/login'">로그인</button><br>
<button onclick="location.href='member/idsearch_form'">아이디 찾기</button><br>
<button onclick="location.href='member/passwdfindform'">비밀번호 찾기</button>
</c:when>
<c:otherwise>
<button onclick="location.href='member/logout'">로그아웃</button>

</c:otherwise>

</c:choose>

<br><br><br> 
<h1> 
Main Page<br> 
</h1> 
</div>

</body>
</html>
