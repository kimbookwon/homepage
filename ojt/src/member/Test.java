package member;

import java.util.HashMap;
import java.util.Map;

import com.sun.org.apache.bcel.internal.generic.DASTORE;

public class Test {

	public static void main(String[] args) {
MemberDAO dao = new MemberDAO();
//getId(dao);
//updatepasswd(dao);
///logincheck(dao);
//getpasswd(dao);
//checkId(dao);
//getgrade(dao);
		//ordernum(dao);
		//create(dao);
	//	update(dao);
		//delete(dao);
		//checkpasswd(dao);
//checkemail(dao);
//mileage(dao);
//svan(dao);
//updatevan(dao);
//read(dao);
//totalcnt(dao);
//dailymileage(dao);
	}
	
	private static void dailymileage(MemberDAO dao) {
		if(dao.dailyMileage("admin")) {
			
			p("출석 마일리지 적립 성공");
		}else {
			p("실패");
		}
		
	}

	private static void totalcnt(MemberDAO dao) {
		
		p("총 주문횟수" + dao.totalcnt("admin"));
		
	}

	private static void mileage(MemberDAO dao) {
		MemberDTO dto = dao.read("admin");
		p("총 마일리지" + dto.getM_mileage());
		
	}

	private static void updatevan(MemberDAO dao) {
		MemberDTO dto = dao.read("admin2");
		dto.setVan("O");
		p(dto);
	}

	
	
	private static void svan(MemberDAO dao) {

			MemberDTO dto = dao.read("admin2");
			if(dao.memberVan(dto.getM_id())=="O") {
				
					p("로그인 차단");
				
				
			}else {
				p("로그인 가능");
			}
		}
		
	

	private static void read(MemberDAO dao) {
		MemberDTO dto = dao.read("admin2");
		p(dto);
		
	}

	private static void p(MemberDTO dto) {
		p("이름:"+dto.getM_name());
		p("아이디:"+dto.getM_id());
		

		p("email:"+dto.getM_email());
	
		p("전화번호:"+dto.getM_phone());
		p("grade:"+dto.getM_grade());
		p("마일리지 :" +dto.getM_mileage());
		p("주문횟수 : " +dto.getM_ordercnt());
		p("van: " + dto.getVan());
	}

	private static void updatepasswd(MemberDAO dao) {
		Map map = new HashMap();
		map.put("m_id", "admin2");
		map.put("m_password", "1234");
		map.put("m_repassword", "1234");
		
		if(dao.updatePasswd(map)) {
			p("비밀번호 변경 성공"+dao.updatePasswd(map));
		}else {
			p("비밀번호 변경 실페");
		}
		
	}

	private static void logincheck(MemberDAO dao) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("m_id", "admin2");
		map.put("m_password", "1234");
		
		if(dao.loginCheck(map)) {
			p("로그인성공");
		}else {
			p("로그인 실패");
		}
	}

	private static void getId(MemberDAO dao) {
		Map map = new HashMap();
		map.put("m_name", "갑질");
		map.put("m_email", "11@12");
		
		p(dao.getId(map));
		
	}

	private static void getpasswd(MemberDAO dao) {
		Map map = new HashMap();
		map.put("m_id", "admin2");
		map.put("m_email", "11@12");
		
		p(dao.getPasswd(map));
		
	}

	private static void checkemail(MemberDAO dao) {
		if(dao.checkEmail("11")) {
			p("중복");
		}else {
			p("중복아님");
		}
		
	}

	private static void getgrade(MemberDAO dao) {
		Map map = new HashMap();
		map.put("m_id", "admin2");
		map.put("m_ordercnt", 6);
		
		p(dao.getgrade(map));
		
	}



	private static void p(boolean getgrade) {
		System.out.println(getgrade);
		
	}

	private static void checkId(MemberDAO dao) {
		if(dao.checkId("admin2")) {
			p("중복");
		}else {
			p("중복아님");
		}
		
	}

	private static void checkpasswd(MemberDAO dao) {
		Map map = new HashMap();
		map.put("m_id", "admin");
		map.put("m_password", "1234");
		
		if(dao.checkPasswd(map)) {
		
			p("올바른 패스워드");
		}else {
			p("잘못된 패스워드");
		}
		System.out.println(dao.checkPasswd(map));
	}

	private static void delete(MemberDAO dao) {
		if(dao.delete("admin")) {
			p("성공");
		}else {
			p("실패");
		}
		
	}
	private static void ordernum(MemberDAO dao) {
		MemberDTO dto = dao.read("admin2");
	
		if(dao.orderum(dto)){
			p("성공"+dto.getM_ordercnt());
		}else {
			p("실패");
		}
		
	}
	private static void p(int m_ordercnt) {
		System.out.println(m_ordercnt);
		
	}
	private static void update(MemberDAO dao) {
		MemberDTO dto = dao.read("admin2");
	
		dto.setM_email("11@12");
		dto.setM_phone("111");
	
		if(dao.update(dto)) {
			p("성공");
		}else {
			p("실패");
		}
		System.out.println(dao.update(dto));
	}
	private static void create(MemberDAO dao) {
		MemberDTO dto = new MemberDTO();
		dto.setM_id("admin3");
		dto.setM_name("관리자");
		dto.setM_email("qwe@qw.com");
		dto.setM_password("1234");
		dto.setM_phone("010-1111-1111");

	//	dto.setFilesize(100);
	//	dto.setFilename("test.txt");
		
		if(dao.create(dto )) {
			p("성공");
		}else {
			p("실패");
		}
		
		
	}



	private static void p(String string) {
		System.out.println(string);
		
	}


}
