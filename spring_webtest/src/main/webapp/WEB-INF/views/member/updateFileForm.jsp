
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>  
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
table, tr, td{

border: 1px solid black;
}
</style> 
<script type="text/javascript">
function use(){
	opener.frm.fname.value = document.frm.fname.value;
	self.close();
}



</script>
<link href="${root }/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>

 
<DIV class="title">사진수정</DIV>
 
<FORM name='frm' method='POST' action='./updateFile'
enctype="multipart/form-data">
<input type="hidden" name="id" value="${param.id }">
<input type="hidden" name="oldfile" value="${param.oldfile }">
  <TABLE>
  <tr>
  <th>현재 사진</th>
  <td>  <img src="./storage/${param.oldfile }" style="width: 300px; height: 300px;"></th>
  </tr>
  <br>
    <TR>
      <TH>사진 파일</TH>
      <TD><input type="file" name="fnameMF"></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='수정'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 

</body>
<!-- *********************************************** -->
</html> 
