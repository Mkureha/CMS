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

import com.example.demo.domain.position;
import com.example.demo.mapper.PositionMapper;
import com.example.demo.service.PositionService;

@Controller
public class PositionController {

	@Resource(name = "com.example.demo.mapper.PositionMapper")
	PositionMapper mapper;

	@Resource(name = "com.example.demo.service.PositionService")
	PositionService PositionService;

	@RequestMapping("/position")
	@PostMapping
	public String list(HttpServletRequest request, @RequestParam(required = false) String searchtype,
			@RequestParam(required = false) String keyword) {
		position Position = new position();
		String pagenum = request.getParameter("pagenum");
		String contentnum = request.getParameter("contentnum");
		System.out.println("pagenum : " + pagenum);
		System.out.println("contentnum : " + contentnum);
		System.out.println("searchtype : " + searchtype);
		int cpagenum = Integer.parseInt(pagenum);
		int ccontentnum = Integer.parseInt(contentnum);

		Position.setsearchtype(searchtype);
		Position.setkeyword(keyword);

		Position.settotalcount(mapper.Positioncount(Position.getsearchtype(), Position.getkeyword())); // 전체계수
		Position.setpagenum(cpagenum - 1); // 현재 페이지 객체 지정
		Position.setcontentnum(ccontentnum); // 한 페이지 게시글 수
		Position.setcurrentblock(cpagenum); // 현재 페이지블록 번호
		Position.setlastblock(Position.gettotalcount()); // 마지막 블록 전체 게시글 수

		Position.prevnext(cpagenum); // 현재 페이지 화살표
		Position.setstartpage(Position.getcurrentblock()); // 시작페이지 블록 번호
		Position.setendpage(Position.getlastblock(), Position.getcurrentblock()); // 마지막 페이지 블럭 현재 페이지 블록

		List<position> listpage = new ArrayList<position>();
		listpage = mapper.listpage(Position.getpagenum() * 10, Position.getcontentnum(), Position.getsearchtype(),
				Position.getkeyword());

		System.out.println("Parameter keyword : " + request.getParameter("keyword"));
		System.out.println("Board keyword : " + Position.getkeyword());

		request.setAttribute("list", listpage);
		request.setAttribute("page", Position);

		return "position";
	}

	@RequestMapping(value = "/position/detail/{position_code}", method = RequestMethod.GET)
	private String PositionDetail(@PathVariable String position_code, @ModelAttribute position page, Model model)
			throws Exception {

		model.addAttribute("detail", PositionService.positionDetailService(position_code));
		return "position_detail";
	}

	@RequestMapping("/position/insert") // 도서등록폼호출
	private String PositionInsertForm() {
		return "position_insert";
	}

	@RequestMapping("/position/insertProc")
	private String PositionInsertProc(position position, MultipartFile file) throws Exception {

		PositionService.positionInsertService(position);

		return "redirect:/position";
	}

	@RequestMapping("position/update/{position_code}") // 게시글수정폼호출
	private String PositionUpdateForm(@PathVariable String position_code, Model model) throws Exception {

		model.addAttribute("detail", PositionService.positionDetailService(position_code));

		return "Position_update";
	}

	@PostMapping("/position/updateProc")
	@GetMapping
	private String PositionUpdateProc(HttpServletRequest request) throws Exception {

		position position = new position();

		position.setposition_code(request.getParameter("position_code"));
		position.setposition_name(request.getParameter("position_name"));
		position.setposition_name_small(request.getParameter("position_name_small"));
		position.setposition_start(request.getParameter("position_start"));
		position.setposition_end(request.getParameter("position_end"));

		PositionService.positionUpdateService(position);
		return "redirect:position/detail/" + request.getParameter("position_code");
	}

	@RequestMapping("position/delete/{position_code}")
	@GetMapping
	private String PositionDelete(@PathVariable String Position_no) throws Exception {
		PositionService.positionDeleteService(Position_no);

		return "redirect:/position";
	}
}
