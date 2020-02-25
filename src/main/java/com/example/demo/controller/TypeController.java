package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.domain.type;
import com.example.demo.mapper.TypeMapper;
import com.example.demo.service.TypeService;

@Controller
public class TypeController {

	@Resource(name = "com.example.demo.mapper.TypeMapper")
	TypeMapper mapper;

	@Resource(name = "com.example.demo.service.TypeService")
	TypeService TypeService;

	@RequestMapping("/type")
	@PostMapping
	public String list(HttpServletRequest request, @RequestParam(required = false) String searchtype,
			@RequestParam(required = false) String keyword) {
		type Type = new type();
		String pagenum = request.getParameter("pagenum");
		String contentnum = request.getParameter("contentnum");
		System.out.println("pagenum : " + pagenum);
		System.out.println("contentnum : " + contentnum);
		System.out.println("searchtype : " + searchtype);
		int cpagenum = Integer.parseInt(pagenum);
		int ccontentnum = Integer.parseInt(contentnum);

		Type.setsearchtype(searchtype);
		Type.setkeyword(keyword);

		Type.settotalcount(mapper.Typecount(Type.getsearchtype(), Type.getkeyword())); // 전체계수
		Type.setpagenum(cpagenum - 1); // 현재 페이지 객체 지정
		Type.setcontentnum(ccontentnum); // 한 페이지 게시글 수
		Type.setcurrentblock(cpagenum); // 현재 페이지블록 번호
		Type.setlastblock(Type.gettotalcount()); // 마지막 블록 전체 게시글 수

		Type.prevnext(cpagenum); // 현재 페이지 화살표
		Type.setstartpage(Type.getcurrentblock()); // 시작페이지 블록 번호
		Type.setendpage(Type.getlastblock(), Type.getcurrentblock()); // 마지막 페이지 블럭 현재 페이지 블록

		List<type> listpage = new ArrayList<type>();
		listpage = mapper.listpage(Type.getpagenum() * 10, Type.getcontentnum(), Type.getsearchtype(),
				Type.getkeyword());

		System.out.println("Parameter keyword : " + request.getParameter("keyword"));
		System.out.println("Board keyword : " + Type.getkeyword());

		request.setAttribute("list", listpage);
		request.setAttribute("page", Type);

		return "type";
	}

	@RequestMapping(value = "/type/detail/{type_code}/{type_start}", method = RequestMethod.GET)
	private String TypeDetail(@PathVariable String type_code, @PathVariable String type_start, @ModelAttribute type page, Model model)
			throws Exception {

		model.addAttribute("detail", TypeService.typeDetailService(type_code, type_start));
		return "type_detail";
	}

	@RequestMapping("/type/insert") // 도서등록폼호출
	private String TypeInsertForm() {
		return "type_insert";
	}

	@RequestMapping("/type/insertProc")
	private String TypeInsertProc(type type, MultipartFile file) throws Exception {

		TypeService.typeInsertService(type);

		return "redirect:/type?pagenum=1&contentnum=10&searchtype=type_code&keyword=";
	}

	@RequestMapping("type/update/{type_code}/{type_start}") // 게시글수정폼호출
	private String TypeUpdateForm(@PathVariable String type_code, @PathVariable String type_start, Model model) throws Exception {

		model.addAttribute("detail", TypeService.typeDetailService(type_code, type_start));

		return "type_update";
	}

	@PostMapping("/type/updateProc")
	@GetMapping
	private String TypeUpdateProc(HttpServletRequest request) throws Exception {

		type type = new type();

		type.settype_code(request.getParameter("type_code"));
		type.settype_name(request.getParameter("type_name"));
		type.settype_name_small(request.getParameter("type_name_small"));
		type.settype_start(request.getParameter("type_start"));
		type.settype_end(request.getParameter("type_end"));

		TypeService.typeUpdateService(type);
		
		return "redirect:/type?pagenum=1&contentnum=10&searchtype=type_code&keyword=";
	}

	@RequestMapping("type/delete/{type_code}")
	@GetMapping
	private String TypeDelete(@PathVariable String type_code, @PathVariable String type_start) throws Exception {
		TypeService.typeDeleteService(type_code, type_start);

		return "redirect:/type?pagenum=1&contentnum=10&searchtype=type_code&keyword=";
	}
}
