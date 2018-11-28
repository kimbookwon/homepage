package spring.model.team;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;


public class TeamTest {

	public static void main(String[] args) {
		
		Resource resource = new ClassPathResource("daoTest.xml");
		
		BeanFactory factory = new XmlBeanFactory(resource);
		
		TeamDAO dao = (TeamDAO)factory.getBean("teamdao");
		
	//	list(dao);
	//	read(dao);
		//total(dao);
	
	//	create(dao);
	//	update(dao);
	//	readReply(dao);
	//	reply(dao);
		checkRefnum(dao);
	//	delete(dao);
	//	passwdcheck(dao);
	}

	private static void passwdcheck(TeamDAO dao) {
		Map map = new HashMap();
		map.put("bbsno", 1);
		map.put("passwd", 1234);
		
		
		if(dao.passCheck(map)) {
			
			p("올바른 패스워드");
		}else {
			p("잘못된 패스워드");
		}
		
	}

	private static void delete(TeamDAO dao) {
		if(dao.checkRefnum(3)) {
			p("실패");
			
		}else {
			if(dao.delete(2)) {
				p("성공");
		}
		}
	}
	

	private static void checkRefnum(TeamDAO dao) {
		if(dao.checkRefnum(3)) {
			p("답변있는 글이므로 삭제할 수 없습니다.");
		}else {
			p("삭제 가능합니다.");
		}
		
	}

	private static void reply(TeamDAO dao) {
		TeamDTO dto = dao.replyRead(3);
		
		dto.setName("dddd");
		dto.setPhone("1111");
		dto.setAddress("서울");
		dto.setAddress2("111");
		dto.setHobby("독서");
		dto.setSkills("Java");
		dto.setGender("남자");
		dto.setZipcode("111");
		
	
		
		Map map = new HashMap();
		map.put("grpno", dto.getGrpno());
		map.put("ansnum", dto.getAnsnum());
		dao.upAnsnum(map);
		if(dao.replyCreate(dto)) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void readReply(TeamDAO dao) {

		TeamDTO dto = dao.replyRead(4);
		p("번호:"+dto.getNo());
		p("이름:"+dto.getName());
		p("성별:"+dto.getGender());
		p("주소: "+dto.getAddress()+dto.getAddress2());
		p("취미 : "+dto.getHobby());
		p("스킬 : "+dto.getSkills());
		p("전화번호:"+dto.getPhone());
		p("우편번호:"+dto.getZipcode());
		p("Indent:"+dto.getIndent());
		p("ansnum:"+dto.getAnsnum());
	}

	private static void update(TeamDAO dao) {
		TeamDTO dto = dao.read(4);
		
		dto.setName("dddd");
		dto.setPhone("1111");
		dto.setAddress("서울");
		dto.setAddress2("111");
		dto.setHobby("독서");
/*		dto.setSkills("Java");
		dto.setGender("남자");
		dto.setZipcode("111");*/
		
		dto.setPhone("1111");
		if(dao.update(dto)) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void create(TeamDAO dao) {

		TeamDTO dto = new TeamDTO();

		dto.setName("dddd");
		dto.setPhone("1111");
		dto.setAddress("서울");
		dto.setAddress2("111");
		dto.setHobby("독서");
		dto.setSkills("Java");
		dto.setGender("남자");
		dto.setZipcode("111");
		
		if(dao.create(dto)) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void total(TeamDAO dao) {
		Map map = new HashMap();
		map.put("col", "wname");
		map.put("word", "1");
		
		int total = dao.total(map);
		
		p("전체레코드수:"+total);
		
	}

	private static void read(TeamDAO dao) {
		TeamDTO dto = dao.read(1);
		p(dto);
	}

	private static void list(TeamDAO dao) {
		Map map = new HashMap();
		map.put("col", "no");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 10);
		List<TeamDTO> list = dao.list(map);
		
		Iterator<TeamDTO> iter = list.iterator();
		
		while(iter.hasNext()) {
			TeamDTO dto = iter.next();
			p(dto);
			p("------------------");
		}
		
	}

	private static void p(String string) {
		System.out.println(string);
		
	}

	private static void p(TeamDTO dto) {
		
		p("번호:"+dto.getNo());
		p("이름:"+dto.getName());
		p("성별:"+dto.getGender());
		p("주소: "+dto.getAddress()+dto.getAddress2());
		p("취미 : "+dto.getHobby());
		p("스킬 : "+dto.getSkills());
		p("전화번호:"+dto.getPhone());
		p("우편번호:"+dto.getZipcode());
		p("Indent:"+dto.getIndent());
		p("ansnum:"+dto.getAnsnum());

	
		
	}

}
