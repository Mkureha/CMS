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

import com.example.demo.domain.rank_syou;
import com.example.demo.mapper.RankMapper;
import com.example.demo.service.RankService;

@Controller
public class RankController {

	@Resource(name = "com.example.demo.mapper.RankMapper")
	RankMapper mapper;

	@Resource(name = "com.example.demo.service.RankService")
	RankService RankService;

	@RequestMapping("/rank")
	@PostMapping
	public String list(HttpServletRequest request, @RequestParam(required = false) String searchtype,
			@RequestParam(required = false) String keyword) {
		rank_syou Rank = new rank_syou();
		String pagenum = request.getParameter("pagenum");
		String contentnum = request.getParameter("contentnum");
		System.out.println("pagenum : " + pagenum);
		System.out.println("contentnum : " + contentnum);
		System.out.println("searchtype : " + searchtype);
		int cpagenum = Integer.parseInt(pagenum);
		int ccontentnum = Integer.parseInt(contentnum);

		Rank.setsearchtype(searchtype);
		Rank.setkeyword(keyword);

		Rank.settotalcount(mapper.Rankcount(Rank.getsearchtype(), Rank.getkeyword())); // 전체계수
		Rank.setpagenum(cpagenum - 1); // 현재 페이지 객체 지정
		Rank.setcontentnum(ccontentnum); // 한 페이지 게시글 수
		Rank.setcurrentblock(cpagenum); // 현재 페이지블록 번호
		Rank.setlastblock(Rank.gettotalcount()); // 마지막 블록 전체 게시글 수

		Rank.prevnext(cpagenum); // 현재 페이지 화살표
		Rank.setstartpage(Rank.getcurrentblock()); // 시작페이지 블록 번호
		Rank.setendpage(Rank.getlastblock(), Rank.getcurrentblock()); // 마지막 페이지 블럭 현재 페이지 블록

		List<rank_syou> listpage = new ArrayList<rank_syou>();
		listpage = mapper.listpage(Rank.getpagenum() * 10, Rank.getcontentnum(), Rank.getsearchtype(),
				Rank.getkeyword());

		System.out.println("Parameter keyword : " + request.getParameter("keyword"));
		System.out.println("Board keyword : " + Rank.getkeyword());

		request.setAttribute("list", listpage);
		request.setAttribute("page", Rank);

		return "rank";
	}

	@RequestMapping(value = "/rank/detail/{rank_code}/{busyo_start}", method = RequestMethod.GET)
	private String RankDetail(@PathVariable String rank_code, @PathVariable String busyo_start,
			@ModelAttribute rank_syou page, Model model) throws Exception {

		System.out.println("rank code : " + rank_code);
		System.out.println("rank start : " + busyo_start);

		model.addAttribute("detail", RankService.RankDetailService(rank_code, busyo_start));
		return "rank_detail";
	}

	@RequestMapping("/rank/insert") // 도서등록폼호출
	private String RankInsertForm() {
		return "rank_insert";
	}

	@RequestMapping("/rank/insertProc")
	private String RankInsertProc(rank_syou rank, MultipartFile file) throws Exception {

		RankService.RankInsertService(rank);

		return "redirect:/rank?pagenum=1&contentnum=10&searchtype=employee_no&keyword=";
	}

	@RequestMapping("rank/update/{rank_code}/{busyo_start}") // 게시글수정폼호출
	private String RankUpdateForm(@PathVariable String rank_code, @PathVariable String busyo_start, Model model)
			throws Exception {

		model.addAttribute("detail", RankService.RankDetailService(rank_code, busyo_start));

		return "rank_update";
	}

	@PostMapping("/rank/updateProc")
	@GetMapping
	private String RankUpdateProc(HttpServletRequest request) throws Exception {

		rank_syou rank = new rank_syou();

		rank.setbusyo_dai_code(request.getParameter("busyo_dai_code"));
		rank.setbusyo_cyu_code(request.getParameter("busyo_cyu_code"));
		rank.setbusyo_syou_code(request.getParameter("busyo_syou_code"));
		rank.setbusyo_name(request.getParameter("busyo_name"));
		rank.setbusyo_name_small(request.getParameter("busyo_name_small"));
		rank.setbusyo_start(request.getParameter("busyo_start"));
		rank.setbusyo_end(request.getParameter("busyo_end"));
		rank.setrank_code(request.getParameter("rank_code"));

		RankService.RankUpdateService(rank);
		return "redirect:/rank/detail/" + request.getParameter("rank_code") + "/" + request.getParameter("busyo_start");
	}

	@RequestMapping("/rank/delete/{rank_code}/{busyo_start}")
	@GetMapping
	private String RankDelete(@PathVariable String rank_code, @PathVariable String busyo_start) throws Exception {
		RankService.RankDeleteService(rank_code, busyo_start);

		return "redirect:/rank?pagenum=1&contentnum=10&searchtype=employee_no&keyword=";
	}
}
