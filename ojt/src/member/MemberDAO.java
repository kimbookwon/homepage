package member;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import sqlmap.MyAppSqlConfig;

public class MemberDAO {
	private static SqlSessionFactory sqlMapper;
	private static SqlSession session;
	
	static {
		sqlMapper = MyAppSqlConfig.getSqlMapInstance();
		session = sqlMapper.openSession(true);
	}
	
	public boolean updatePasswd(Map map) {
		boolean flag = false;
		int cnt = session.selectOne("member.updatepasswd", map);
		if(cnt>0) flag=true;
		return flag;
	}
	
	public boolean loginCheck(Map map) {
		boolean flag = false;
		int cnt = session.selectOne("member.logincheck", map);
		if(cnt>0) flag=true;
		return flag;
	}
	
	public String getId(Map map) {
		return session.selectOne("member.getid", map);
	}
	
	public String getPasswd(Map map) {
		return session.selectOne("member.getpasswd", map);
	}
	
	public boolean create(MemberDTO dto) {
		boolean flag = false;
		int cnt = session.insert("member.create", dto);
		if(cnt>0) flag = true;
		
		return flag;
	}
	
	public boolean update(MemberDTO dto) {
		boolean flag = false;
		int cnt = session.update("member.update", dto);
		if(cnt>0) flag=true;
		return flag;
		
	}

	public boolean checkEmail(String m_email) {
		boolean flag = false;
		int cnt = session.selectOne("member.checkemail", m_email);
		if(cnt>0) flag= true;
		return flag;
	}
	
	public boolean orderum(MemberDTO dto) {
		boolean flag=false;
		int cnt =session.update("member.ordernum", dto);
		if(cnt>0) flag=true;
		return flag;
	}
	public boolean delete(String m_id) {
		boolean flag = false;
		int cnt = session.delete("member.delete", m_id);
		if(cnt>0) flag=true;
		return flag;
	}
	public boolean checkPasswd(Map map) {
		boolean flag= false;
		int cnt=session.selectOne("member.checkpasswd", map);
		if(cnt>0) flag=true;
		return flag;
	}
	public boolean checkId(String m_id) {
		boolean flag= false;
		int cnt = session.selectOne("member.checkId", m_id);
		if(cnt>0) flag=true;
		return flag;
	}
	public boolean uppasswd(Map map) {
		boolean flag= false;
		int cnt = session.update("member.uppasswd", map);
		if(cnt>0) flag=true;
		return flag;
	}
	public MemberDTO read(String m_id) {
		return session.selectOne("member.read", m_id);
	}
	public boolean getgrade(Map map) {
		boolean flag= false;
		int cnt = session.update("member.getgrade", map);
		if(cnt>0) flag=true;
		return flag;
	}
	
	public int totalcnt(String m_id) {
		return session.selectOne("member.totalcnt", m_id);
	}
	
	public boolean dailyMileage(String m_id) {
		boolean flag = false;
		int cnt = session.update("member.dailymileage", m_id);
		if(cnt>0) flag = true;
		return flag;
	}
	
	public int totalMileage(String m_id) {
		return session.selectOne("member.totalmileage", m_id);
	}
	
	public String memberVan(String m_id) {
		return session.selectOne("member.van", m_id);
	}
	public boolean updateVan(String m_id) {
		boolean flag= false;
		int cnt = session.update("member.updatevan", m_id);
		if(cnt>0) flag=true;
		return flag;
		
	}
}
