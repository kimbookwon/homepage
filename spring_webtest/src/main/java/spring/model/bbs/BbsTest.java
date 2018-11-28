package spring.model.bbs;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;


public class BbsTest {

	public static void main(String[] args) {
		
		Resource resource = new ClassPathResource("daoTest.xml");
		
		BeanFactory factory = new XmlBeanFactory(resource);
		
		BbsDAO dao = (BbsDAO)factory.getBean("dao");
		
	//	list(dao);
	//	read(dao);
		//total(dao);
		//create(dao);
		//update(dao);
	//	readReply(dao);
	//	reply(dao);
	//	checkRefnum(dao);
		delete(dao);
	//	passwdcheck(dao);
	}

	private static void passwdcheck(BbsDAO dao) {
		Map map = new HashMap();
		map.put("bbsno", 1);
		map.put("passwd", 1234);
		
		
		if(dao.passCheck(map)) {
			
			p("올바른 패스워드");
		}else {
			p("잘못된 패스워드");
		}
		
	}

	private static void delete(BbsDAO dao) {
		if(dao.checkRefnum(5)) {
			p("실패");
			
		}else {
			if(dao.delete(5)) {
				p("성공");
		}
		}
		
	}

	private static void checkRefnum(BbsDAO dao) {
		if(dao.checkRefnum(2)) {
			p("답변있는 글이므로 삭제할 수 없습니다.");
		}else {
			p("삭제 가능합니다.");
		}
		
	}

	private static void reply(BbsDAO dao) {
		BbsDTO dto = dao.replyRead(1);
		dto.setWname("이길동");
		dto.setContent("게시판 내용");
		dto.setPasswd("1234");
		dto.setFilesize(100);
		dto.setFilename("test.txt");
		dto.setTitle("1하아아어");
		
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

	private static void readReply(BbsDAO dao) {

		BbsDTO dto = dao.replyRead(1);
		p("번호:"+dto.getBbsno());
		p("제목:"+dto.getTitle());
		p("indent:"+dto.getIndent());
		p("ansnum:"+dto.getAnsnum());
		p("제목:"+dto.getTitle());		
	}

	private static void update(BbsDAO dao) {
		BbsDTO dto = dao.read(2);
		dto.setWname("홍순");
		dto.setTitle("제목 변경");
		dto.setContent("내용변경");
		dto.setFilename("test2txt");
		dto.setFilesize(2222);
		if(dao.update(dto)) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void create(BbsDAO dao) {

		BbsDTO dto = new BbsDTO();
		dto.setWname("이길동");
		dto.setTitle("게시판 제목");
		dto.setContent("게시판 내용");
		dto.setPasswd("1234");
		dto.setFilesize(100);
	                	dto.setFilename("test.txt");
		
		if(dao.create(dto )) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void total(BbsDAO dao) {
		Map map = new HashMap();
		map.put("col", "wname");
		map.put("word", "1");
		
		int total = dao.total(map);
		
		p("전체레코드수:"+total);
		
	}

	private static void read(BbsDAO dao) {
		BbsDTO dto = dao.read(9);
		p(dto);
	}

	private static void list(BbsDAO dao) {
		Map map = new HashMap();
		map.put("col", "name");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 10);
		List<BbsDTO> list = dao.list(map);
		
		Iterator<BbsDTO> iter = list.iterator();
		
		while(iter.hasNext()) {
			BbsDTO dto = iter.next();
			p(dto);
			p("------------------");
		}
		
	}

	private static void p(String string) {
		System.out.println(string);
		
	}

	private static void p(BbsDTO dto) {
		p("번호:"+dto.getBbsno());
		p("이름:"+dto.getWname());
		p("제목:"+dto.getTitle());
		p("내용:"+dto.getContent());
		p("날짜:"+dto.getWdate());
		p("조회수:"+dto.getViewcnt());
		p("파일크기:"+dto.getFilename());
		p("파일사이즈:"+dto.getFilesize());
	
		
	}

}
