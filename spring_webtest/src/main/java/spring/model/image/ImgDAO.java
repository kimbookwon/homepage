package spring.model.image;

import java.math.BigDecimal;
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
public class ImgDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	public boolean update(ImgDTO dto) {
		boolean flag = false;
		int cnt = mybatis.update("image.update", dto);
		if(cnt>0) flag=true;
		return flag;
	}


	
	public boolean passCheck(Map map) {
		boolean flag= false;
		int cnt = mybatis.selectOne("image.checkPasswd", map);
		if(cnt>0) flag=true;
		return flag;
	}
	

	public boolean create(ImgDTO dto) {
		boolean flag=false;
		int cnt = mybatis.insert("image.create", dto);
		if(cnt>0) flag=true;
		return flag;
		
		
		
	}
	
	
	public boolean delete(int no) {
		boolean flag = false;
		int cnt=mybatis.delete("image.delete", no);
		if(cnt>0)flag=true;

		return flag;
	}


		public int total(Map map) {
			
			return mybatis.selectOne("image.total", map);
		}
		
		public List<ImgDTO> list(Map map){
			
			return mybatis.selectList("image.list", map);
		}


	
	public ImgDTO read(int no) {
		
		return mybatis.selectOne("image.read", no);
	}

	public List Imgread(int no) {
		List list = new ArrayList();
		Map map = mybatis.selectOne("image.Imgread", no);

		int [] no1 = {
				((BigDecimal)map.get("PRE_NO2")).intValue(),
				((BigDecimal)map.get("PRE_NO1")).intValue(),
				
				((BigDecimal)map.get("NO")).intValue(),
				((BigDecimal)map.get("PO_NO1")).intValue(),
				((BigDecimal)map.get("PO_NO2")).intValue()
		
				
		};
		String[] fname1 = {
				(String)map.get("PRE_FNAME2"),
				(String)map.get("PRE_FNAME1"),
				(String)map.get("FNAME"),
				(String)map.get("PO_FNAME1"),
				(String)map.get("PO_FNAME2")
		};
		System.out.println(fname1);
		System.out.println(no1);
		

		list.add(no1);
		list.add(fname1);

		return list;
	}
	
}
