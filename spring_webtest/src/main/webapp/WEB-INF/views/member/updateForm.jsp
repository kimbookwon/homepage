<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%> 


 <%
 //String id = request.getParameter("id");
 //MemberDTO dto = dao.read(id);
 
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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function sample6_execDaumPostcode() {
	new daum.Postcode(
			{
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var fullAddr = ''; // 최종 주소 변수
					var extraAddr = ''; // 조합형 주소 변수

					// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						fullAddr = data.roadAddress;

					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						fullAddr = data.jibunAddress;
					}

					// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
					if (data.userSelectedType === 'R') {
						//법정동명이 있을 경우 추가한다.
						if (data.bname !== '') {
							extraAddr += data.bname;
						}
						// 건물명이 있을 경우 추가한다.
						if (data.buildingName !== '') {
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
						fullAddr += (extraAddr !== '' ? ' (' + extraAddr
								+ ')' : '');
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
					document.getElementById('sample6_address').value = fullAddr;

					// 커서를 상세주소 필드로 이동한다.
					document.getElementById('sample6_address2').focus();
				}
			}).open();
}

</script>
<script type="text/javascript">
function update(){
	var url = "updateFile";
	url = url + "?id=${dto.id}";
	url = url + "&oldfile=${dto.fname}";
	
	wr = window.open(url,"사진수정","width=500,height=500");
	wr.moveTo((window.screen.width-500)/2,(window.screen.height-500)/2);
	
}
function check(f){
	if(f.tel.value==""){
		alert("전화번호 입력 필수!");
		f.tel.focus();
		return false;
	}
	if(f.email.value==""){
		alert("이메일 입력 필수!");
		f.email.focus();
		return false;
	}
	if(f.zipcode.value==""){
		alert("우편번호 입력 필수!");
		f.zipcode.focus();
		return false;
	}
	if(f.address1.value==""){
		alert("전화번호 입력 필수!");
		f.address1.focus();
		return false;
	}
	if(f.address2.value==""){
		alert("주소 입력 필수!");
		f.address2.focus();
		return false;
	}
	if(f.job.value==""){
		alert("직업 입력 필수!");
		f.job.focus();
		return false;
	}
	
	
}
function emailCheck(email){
	if(email==""){
		alert("이메일을 입력하세요");
		document.frm.email.focus();
	}else{
		var url = "email_proc";
		url = url + "?email=" + email;
		wr = window.open(url,"이메일중복확인","width=500,height=500");
		wr.moveTo((window.screen.width-500)/2,(window.screen.height-500)/2);
	}
}

function emailCheck2(i){
	alert("중복확인 버튼 클릭\n");
	i.blur();//포커스가 벗어난다.
	
	
}
</script>

<link href="${root }/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
<DIV class="title">정보수정</DIV>
 
<FORM name='frm' method='POST' action='./update' onsubmit="return check(this)"
>
<input type="hidden" name="id" value="${dto.id }">
<input type="hidden" name="col" value="${param.col }">
<input type="hidden" name="word" value="${param.word }">
<input type="hidden" name="nowPage" value="${param.nowPage }">

  <TABLE>
  
    <TR>
      <TH>사진</TH>
      <TD> <img src="./storage/${param.fname }"> <br>
      <input type="button" value="사진 변경" name="fname" onclick="update()">
      </TD>
    </TR>
    
    <TR>
      <TH>아이디</TH>
      <TD>${dto.id }</TD>
    </TR>
    
    <TR>
      <TH>이름</TH>
      <TD>${dto.mname }</TD>
    </TR>
    <TR>
      <TH>생일</TH>
      <TD><input type="date" name="bday" value="${dto.bday }"></TD>
       
    </TR>
    
    <TR>
      <TH>전화번호</TH>
      <TD><input type="text" name="tel" value="${dto.tel }"></TD>
      <input type="hidden" name="passwd" value="${dto.passwd }">
    </TR>
    
    <TR>
      <TH>이메일</TH>
      <TD><input type="text" name="email" value="${dto.email }" onclick="emailCheck2(this)">
     <input type="button" value="email 중복확인" onclick="emailCheck(document.frm.email.value)"> 
      </TD>
    </TR>
    
    <TR>
      <TH>우편번호</TH>
      <TD><input type="text" name="zipcode" value="${dto.zipcode }">
      <input type="button" value="우편번호 찾기" onclick="sample6_execDaumPostcode()">
      </TD>
    </TR>
    
    <TR>
      <TH>주소</TH>
      <TD>
      <input type="text" name="address1" value="${dto.address1 }">
      <input type="text" name="address2" value="${dto.address2 }">
      
      </TD>
    </TR>
    
    <TR>
      <TH>직업</TH>
      <TD>
      <select name="job">
      <option value="0">선택하세요</option>
      <option value="A01">회사원</option>
      <option value="A02">전산관련직</option>
      <option value="A03">연구직</option>
      <option value="A04">학생</option>
      <option value="A05">자영업</option>
      <option value="A06">공무원</option>
      <option value="A07">의료인</option>
      <option value="A08">법조인</option>
      <option value="A09">종교/언론/예술인</option>
      <option value="A10">기타</option>      
      </select>
      <script type="text/javascript">
				document.frm.job.value='${dto.job}';
			//	<!--선택박스의 값을 그대로 불러온다. -->
			</script>
      </TD>
    </TR>
    
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='정보수정'>
    <input type='button' value='뒤로' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 
