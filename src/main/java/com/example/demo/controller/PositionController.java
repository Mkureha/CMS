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

	// 職責
	// 職責リスト出力
	@RequestMapping("/position")
	@PostMapping
	public String positionpage(HttpServletRequest request, @RequestParam(required = false) String searchtype,
			@RequestParam(required = false) String keyword) {
		position position_dai = new position();
		String pagenum = request.getParameter("pagenum");
		String contentnum = request.getParameter("contentnum");
		System.out.println("pagenum : " + pagenum);
		System.out.println("contentnum : " + contentnum);
		int cpagenum = Integer.parseInt(pagenum);
		int ccontentnum = Integer.parseInt(contentnum);

		position_dai.setsearchtype(searchtype);
		position_dai.setkeyword(keyword);

		position_dai.settotalcount(mapper.Positioncount(position_dai.getsearchtype(), position_dai.getkeyword())); // 전체계수
		position_dai.setpagenum(cpagenum - 1); // 현재 페이지 객체 지정
		position_dai.setcontentnum(ccontentnum); // 한 페이지 게시글 수
		position_dai.setcurrentblock(cpagenum); // 현재 페이지블록 번호
		position_dai.setlastblock(position_dai.gettotalcount()); // 마지막 블록 전체 게시글 수

		position_dai.prevnext(cpagenum); // 현재 페이지 화살표
		position_dai.setstartpage(position_dai.getcurrentblock()); // 시작페이지 블록 번호
		position_dai.setendpage(position_dai.getlastblock(), position_dai.getcurrentblock()); // 마지막 페이지 블럭 현재 페이지 블록

		List<position> positionpage = new ArrayList<position>();
		positionpage = mapper.positionpage(position_dai.getpagenum() * 10, position_dai.getcontentnum(), position_dai.getsearchtype(),
				position_dai.getkeyword());

		System.out.println("Parameter position_code : " + request.getParameter("position_code"));
		System.out.println("Parameter position_name : " + request.getParameter("position_name"));

		request.setAttribute("list", positionpage);
		request.setAttribute("page", position_dai);

		return "position";
	}

	@RequestMapping(value = "/position/detail/{position_code}/{position_start}", method = RequestMethod.GET)
	private String PositionDetail(@PathVariable String position_code, @PathVariable String position_start,
			@ModelAttribute position page, Model model) throws Exception {

		model.addAttribute("detail", PositionService.PositionDetailService(position_code, position_start));
		return "position_dai_detail";
	}

	// 職責入力
	@RequestMapping("/position/insert")
	private String PositionInsertForm() {
		return "position_insert";
	}

	@RequestMapping("/position/insertProc")
	private String PositionInsertProc(position position_dai, MultipartFile file) throws Exception {

		PositionService.PositionInsertService(position_dai);

		return "redirect:/position?pagenum=1&contentnum=10&searchtype=position_code&keyword=";
	}

	@RequestMapping("position/update/{position_code}/{position_start}")
	private String PositionUpdateForm(@PathVariable String position_code, @PathVariable String position_start,
			Model model) throws Exception {

		System.out.println("code :" + position_code);
		System.out.println("start :" + position_start);

		position position = PositionService.PositionDetailService(position_code, position_start);

		System.out.println("code :" + position.position_code);
		System.out.println("name :" + position.position_name);
		System.out.println("Sname :" + position.position_name_small);
		System.out.println("start :" + position.position_start);
		System.out.println("end :" + position.position_end);
		System.out.println("date :" + position.sysdate);

		model.addAttribute("detail", position);

		return "position_update";
	}

	@PostMapping("/position/updateProc")
	@GetMapping
	private String PositionUpdateProc(HttpServletRequest request) throws Exception {

		position position_dai = new position();

		position_dai.setposition_code(request.getParameter("position_code"));
		position_dai.setposition_name(request.getParameter("position_name"));
		position_dai.setposition_name_small(request.getParameter("position_name_small"));
		position_dai.setposition_start(request.getParameter("position_start"));
		position_dai.setposition_end(request.getParameter("position_end"));

		PositionService.PositionUpdateService(position_dai);
		
		return "redirect:/position?pagenum=1&contentnum=10&searchtype=position_code&keyword=";
	}

	@RequestMapping("/position/delete/{position_code}/{position_start}")
	@GetMapping
	private String PositionDelete(@PathVariable String position_code, @PathVariable String position_start)
			throws Exception {
		PositionService.PositionDeleteService(position_code, position_start);

		return "redirect:/position?pagenum=1&contentnum=10&searchtype=position_code&keyword=";
	}

	// 職責END
}
