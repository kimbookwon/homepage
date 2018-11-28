package spring.model.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spring.db.webtest.DBClose;
import spring.db.webtest.DBOpen;




@Component
public class MemberDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	public String getGrade(String id) {
		
		return mybatis.selectOne("member.getGrade", id);
	}
	
	public boolean loginCheck(Map map) {
		boolean flag=false;
		int cnt = mybatis.selectOne("member.loginCheck", map);
	if(cnt>0) flag=true;
	return flag;
		
	}
	
	public String getPasswd(Map map) {
		String passwd=null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		String id=(String)map.get("id");
		String name=(String)map.get("name");
		
		StringBuffer sql = new StringBuffer();
		
		sql.append(" select passwd from member ");
		sql.append(" where id=? and mname=? ");


		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				id=rs.getString("passwd");
				
			}
				
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(rs, pstmt, con);
			
		}
		
		return passwd;
		
	}
	
	public String getSid(Map map) {
		String id=null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		String name=(String)map.get("name");
		String email=(String)map.get("email");
		
		StringBuffer sql = new StringBuffer();
		
		sql.append(" select id from member ");
		sql.append(" where mname=? and email=? ");


		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				id=rs.getString("id");
				
			}
				
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(rs, pstmt, con);
			
		}
		
		return id;
		
	}
	
	
	public String getFname(String id) {
		
		return mybatis.selectOne("member.getFname", id);
		
	}
	
	public String readPasswd(Map map) {
	
		
		return mybatis.selectOne("member.readPasswd", map);
		
	}
	public boolean checkPasswd(Map map) {
		boolean flag= false;
		int cnt = mybatis.selectOne("member.checkPasswd", map);
		if(cnt>0) flag=true;
		return flag;
		
	}
	
	public boolean updatePw(Map map) {
		boolean flag=false;
		int cnt = mybatis.update("member.upPasswd", map);
		if(cnt>0) flag= true;
		return flag;
	}
	
	public boolean updateFile(Map map) {
		boolean flag = false;
		int cnt = mybatis.update("member.updateFile", map);
		if(cnt>0) flag=true;
		return flag;
		
	}
	public boolean duplicateEmail(String email) {
		
		boolean flag=false;
		int cnt = mybatis.selectOne("member.checkEmail", email);
		if(cnt>0) flag=true;
		return flag;
		
	}
	
	public boolean duplicatedName(String name) {
		boolean flag=false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		StringBuffer sql=new StringBuffer();
		sql.append(" select count(mname) from member where id=? ");

		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, name);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				int cnt=rs.getInt(1); 
				// append에 count(id) as cnt로하면 1대신 cnt로 받을 수 있다.
				if(cnt>0) flag=true;//중복된 이름
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(rs, pstmt, con);
		}
		return flag;
	}
	
	public boolean duplicatedId(String id) {
		boolean flag=false;
		int cnt = mybatis.selectOne("member.checkId", id);
		if(cnt>0) flag=true;
		return flag;
	}
	
	public int total(Map map) {
		
		
		return mybatis.selectOne("member.total", map);
	}
	
	public MemberDTO read(String id) {
		
		
		return mybatis.selectOne("member.read", id);
	}
	
	public List<MemberDTO> list(Map map){
		
		return mybatis.selectList("member.list", map);
		
	}
	
	public boolean delete(String id) {
		boolean flag=false;
		int cnt = mybatis.delete("member.delete", id);
		if(cnt>0) flag= true;
		return flag;
	}
	
	public boolean create(MemberDTO dto) {
		boolean flag=false;
		
		int cnt =mybatis.insert("member.create", dto);
		if(cnt>0) flag=true;
		return flag;
		
	}
	
	public boolean update(MemberDTO dto) {
		boolean flag=false;
		int cnt=mybatis.update("member.update", dto);
		if(cnt>0) flag=true;
		return flag;
	}
	

	
}
