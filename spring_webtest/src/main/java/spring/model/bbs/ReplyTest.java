package spring.model.bbs;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;



public class ReplyTest {

	public static void main(String[] args) {
		
		Resource resource = new ClassPathResource("daoTest.xml");
		
		BeanFactory factory = new XmlBeanFactory(resource);
		
		ReplyDAO dao = (ReplyDAO)factory.getBean("reply");
		
	//	list(dao);
	//	read(dao);
	//	total(dao);
	//	create(dao);
		//update(dao);
	//	readReply(dao);
	//	reply(dao);
	//	checkRefnum(dao);
		delete(dao);
	//	passwdcheck(dao);
	}

	private static void passwdcheck(ReplyDAO dao) {
		Map map = new HashMap();
		map.put("bbsno", 1);
		map.put("passwd", 1234);
		
		
		if(dao.passCheck(map)) {
			
			p("올바른 패스워드");
		}else {
			p("잘못된 패스워드");
		}
		
	}

	private static void delete(ReplyDAO dao) {
		if(dao.bdelete(bbsno)) {
			p("실패");
			
		}else {
			if(dao.delete(5)) {
				p("성공");
		}
		}
		
	}

	private static void checkRefnum(ReplyDAO dao) {
		if(dao.checkRefnum(2)) {
			p("답변있는 글이므로 삭제할 수 없습니다.");
		}else {
			p("삭제 가능합니다.");
		}
		
	}

	private static void reply(ReplyDAO dao) {
		ReplyDTO dto = dao.replyRead(1);
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

	private static void readReply(ReplyDAO dao) {

		ReplyDTO dto = dao.replyRead(1);
		p("번호:"+dto.getBbsno());
		p("제목:"+dto.getTitle());
		p("indent:"+dto.getIndent());
		p("ansnum:"+dto.getAnsnum());
		p("제목:"+dto.getTitle());		
	}

	private static void update(ReplyDAO dao) {
		ReplyDTO dto = dao.read(2);
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

	private static void create(ReplyDAO dao) {

		ReplyDTO dto = new ReplyDTO();
	
		dto.setContent("내용");
		dto.setId("1234");
		dto.setBbsno(3);

		if(dao.create(dto )) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void total(ReplyDAO dao) {
		int bbsno=3;
		
		int total = dao.total(bbsno);
		
		p("전체레코드수:"+total);
		
	}
	
	

	private static void read(ReplyDAO dao) {
		ReplyDTO dto = dao.read(9);
		p(dto);
	}

	private static void list(ReplyDAO dao) {
		Map map = new HashMap();
/*		map.put("col", 3);
		map.put("word", 1);*/
		
		map.put("bbsno", 1);
		map.put("sno", 1);
		map.put("eno", 10);
		List<ReplyDTO> list = dao.list(map);
		
		Iterator<ReplyDTO> iter = list.iterator();
		
		while(iter.hasNext()) {
			ReplyDTO dto = iter.next();
			p(dto);
			p("------------------");
		}
		
	}

	private static void p(String string) {
		System.out.println(string);
		
	}

	private static void p(ReplyDTO dto) {
		p("번호:"+dto.getRnum());
	
		p("내용:"+dto.getContent());
		p("날짜:"+dto.getRegdate());
		p("Id:"+dto.getId());
		p("부모글:"+dto.getBbsno());
	
	
		
	}

}
