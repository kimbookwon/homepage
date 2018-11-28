<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp"%> 

 <%
//  String upDir = application.getRealPath("/member/storage");
//  String tempDir = application.getRealPath("/member/temp");
 
//  UploadSave upload = new UploadSave(request, -1, -1, tempDir);
 
//  String id = UploadSave.encode(upload.getParameter("id"));
//  String oldfile = UploadSave.encode(upload.getParameter("oldfile"));
//  FileItem fileItem = upload.getFileItem("fname");
//  String fname = null;
 
//  if(fileItem.getSize()>0){
// 	 UploadSave.deleteFile(upDir, oldfile);//파일 지운다.
// 	 fname=UploadSave.saveFile(fileItem, upDir); //업데이트 파일을 넣어준다.
//  }
// 	 Map map = new HashMap();
// 	 map.put("id", id);
// 	 map.put("fname", fname);
	 
// boolean flag= dao.updateFile(map);
  
 
 %>
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
</style> 
<script type="text/javascript">
function read(){
	var url = "read.do";
	url += "?id=${id}";

	location.href=url;
}

</script>
<link href="${root }/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
<DIV class="title">사진변경</DIV>
<c:choose>
<c:when test="${flag }">
변경성공<br>
    <input type='submit' value='나의 정보' onclick="read()">

</c:when>
<c:otherwise>
변경실패
 <input type='button' value='다시시도' onclick="history.back()">
</c:otherwise>
</c:choose>

 
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 
