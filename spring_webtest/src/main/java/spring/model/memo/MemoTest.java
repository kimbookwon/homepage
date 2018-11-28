package spring.model.memo;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;


public class MemoTest {

	public static void main(String[] args) {
		
		Resource resource = new ClassPathResource("daoTest.xml");
		
		BeanFactory factory = new XmlBeanFactory(resource);
		
		MemoDAO dao = (MemoDAO)factory.getBean("memodao");
		
	//	list(dao);
		//read(dao);
		//total(dao);
		//create(dao);
	//	update(dao);
	//	readReply(dao);
	//	reply(dao);
	//	checkRefnum(dao);
		delete(dao);
	//	passwdcheck(dao);
	}

	private static void passwdcheck(MemoDAO dao) {
		Map map = new HashMap();
		map.put("bbsno", 1);
		map.put("passwd", 1234);
		
		
		if(dao.passCheck(map)) {
			
			p("올바른 패스워드");
		}else {
			p("잘못된 패스워드");
		}
		
	}

	private static void delete(MemoDAO dao) {
		if(dao.checkRefnum(605)) {
			p("실패");
			
		}else {
			if(dao.delete(5)) {
				p("성공");
		}
		}
		
	}

	private static void checkRefnum(MemoDAO dao) {
		if(dao.checkRefnum(605)) {
			p("답변있는 글이므로 삭제할 수 없습니다.");
		}else {
			p("삭제 가능합니다.");
		}
		
	}

	private static void reply(MemoDAO dao) {
		MemoDTO dto = dao.replyRead(605);
		
		dto.setTitle("1하아아어");
		dto.setContent("게시판 내용");
	
		
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

	private static void readReply(MemoDAO dao) {

		MemoDTO dto = dao.replyRead(602);
		p("번호:"+dto.getMemono());
		p("제목:"+dto.getTitle());
		p("indent:"+dto.getIndent());
		p("ansnum:"+dto.getAnsnum());
		p("제목:"+dto.getTitle());		
	}

	private static void update(MemoDAO dao) {
		MemoDTO dto = dao.read(521);
		
		dto.setTitle("제목 변경");
		dto.setContent("내용변경");
	
		if(dao.update(dto)) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void create(MemoDAO dao) {

		MemoDTO dto = new MemoDTO();

		dto.setTitle("게시판 제목");
		dto.setContent("게시판 내용");
		
		
		if(dao.create(dto )) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void total(MemoDAO dao) {
		Map map = new HashMap();
		map.put("col", "wname");
		map.put("word", "1");
		
		int total = dao.total(map);
		
		p("전체레코드수:"+total);
		
	}

	private static void read(MemoDAO dao) {
		MemoDTO dto = dao.read(521);
		p(dto);
	}

	private static void list(MemoDAO dao) {
		Map map = new HashMap();
		map.put("col", "name");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 10);
		List<MemoDTO> list = dao.list(map);
		
		Iterator<MemoDTO> iter = list.iterator();
		
		while(iter.hasNext()) {
			MemoDTO dto = iter.next();
			p(dto);
			p("------------------");
		}
		
	}

	private static void p(String string) {
		System.out.println(string);
		
	}

	private static void p(MemoDTO dto) {
		
		p("번호:"+dto.getMemono());
		p("제목:"+dto.getTitle());
		p("내용:"+dto.getContent());
		p("날짜:"+dto.getWdate());
		p("조회수:"+dto.getViewcnt());

	
		
	}

}
