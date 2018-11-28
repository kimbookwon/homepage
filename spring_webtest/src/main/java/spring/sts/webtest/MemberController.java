package spring.sts.webtest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import spring.model.member.MemberDAO;
import spring.model.member.MemberDTO;
import spring.utility.webtest.Utility;




@Controller
public class MemberController {

	@Autowired
	private MemberDAO dao;
	
	@RequestMapping("/admin/list")
	public String list(HttpServletRequest request) {
		
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		if(col.equals("total")){
			word="";
		}
		int nowPage = 1;
		int recordPerPage = 5;
		
		if(request.getParameter("nowPage")!=null){
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int sno = ( nowPage - 1 )* recordPerPage + 1;
		int eno = nowPage * recordPerPage;
		
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		
		int totalRecord = dao.total(map);
		List<MemberDTO> list = dao.list(map);
		
		String paging = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);
		
		request.setAttribute("list", list);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("paging", paging);
		
		return "/member/list";
	}
	
	@RequestMapping(value="/member/delete", method=RequestMethod.POST)
	public String delete(String id, HttpSession session, HttpServletRequest request
			, Model model) {
		
		String upDir=request.getRealPath("/member/storage");
		
		String sid = (String)session.getAttribute("id");
		String grade = (String)session.getAttribute("grade");
		
		String oldfile = dao.getFname(id);
		

		
		boolean flag = dao.delete(id);
		
		if(flag) {
			if(oldfile != null && !oldfile.equals("member.jpg")){
				Utility.deleteFile(upDir, oldfile);
			}
			if(sid!=null && !grade.equals("A")) {
				
			session.invalidate();
			return "redirect:/";
			}else {
				
				model.addAttribute("col", request.getParameter("col"));
				model.addAttribute("word", request.getParameter("word"));
				model.addAttribute("nowPage", request.getParameter("nowPage"));
				return "redirect:/admin/list";
			}
			
			
		}else {
			return "/error/error";
		}
		
	}

	@RequestMapping(value="/member/delete", method=RequestMethod.GET)
	public String delete(String id, HttpSession session, Model model) {
		if(id==null) id=(String)session.getAttribute("id");
		model.addAttribute("id", id);
		
		return "/member/delete";
	}
	
	@RequestMapping(value="/member/updateFile", method=RequestMethod.POST)
	public String updateFile(HttpServletRequest request, MemberDTO dto, String id,
			String oldfile, MultipartFile fnameMF, Model model) {
		
		String upDir = request.getRealPath("/member/storage");
		String fname = null;
		if(fnameMF.getSize()>0){
			if(oldfile!= null && !oldfile.equals("member.jpg")) {
				Utility.deleteFile(upDir, oldfile);
			}
			fname = Utility.saveFileSpring(fnameMF, upDir);
		}else{
			fname = "member.jpg";
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("fname", fname);
		
		boolean flag = dao.updateFile(map);
		
		if(flag) {
			model.addAttribute("id",id);

			return "redirect:/member/read";
		}else {
			return "/error/error";
		}
		
	}
	
	@RequestMapping(value="/member/updateFile", method=RequestMethod.GET)
	public String updateFile() {
			
		return "/member/updateFileForm";
	}
	

	@RequestMapping("/member/email_proc")
	public String email_proc(String email) {
		
		return "/member/email_form";
	}
	
	@RequestMapping(value="/member/update", method=RequestMethod.POST)
	public String update(MemberDTO dto, HttpSession session, Model model, HttpServletRequest request) {
	
		boolean flag = dao.update(dto);
		
		if(flag) {
			
			
			if(session.getAttribute("id")!=null && session.getAttribute("grade").equals("A")) {
				
				model.addAttribute("col", request.getParameter("col"));
				model.addAttribute("word", request.getParameter("word"));
				model.addAttribute("nowPage", request.getParameter("nowPage"));
				
				return "redirect:/admin/list";
			}else {
				return "redirect:/";
			}
			
		}else {
			return "/error/error";
		}
		
		

		
	}
	
	@RequestMapping(value="/member/update", method=RequestMethod.GET)
	public String update(String id, Model model) {
		MemberDTO dto = dao.read(id);
		
		model.addAttribute("dto", dto);
		
		return "/member/update";
	}
	
	@ResponseBody
	@RequestMapping(value="/member/idfind", method=RequestMethod.GET, 
			produces="text/plain;charset=UTF-8")
	public String idfind(@RequestParam Map<String, String> map) {
		
		String id =dao.getSid(map);
		String str = null;
	
		if(id!=null) {
			str = "찾으시는 ID는" + id + " 입니다.";
		}else {
			str = "입력하신 정보가 없습니다.";
		}
		return str;
		
	}
	
	@ResponseBody
	@RequestMapping(value="/member/pwfind", method=RequestMethod.GET, 
			produces="text/plain;charset=UTF-8")
	public String pwfind(@RequestParam Map<String, String> map) {
		
		String passwd = dao.getPasswd(map);
		String str  = null;
		if(passwd!=null) {
			str = "찾으시는 PW는" + passwd + " 입니다.";
		}else {
			str = "입력하신 정보가 없습니다.";
		}
		return str;
		
	}
	
	@RequestMapping("/member/idsearch_form")
	public String idsearch_form() {
		return "/member/idsearch_form";
	}
	
	@RequestMapping("/member/passwdfindform")
	public String passwdfindform() {
		
		return "/member/passwdfindform";
	}
	
	@RequestMapping(value="/member/passwdproc", method=RequestMethod.POST)
	public String passwdform(String id,  MemberDTO dto, String newpasswd, HttpServletRequest request, Model model){
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("passwd", request.getParameter("passwd"));
		map.put("newpasswd", newpasswd);
		System.out.println(request.getParameter("passwd"));
		boolean pflag = dao.checkPasswd(map);
		boolean flag = false;
		if (pflag) {
	
			flag = dao.updatePw(map);
		}
		
		model.addAttribute("pflag", pflag);
		model.addAttribute("flag", flag);
		return "/member/passwdproc";
		
	}
	
	@RequestMapping(value="/member/passwdform", method=RequestMethod.GET)
	public String passwdform(){
		
		return "/member/passwdform";
	}
	
	/*@ResponseBody
	@RequestMapping(value="/member/namecheck_jquery", method=RequestMethod.GET,
			produces="text/plain;charset=UTF-8")
	public String namecheck_jquery() {
		
		return "/member/idsearch_form";
	}
	
	@RequestMapping("/member/idsearch_form")
	public String idsearch_form() {
		
		return "/member/idsearch_form";
	}*/
	
	@RequestMapping("/member/read")
	public String read(String id, HttpSession session, Model model) {
		
		if(id == null) {
			id=(String)session.getAttribute("id");
			
		}
	
		MemberDTO dto = dao.read(id);
		
		model.addAttribute("dto", dto);
		
		return "/member/read";
	}
	
	@RequestMapping("/member/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	
	@RequestMapping(value="/member/login", method=RequestMethod.POST)
	public String login(String c_id,String id, String passwd, HttpServletRequest request,
			HttpSession session, HttpServletResponse response, Model model) {
		
		
		
		Map map = new HashMap();
	 	map.put("id", id);
	 	map.put("passwd",passwd);

	 	//String id = (String)map.get("id");
		/*	String id = (String)map.get("id");
			System.out.println(id);*/
	 	
	 	boolean flag = dao.loginCheck(map);
	 	String url = "/error/passwderror";

	 	
	 	if(flag){
	 		String grade = dao.getGrade(id);
	 		session.setAttribute("id", id);
	 		session.setAttribute("grade", grade);
	 		 // ---------------------------------------------- 
	 	    // Cookie 저장, Checkbox는 선택하지 않으면 null 임 
	 	    // ---------------------------------------------- 
	 		Cookie cookie = null;
	 	       
	 	
	 	       
	 	    if (c_id != null){  // 처음에는 값이 없음으로 null 체크로 처리
	 	      cookie = new Cookie("c_id", "Y");    // 아이디 저장 여부 쿠키 
	 	      cookie.setMaxAge(120);               // 2 분 유지 
	 	      response.addCookie(cookie);          // 쿠키 기록 
	 	   
	 	      cookie = new Cookie("c_id_val", id); // 아이디 값 저장 쿠키  
	 	      cookie.setMaxAge(120);               // 2 분 유지 
	 	      response.addCookie(cookie);          // 쿠키 기록  
	 	    //  return "redirect:/member/list";
	 	      //  return "redirect:/template/home";
	 	    }else{ 
	 	      cookie = new Cookie("c_id", "");     // 쿠키 삭제 
	 	      cookie.setMaxAge(0); 
	 	      response.addCookie(cookie); 
	 	         
	 	      cookie = new Cookie("c_id_val", ""); // 쿠키 삭제 
	 	      cookie.setMaxAge(0); 
	 	      response.addCookie(cookie); 
	 	     
	 	    } 
	 	    url="redirect:/";
	 	    // --------------------------------------------- 
	 	    model.addAttribute("flag", flag);
	 	    
	 	    
	 	    String rflag= request.getParameter("flag");
	 	    String bbsno= request.getParameter("bbsno");
	 	    String nPage= request.getParameter("nPage");
	 	    String nowPage= request.getParameter("nowPage");
	 	    String col= request.getParameter("col");
	 	    String word= request.getParameter("word");
	 	    
	 	    if(rflag!=null && !rflag.equals("")) {
	 	    	model.addAttribute("bbsno", bbsno);
	 	    	model.addAttribute("nPage", nPage);
	 	    	model.addAttribute("nowPage", nowPage);
	 	    	model.addAttribute("col", col);
	 	    	model.addAttribute("word", word);
	 	    	url = "redirect:"+rflag;
	 	    	
	 	}
		
	 	}
	 	return url;
		
	}
	
	@RequestMapping(value="/member/login", method=RequestMethod.GET)
	public String login(HttpServletRequest request) {

		
	/*	--쿠키설정 내용시작----------------------------*/
		String c_id = "";     // ID 저장 여부를 저장하는 변수, Y
		String c_id_val = ""; // ID 값
		 
		Cookie[] cookies = request.getCookies(); 
		Cookie cookie=null;
		 
		if (cookies != null){ 
		 for (int i = 0; i < cookies.length; i++) { 
		   cookie = cookies[i]; 
		 
		   if (cookie.getName().equals("c_id")){ 
		     c_id = cookie.getValue();     // Y 
		   }else if(cookie.getName().equals("c_id_val")){ 
		     c_id_val = cookie.getValue(); // user1... 
		   } 
		 } 
		} 

//		----쿠키설정 내용 끝----------------------------
		
		request.setAttribute("c_id", c_id);
		request.setAttribute("c_id_val", c_id_val);
		
		return "/member/login";
	}
	
	@ResponseBody
	@RequestMapping(value="/member/email_jquery",method=RequestMethod.GET,
			produces="text/plain;charset=UTF-8")
	public String email_jquery(String email) {
		
	 	boolean flag=dao.duplicateEmail(email);
	 	String str = null;
		
		
		if(flag) {
			str = "중복되어서 사용할 수 없습니다. " ;
		}else {
			str = "중복아님";
		}
		
		return str;
		
	}
	
	@ResponseBody
	@RequestMapping(value="/member/id_jquery",method=RequestMethod.GET, 
			produces="text/plain;charset=UTF-8")
	public String id_jquery(String id) {
		
		boolean flag = dao.duplicatedId(id);
		String str = null;
		
		
		if(flag) {
			str = "중복되어서 사용할 수 없습니다. ";
		}else {
			str = "중복아님";
		}
		
		return str;
	}
	
	@RequestMapping("/member/createProc")
	public String create(HttpServletRequest request, MemberDTO dto, Model model) {
		
		String str=null;
		String url = "/member/pcreate";
		 if(dao.duplicatedId(dto.getId())){
			 str="중복된 아이디입니다. 아이디 중복 확인을 하세요";
			 model.addAttribute("str",str);
			
		
		 }else if(dao.duplicateEmail(dto.getEmail())){
			 str="중복된 이메일 입니다. 이메일 중복 확인을 하세요";
			 model.addAttribute("str",str);
			
			
		 }else {
			
		
		String upDir = request.getRealPath("/member/storage");
		
		int size = (int)dto.getFilenameMF().getSize();

	 	String fname=null;
		if(size>0){
	 		fname = Utility.saveFileSpring(dto.getFilenameMF(), upDir);
	 		
	 		
	 	}else{
	 		fname = "member.jpg";
	 	}
	 	 	
		dto.setFname(fname);
		
		
	 	
		boolean flag=dao.create(dto);
		model.addAttribute("flag", flag);
		url = "/member/createProc";
		 }
		 return url;

	}

	
	
	@RequestMapping("/member/create")
	public String create() {
		
		
		return "/member/create";
	}
	
	@RequestMapping("/member/agreement")
	public String agreement() {
		
		
		return "/member/agreement";
	}
}
