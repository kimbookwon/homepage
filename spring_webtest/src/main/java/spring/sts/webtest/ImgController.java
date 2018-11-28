package spring.sts.webtest;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.image.ImgDAO;
import spring.model.image.ImgDTO;
import spring.utility.webtest.Utility;



@Controller
public class ImgController {

	@Autowired
	private ImgDAO dao;
	
	@RequestMapping(value="/image/delete", method=RequestMethod.POST)
	public String delete(int no, HttpServletRequest request) {
		boolean flag = dao.delete(no);

		if(flag) {
			
		
			return "redirect:/image/list";
		}else {
			return "/error/error";
		}
		
	}
	
	@RequestMapping(value="/image/delete", method=RequestMethod.GET)
	public String delete() {
		
		return "/image/delete";
	}
	
	@RequestMapping(value="/image/update", method=RequestMethod.POST)
	public String update(HttpServletRequest request, ImgDTO dto, Model model, String oldfile) {
		
		 String upDir= request.getRealPath("/image/storage");
		 
		 Map map = new HashMap();
			map.put("no", dto.getNo()); 
			map.put("passwd",dto.getPasswd());
			
			boolean flag = dao.passCheck(map);
			boolean pflag = false;
			
			int size = (int)dto.getFnameMF().getSize();
			
			String fname = null;
			
			if(flag) {
				if(size>0) {
					if(oldfile!=null)Utility.deleteFile(upDir, oldfile);
					fname = Utility.saveFileSpring(dto.getFnameMF(), upDir);
					
				}
				dto.setFname(fname);
				if(pflag=dao.update(dto)) {
					model.addAttribute("nowPage", request.getParameter("nowPage"));
					model.addAttribute("col", request.getParameter("col"));
					model.addAttribute("word", request.getParameter("word"));
					return "redirect:/image/list";
				
			}else {
				return "/error/error";
			}				
			}else{
				return "/error/passwderror";
			}
		 
	}
	
	@RequestMapping(value="/image/update", method=RequestMethod.GET)
	public String update(HttpServletRequest request, int no) {
		
		 ImgDTO dto = dao.read(no); 
			

		 request.setAttribute("dto", dto);
		
		return "/image/update";
	}
	
	@RequestMapping("/image/read")
	public String read(HttpServletRequest request, Model model, int no) {
	
		
		ImgDTO dto = dao.read(no);
		List list = dao.Imgread(no);
		 	int[] no1 = (int[])list.get(0);
		 	
		 	  String[] fname1 = (String[])list.get(1);

			
		 		 	  
		 	  model.addAttribute("dto", dto);
		 	  model.addAttribute("no1", no1);
		 	  model.addAttribute("no", no);
		 	 model.addAttribute("col", request.getParameter("col"));
		 	model.addAttribute("word", request.getParameter("word"));
		 	model.addAttribute("nowPage", request.getParameter("nowPage"));
		 	model.addAttribute("fname1", fname1);
		 	 
		
		
		
		return "/image/read";
	}
	
	@RequestMapping(value="/image/create",method=RequestMethod.POST)
	public String create(HttpServletRequest request, ImgDTO dto, Model model) {
		
		String upDir = request.getRealPath("/image/storage");
		
		
	 	int size= (int)dto.getFnameMF().getSize();
	 	String fname= null;
	 	if(size>0){
	 		fname=Utility.saveFileSpring(dto.getFnameMF(), upDir);
	 		
	 		
	 		
	 	}else{
	 		fname="member.jpg";
	 	}
	 	dto.setFname(fname);
	 	
	 
	 	
	 	boolean flag= dao.create(dto);
	 	model.addAttribute("flag", flag);
	 	
	 	if(flag) {
	 		
	 		return "redirect:/image/list";
	 	}else {
	 		return "/error/error";
	 	}
		
		
	}
	
	@RequestMapping(value="/image/create",method=RequestMethod.GET)
	public String create() {
		
		return "/image/create";
	}
	
	@RequestMapping("/image/list")
	public String list(HttpServletRequest request,Model model, ImgDTO dto) {
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		
		if(col.equals("total")){
			word=null;
		}
		int nowPage = 1;
		if(request.getParameter("nowPage")!=null){
			nowPage= Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 5;
		int sno = ((nowPage-1)*recordPerPage)+1;
		int eno = nowPage*recordPerPage;
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno",eno);
		
		
		int totalRecord = dao.total(map);
		List list = dao.list(map);
		
		String paging = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);
		
		model.addAttribute("dto", dto);
		model.addAttribute("list", list);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("paging", paging);
		
		return "/image/list";
		
	}
	
	
}
