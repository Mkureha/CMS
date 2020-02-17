package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
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

import com.example.demo.domain.rank;
import com.example.demo.mapper.RankMapper;
import com.example.demo.service.RankService;

@Controller
public class RankController {

	@Resource(name = "com.example.demo.mapper.RankMapper")
	RankMapper mapper;

	@Resource(name = "com.example.demo.service.RankService")
	RankService RankService;

	private ServletRequest request;

	@RequestMapping("/rank")
	@PostMapping
	public String list(HttpServletRequest request, @RequestParam(required = false) String searchtype,
			@RequestParam(required = false) String keyword) {
		rank Rank = new rank();
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

		List<rank> listpage = new ArrayList<rank>();
		listpage = mapper.listpage(Rank.getpagenum() * 10, Rank.getcontentnum(), Rank.getsearchtype(),
				Rank.getkeyword());

		System.out.println("Parameter keyword : " + request.getParameter("keyword"));
		System.out.println("Board keyword : " + Rank.getkeyword());

		request.setAttribute("list", listpage);
		request.setAttribute("page", Rank);

		return "rank";
	}

	@RequestMapping(value = "/rank/detail/{rank_code}/{rank_start}", method = RequestMethod.GET)
	private String RankDetail(@PathVariable String rank_code, @PathVariable String rank_start, @ModelAttribute rank page, Model model)
			throws Exception {

		System.out.println("rank code : " + rank_code);
		System.out.println("rank start : " + rank_start);
		
		model.addAttribute("detail", RankService.RankDetailService(rank_code, rank_start));
		return "rank_detail";
	}

	@RequestMapping("/rank/insert") // 도서등록폼호출
	private String RankInsertForm() {
		return "rank_insert";
	}

	@RequestMapping("/rank/insertProc")
	private String RankInsertProc(rank rank, MultipartFile file) throws Exception {

		RankService.RankInsertService(rank);

		return "redirect:/rank";
	}

	@RequestMapping("rank/update/{rank_code}") // 게시글수정폼호출
	private String RankUpdateForm(@PathVariable String rank_code, @PathVariable String rank_start, Model model) throws Exception {

		model.addAttribute("detail", RankService.RankDetailService(rank_code, rank_start));

		return "rank_update";
	}

	@PostMapping("/rank/updateProc")
	@GetMapping
	private String RankUpdateProc(HttpServletRequest request) throws Exception {

		rank rank = new rank();

		rank.setrank_code(request.getParameter("rank_code"));
		rank.setrank_name(request.getParameter("rank_name"));
		rank.setrank_name_small(request.getParameter("rank_name_small"));
		rank.setrank_start(request.getParameter("rank_start"));
		rank.setrank_end(request.getParameter("rank_end"));

		RankService.RankUpdateService(rank);
		return "redirect:rank/detail/" + request.getParameter("rank_code");
	}

	@RequestMapping("Rank/delete/{rank_code}")
	@GetMapping
	private String RankDelete(@PathVariable String Rank_no) throws Exception {
		RankService.RankDeleteService(Rank_no);

		return "redirect:/rank";
	}
}
