<%@ page contentType="text/html; charset=UTF-8" %> 
<% 
	String root = request.getContextPath();
%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">

</script>
<style type="text/css"> 


.table0 {
	padding-bottom: 100%;
	text-align: center;
}
a { 
text-decoration:none;
color: #666666;
 }
 .th0 {
	width : 180px;
	height : 80px;
    background-color: #FAFAFA;
    border-bottom: 1px solid #E0E0E0;
  	font-size: 18px;
    font-weight: bold;
    vertical-align: middle;
    text-align: center;
 }
 .actives {
    color: #DC1400;
    font-weight: bold;
}
table {
display: inline-block;
}

</style> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="./top.jsp" />
<!-- *********************************************** -->
<div style=" float: left; width: 20%; padding:10px;">
<table class="table0" style="color: #666666;">
 	<tbody>
 		<tr>
 			<th class="th0"><a href="<%=root %>/myshop/001.jsp" class="">업소 수정</a></th>
 		</tr>
 		<tr>
 			<th class="th0"><a href="<%=root %>/myshop/002.jsp" class="">메뉴 수정</a></th>
 		</tr>
 		<tr>
 			<th class="th0"><a href="<%=root %>/myshop/003.jsp" class="">리뷰total(명)</a></th>
 		</tr>
 		<tr>
 			<th class="th0"><a href="<%=root %>/myshop/004.jsp" class="">매출 현황</a></th>
 		</tr>
 	</tbody>
 </table>
</div>

<div>
 	<div class="m" style="margin-left:20%; border-bottom: 2px solid #343434; width: 60%; ">
		<img alt="" src="../img/chicken.png" style="margin-bottom: 20px;">
		<p style="font-size: 30px;"> 네네치킨 서초1호점</p>
	</div>
	<div class="m" style="margin-left:20%; border-bottom: 1px solid ; width: 60%; ">
		<p style="margin-top: 40px;font-size: 20px;">업체 정보</p>
	</div>
	<div class="m" style="margin-left:20%;  width: 60%; ">
		<p style="margin-top: 10px;color:#a1a1a1; ">영업시간 &nbsp;&nbsp; &nbsp; 12:30 - 04:00 </p>
	</div>
	
	<div class="m" style="margin-left:20%; border-bottom: 1px solid ; width: 60%; ">
		<p style="margin-top: 50px;font-size: 20px;">결제 정보</p>
	</div>
	<div class="m" style="margin-left:22%;  width: 60%; ">
		<p style="margin-top: 10px;color:#a1a1a1; ">최소주문금액 &nbsp; 15,000원</p>
		<p style="margin-top: 10px;color:#a1a1a1; ">결제수단 &nbsp; &nbsp; &nbsp;&nbsp; 신용카드 , 현금 </p>
	</div>
	
	<div class="m" style="margin-left:20%; border-bottom: 1px solid ; width: 60%; ">
		<p style="margin-top: 50px;font-size: 20px;margin-left:2%;">원산지 정보</p>
	</div>
	<div class="m" style="margin-left:22%;  width: 60%; ">
		<p style="margin-top: 10px;color:#a1a1a1; ">닭고기(국내산)</p>
		
	</div>
	
</div>
 
<!-- *********************************************** -->
<jsp:include page="./indexBottom.jsp" />
</body>
<!-- *********************************************** -->
</html> 