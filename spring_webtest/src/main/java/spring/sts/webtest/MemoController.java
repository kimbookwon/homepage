package spring.sts.webtest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import spring.model.memo.MemoDAO;
import spring.model.memo.MemoDTO;
import spring.model.memo.MemoService;
import spring.utility.webtest.Utility;

@Controller
public class MemoController {

	@Autowired
	private MemoDAO dao;
	@Autowired
	private MemoService mgr;
	
	
	@RequestMapping(value="/memo/delete", method=RequestMethod.POST)
	public String delete(int memono,Model model, HttpServletRequest request) {
		
		boolean flag = dao.delete(memono);
		
		if(flag) {
			   model.addAttribute("nowPage", request.getParameter("nowPage"));
			   model.addAttribute("col", request.getParameter("col"));
			   model.addAttribute("word", request.getParameter("word"));
		return "redirect:/memo/list";
		}else {
			return "/error/error";
		}
	}
	@RequestMapping(value="/memo/delete", method=RequestMethod.GET)
	public String delete(int memono, HttpServletRequest request) {
		
		boolean flag = dao.checkRefnum(memono);
		request.setAttribute("flag", flag);
		return "/memo/delete";
	}
	

	@RequestMapping(value="/memo/reply", method=RequestMethod.POST)
	public String reply(MemoDTO dto, HttpServletRequest request, Model model) {
		

	 	  
	 	if(mgr.reply(dto)) {
	 	   model.addAttribute("nowPage", request.getParameter("nowPage"));
		   model.addAttribute("col", request.getParameter("col"));
		   model.addAttribute("word", request.getParameter("word"));
	 		return "redirect:/memo/list";
	 	}else {
	 		return "/error/error";
	 	}
		
		
		
	}
	
	@RequestMapping(value="/memo/reply", method=RequestMethod.GET)
	public String reply(int memono, Model model) {
		
		MemoDTO dto = dao.replyRead(memono);
		
		model.addAttribute("dto", dto);
		
		
		return "/memo/reply";
	}
	
	@RequestMapping(value="/memo/update",method=RequestMethod.POST)
	public String update(MemoDTO dto,int memono, HttpServletRequest request) {
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
	
		 if(dao.update(dto)) {
			 	dto.setTitle(title);
			 	dto.setContent(content);
			 	dto.setMemono(memono);
				
			 return "redirect:/memo/list";
		 }else {
			 return "/error/error";
		 }
		
			}
	
	@RequestMapping(value="/memo/update",method=RequestMethod.GET)
		public String update(int memono, Model model) {
			
		
	 	MemoDTO dto = dao.read(memono);
	 	

	 	model.addAttribute("dto", dto);
	 	
		return "/memo/update";
		}
	
	
	@RequestMapping("/memo/read")
	public String read(int memono, Model model, HttpServletRequest request) {
		
		dao.updateViewcnt(memono);

		MemoDTO dto = dao.read(memono);
	

		model.addAttribute("dto", dto);
		model.addAttribute("col", request.getParameter("col"));
		model.addAttribute("word", request.getParameter("word"));
		model.addAttribute("nowPage", request.getParameter("nowPage"));

		return "/memo/read";
	}
	
	@RequestMapping(value="/memo/create", method=RequestMethod.POST)
	public String create(MemoDTO dto) {
		
		if(dao.create(dto)) {
			return "redirect:/memo/list";
		}else{
			return "/error/error";
		}

	}
	
	@RequestMapping(value="/memo/create", method=RequestMethod.GET)
	public String create() {
		
		
		return "/memo/create";
	}
	
	@RequestMapping("/memo/list")	
	public String list(HttpServletRequest request) {
		
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		
		if(col.equals("total")) word="";
		//페이징 관련
		int nowPage=1;
		int recordPerPage=5;
		
		if(request.getParameter("nowPage")!=null){
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		//DB에서 가져올 순번 생성
		int sno = ((nowPage-1)*recordPerPage)+1;
		int eno = (nowPage*recordPerPage);
		
		Map map=new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno",sno);
		map.put("eno", eno);

		List<MemoDTO> list = dao.list(map);
		
		int totalRecord=dao.total(map);
		
		String paging = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);
	
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("paging", paging);
		request.setAttribute("list", list);

			return "/memo/list";
	}
	
	
}
