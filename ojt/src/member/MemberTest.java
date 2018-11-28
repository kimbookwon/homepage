package member;

import java.util.Iterator;
import java.util.List;



public class MemberTest {

	public static void main(String[] args) {
		MemberDAO dao = new MemberDAO();
		
		create(dao);
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



	private static void p(MemberDTO dto) {
		p(dto.getDeptno()+"");
		p(ddto.getDeptname());
		p(ddto.getEmpdtoList());
		
	}


		
	}
}
