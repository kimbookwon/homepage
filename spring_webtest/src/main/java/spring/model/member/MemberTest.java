package spring.model.member;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;


public class MemberTest {

	public static void main(String[] args) {
		
		Resource resource = new ClassPathResource("daoTest.xml");
		
		BeanFactory factory = new XmlBeanFactory(resource);
		
		MemberDAO dao = (MemberDAO)factory.getBean("memberdao");
		
	//		getFname(dao);
	//	getGrade(dao);
	//	checkemail(dao);
	//	list(dao);
	//	read(dao);
		//total(dao);
	//	logincheck(dao);
	//	readPasswd(dao);
		upPasswd(dao);
	//	updateFile(dao);
	//	checkid(dao);
	//	create(dao);
	//	update(dao);
	//	readReply(dao);
	//	reply(dao);
	//	checkRefnum(dao);
		//delete(dao);
	//	passwdcheck(dao);
	}

	private static void logincheck(MemberDAO dao) {
		Map map = new HashMap();
		map.put("id", "admin");
		map.put("passwd", "1234");
		if(dao.loginCheck(map)) {
			p("로그인");
		}else {
			p("정보가 다릅니다.");
	
		}
		
	}

	private static void getFname(MemberDAO dao) {
		// TODO Auto-generated method stub
		p(dao.getFname("admin"));
	}

	private static void getGrade(MemberDAO dao) {
		p(dao.getGrade("admin"));
		
	}

	private static void checkemail(MemberDAO dao) {
		if(dao.duplicateEmail("123@1")) {
			p("중복");
		}else {
			p("사용할수 있는아이디");
		}
		
	}

	private static void upPasswd(MemberDAO dao) {
		Map map = new HashMap();
		map.put("id", "admin");
		map.put("passwd", "1234");
		if(dao.updatePw(map)) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void updateFile(MemberDAO dao) {
		Map map = new HashMap();
		map.put("id", "admin");
		map.put("fname", "spring.jpg");
		if(dao.updateFile(map)) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void checkid(MemberDAO dao) {
		if(dao.duplicatedId("admin")) {
			p("ID 중복");
		}else {
			p("ID 사용가능");
		}
		
	}

	private static void readPasswd(MemberDAO dao) {

		Map map = new HashMap();
		map.put("id", "admin");
		map.put("mname", 1234);
		p(dao.readPasswd(map));
	}

	private static void passwdcheck(MemberDAO dao) {
		Map map = new HashMap();
		map.put("id", "admin");
		map.put("passwd", "1234");
		
		if(dao.checkPasswd(map)) {
			
			p("올바른 패스워드");
		}else {
			p("잘못된 패스워드");
		}
		
	}

	private static void delete(MemberDAO dao) {
		
			if(dao.delete("admin11")) {
				p("성공");
		
		}else {
			p("실패");
		}
	}
	






	private static void update(MemberDAO dao) {
		MemberDTO dto = dao.read("ede");
		
		dto.setMname("dddd");
		dto.setEmail("11@1f");
		dto.setAddress1("서울");
		dto.setAddress2("111");
		dto.setTel("1234567");
		dto.setBday("123");
		dto.setFname("12e");
		dto.setId("ede");
		dto.setJob("123");
		dto.setZipcode("111");
		dto.setPasswd("1234");
		
		
		if(dao.update(dto)) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void create(MemberDAO dao) {

		MemberDTO dto = new MemberDTO();

		dto.setMname("dddd");
		dto.setEmail("11@1f");
		dto.setAddress1("서울");
		dto.setAddress2("111");
		dto.setTel("1234567");
		dto.setBday("123");
		dto.setFname("12e");
		dto.setId("ede");
		dto.setJob("123");
		dto.setZipcode("111");
		dto.setPasswd("1234");
		if(dao.create(dto)) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void total(MemberDAO dao) {
		Map map = new HashMap();
		map.put("col", "wname");
		map.put("word", "1");
		
		int total = dao.total(map);
		
		p("전체레코드수:"+total);
		
	}

	private static void read(MemberDAO dao) {
		MemberDTO dto = dao.read("admin");
		p(dto);
	}

	private static void list(MemberDAO dao) {
		Map map = new HashMap();
		map.put("col", "no");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 10);
		List<MemberDTO> list = dao.list(map);
		
		Iterator<MemberDTO> iter = list.iterator();
		
		while(iter.hasNext()) {
			MemberDTO dto = iter.next();
			p(dto);
			p("------------------");
		}
		
	}

	private static void p(String string) {
		System.out.println(string);
		
	}

	private static void p(MemberDTO dto) {
		
		p("이름:"+dto.getMname());
		p("아이디:"+dto.getId());
		

		p("email:"+dto.getEmail());
		p("우편번호:"+dto.getZipcode());
		p("주소: "+dto.getAddress1()+dto.getAddress2());
		p("생일 : "+dto.getBday());
		p("직업 : "+dto.getJob());
		p("전화번호:"+dto.getTel());
		p("file:"+dto.getFname());
	

	
		
	}

}
