<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %> 
<%    
	request.setCharacterEncoding("utf-8");
//	String root = request.getContextPath();
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>Member create</title> 
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.js"></script> 
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
					document.getElementById('sample6_address1').value = fullAddr;

					// 커서를 상세주소 필드로 이동한다.
					document.getElementById('sample6_address2').focus();
				}
			}).open();
}

</script>
<script>
$.ajaxSetup({
    error: function(jqXHR, exception) {
        if (jqXHR.status === 0) {
            alert('Not connect.\n Verify Network.');
        }
        else if (jqXHR.status == 400) {
            alert('Server understood the request, but request content was invalid. [400]');
        }
        else if (jqXHR.status == 401) {
            alert('Unauthorized access. [401]');
        }
        else if (jqXHR.status == 403) {
            alert('Forbidden resource can not be accessed. [403]');
        }
        else if (jqXHR.status == 404) {
            alert('Requested page not found. [404]');
        }
        else if (jqXHR.status == 500) {
            alert('Internal server error. [500]');
        }
        else if (jqXHR.status == 503) {
            alert('Service unavailable. [503]');
        }
        else if (exception === 'parsererror') {
            alert('Requested JSON parse failed. [Failed]');
        }
        else if (exception === 'timeout') {
            alert('Time out error. [Timeout]');
        }
        else if (exception === 'abort') {
            alert('Ajax request aborted. [Aborted]');
        }
        else {
            alert('Uncaught Error.n' + jqXHR.responseText);
        }
    }
});
</script>
</head> 
<body>
<div class="content"> 
  <h2>회원가입</h2>
  <FORM name="frm" method="POST" action="./createProc" enctype="multipart/form-data" onsubmit="return inputcheck(this)">
  <TABLE class="table table-bordered" style="width:100%;height: 100%">
    <TR>
      <TH class="hh1" style="width:20%;height: 20px">사진</TH>
      <TD><input type="file" name="filenameMF" accept=".jpg,.pnd,.gif">
      <br>사진은 JPG, PNG, GIF 파일만 올려주세요.</td>
    </TR>
    <TR>
      <TH class="hh1">*아이디</TH>
      <TD><input type="text" id="id" name="id" size="15" required>
      <input type="button" value="ID확인" onclick="idCheck(document.frm.id.value)">
      <span id="idcheck"></span>
       </TD>
    </TR>
    <TR>
      <TH class="hh1">*패스워드</TH>
      <TD><input type="password" id="passwd" name="passwd" size="15" required>
      </TD>
    </TR>
    <TR>
      <TH class="hh1">*패스워드확인</TH>
      <TD><input type="password" name="repasswd" size="15" required>
      <br>위와 동일하게 패스워드를 입력하세요.</TD>
    </TR>
    
    <TR>
      <TH class="hh1" style="width:50px;height: 20px">생년월일</TH>
      <TD>
      <input type="date" name="bday">
      
   <%--    <select name="year"> 
       <%for(int i=2018; i>=1920; i--){ %>
       <option value="<%=i %>"><%=i %></option>
       <%} %>
  </select>년 
      <select name="month">
       <%for(int i=1; i<=12; i++){ %>
       <option value="<%=i %>"><%=i %></option>
       <%} %>
      </select>월 
     <select name="day">
       <%for(int i=1; i<=31; i++){ %>
       <option value="<%=i %>"><%=i %></option>
       <%} %>
      </select>일  --%>

      </TD>
      </TR>

    
    <TR>
      <TH>*이름</TH>
      <TD><input type="text" name="mname" size="15" required>
     </TD> 
    </TR>
    
    
    <TR>
      <TH>전화번호</TH>
      <TD><input type="text" name="tel" size="15"> <br>
     휴대폰 번호를 입력하세요</TD>
    </TR>
    <TR>
      <TH>*이메일</TH>
      <TD><input type="email" name="email" size="25" required>
      <input type="button" value="중복확인" onclick="emailCheck(document.frm.email.value)">
      <div id="emailcheck"></div>
       </TD>
    </TR>
    <TR>
      <TH>우편번호</TH>
      <TD><input type="text" name="zipcode" size="7" id="sample6_postcode"  placeholder="우편번호" readonly>
      <input type="button" value="우편번호 검색" onclick="sample6_execDaumPostcode()">
      </TD>
    </TR>
    <TR>
      <TH>주소</TH>
      <TD>
      <input type="text" name="address1" size="40" id="sample6_address1" placeholder="주소" readonly required>
      <input type="text" name="address2" size="40" id="sample6_address2" placeholder="상세주소" required>
       <br>상세 주소도 입력하세요</TD>
    </TR>
    <TR>
      <TH>*직업</TH>
      <TD>
      <select name="job">
      <option value="0">선택하세요</option>
      <option value="A01">회사원</option>
      <option value="A02" selected>전산관련직</option>
      <option value="A03">연구직</option>
      <option value="A04">학생</option>
      <option value="A05">자영업</option>
      <option value="A06">공무원</option>
      <option value="A07">의료인</option>
      <option value="A08">법조인</option>
      <option value="A09">종교/언론/예술인</option>
      <option value="A10">기타</option>      
      </select>
      
       <br>직업을 선택하세요</TD>
    </TR>

  </TABLE>
  <DIV class='bottom'>
    <input type='submit' value='가입' >
    <input type='button' value='취소' onclick="location.href='./list'">
  </DIV>
</FORM>
</div>
<script>
function inputcheck(f){
	if(f.id.value==""){
		alert("아이디를 입력하세요.");
		f.id.focus();
		return false;
	}
	if(f.passwd.value==""){
		alert("비밀번호를 입력하세요.");
		f.passwd.focus();
		return false;
	}	
	if(f.passwdd.value!=f.repasswd.value){
		alert("비밀번호가 일치하지 않습니다.");
		f.repasswd.focus();
		return false;
	}
	
	if(f.name.value==""){
		alert("이름을입력하세요");
		f.name.focus();
		return false;
	}
	if(f.job.value=="0"){
		alert("직업을선택하세요.");
		f.job.focus();
		return false;
	}
	
}

function idCheck(id){
	if(id==""){
		alert("아이디를 입력하세요");
		document.frm.id.focus();

	}else{
		var url = "id_jquery"; 
		$.ajax({
			url:url,
			type : "GET",
			dataType:'text',
			data:{"id":id},
			success : function(data){
				$("#idcheck").text(data.trim()).css("color","red");
			}
		})
	}	
	
}
function emailCheck(email){
	if(email==""){
		alert("이메일을 입력하세요");
		document.frm.email.focus();
	}else{
		var url = "email_jquery";
		$.ajax({
			url:url,
			type : "GET",
			dataType:'text',
			data:{"email":email},
			success : function(data){
				$("#emailcheck").text(data.trim()).css("color","red");
			}
		})

		/*
		url = url + "?email=" + email;
		
		wr = window.open(url,"이메일검색","width=480,height=300");
		wr.moveTo((window.screen.width-500)/2,(window.screen.height-500)/2);
		*/
	}
}
</script>

<script type="text/javascript" src="${root }/script/zipcode.js" ></script>
</body>
</html> 