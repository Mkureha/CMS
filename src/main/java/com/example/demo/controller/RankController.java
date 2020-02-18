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

import com.example.demo.domain.rank_cyu;
import com.example.demo.domain.rank_dai;
import com.example.demo.domain.rank_syou;
import com.example.demo.mapper.RankMapper;
import com.example.demo.service.RankService;

@Controller
public class RankController {

	@Resource(name = "com.example.demo.mapper.RankMapper")
	RankMapper mapper;

	@Resource(name = "com.example.demo.service.RankService")
	RankService RankService;

	// 小分類リスト出力
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
		System.out.println("Parameter busyo_dai_code : " + request.getParameter("busyo_dai_code"));
		System.out.println("Parameter busyo_name : " + request.getParameter("busyo_name"));

		request.setAttribute("list", listpage);
		request.setAttribute("page", Rank);

		return "rank";
	}

	@RequestMapping(value = "/rank/detail/{busyo_dai_code}{busyo_cyu_code}{busyo_syou_code}/{busyo_start}", method = RequestMethod.GET)
	private String RankDetail(@PathVariable String busyo_dai_code, @PathVariable String busyo_cyu_code,
			@PathVariable String busyo_syou_code, @PathVariable String busyo_start, @ModelAttribute rank_syou page,
			Model model) throws Exception {

		model.addAttribute("detail",
				RankService.RankDetailService(busyo_dai_code, busyo_cyu_code, busyo_syou_code, busyo_start));
		return "rank_detail";
	}

	// 小分類入力
	@RequestMapping("/rank/insertsyou")
	private String RankInsertForm() {
		return "rank_insert";
	}

	@RequestMapping("/ranksyou/insertProc")
	private String RankInsertProc(rank_syou rank, MultipartFile file) throws Exception {

		RankService.RankInsertService(rank);

		return "redirect:/rank?pagenum=1&contentnum=10&searchtype=busyo_syou_code&keyword=";
	}

	@RequestMapping("rank/update/{busyo_dai_code}{busyo_cyu_code}{busyo_syou_code}/{busyo_start}")
	private String RankUpdateForm(@PathVariable String busyo_dai_code, @PathVariable String busyo_cyu_code,
			@PathVariable String busyo_syou_code, @PathVariable String busyo_start, Model model) throws Exception {

		model.addAttribute("detail",
				RankService.RankDetailService(busyo_dai_code, busyo_cyu_code, busyo_syou_code, busyo_start));

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

		RankService.RankUpdateService(rank);
		return "redirect:/rank/detail/" + request.getParameter("busyo_syou_code") + "/"
				+ request.getParameter("busyo_start");
	}

	@RequestMapping("/rank/delete/{busyo_dai_code}{busyo_cyu_code}{busyo_syou_code}/{busyo_start}")
	@GetMapping
	private String RankDelete(@PathVariable String busyo_dai_code, @PathVariable String busyo_cyu_code,
			@PathVariable String busyo_syou_code, @PathVariable String busyo_start) throws Exception {
		RankService.RankDeleteService(busyo_dai_code, busyo_cyu_code, busyo_syou_code, busyo_start);

		return "redirect:/rank?pagenum=1&contentnum=10&searchtype=busyo_syou_code&keyword=";
	}

	// 小分類END

	// 中分類
	// 中分類入力
	@RequestMapping("/rank/insertcyu") // 도서등록폼호출
	private String RankInsertcyuForm(HttpServletRequest request) throws Exception {

		return "rank_cyu_insert";
	}

	@RequestMapping("/rankcyu/insertProc")
	private String RankInsertProc(rank_cyu rank, MultipartFile file) throws Exception {

		RankService.RankInsertcyuService(rank);

		return "redirect:/rank?pagenum=1&contentnum=10&searchtype=busyo_dai_code&keyword=";
	}
	// 中分類END

	// 大分類
	// 大分類リスト出力
	@RequestMapping("/rankdai")
	@PostMapping
	public String listdai(HttpServletRequest request, @RequestParam(required = false) String searchtype,
			@RequestParam(required = false) String keyword) {
		rank_dai Rankdai = new rank_dai();
		String pagenum = request.getParameter("pagenum");
		String contentnum = request.getParameter("contentnum");
		System.out.println("pagenum : " + pagenum);
		System.out.println("contentnum : " + contentnum);
		System.out.println("searchtype : " + searchtype);
		int cpagenum = Integer.parseInt(pagenum);
		int ccontentnum = Integer.parseInt(contentnum);

		Rankdai.setsearchtype(searchtype);
		Rankdai.setkeyword(keyword);

		Rankdai.settotalcount(mapper.Rankdaicount(Rankdai.getsearchtype(), Rankdai.getkeyword())); // 전체계수
		Rankdai.setpagenum(cpagenum - 1); // 현재 페이지 객체 지정
		Rankdai.setcontentnum(ccontentnum); // 한 페이지 게시글 수
		Rankdai.setcurrentblock(cpagenum); // 현재 페이지블록 번호
		Rankdai.setlastblock(Rankdai.gettotalcount()); // 마지막 블록 전체 게시글 수

		Rankdai.prevnext(cpagenum); // 현재 페이지 화살표
		Rankdai.setstartpage(Rankdai.getcurrentblock()); // 시작페이지 블록 번호
		Rankdai.setendpage(Rankdai.getlastblock(), Rankdai.getcurrentblock()); // 마지막 페이지 블럭 현재 페이지 블록

		List<rank_dai> listdaipage = new ArrayList<rank_dai>();
		listdaipage = mapper.listdaipage(Rankdai.getpagenum() * 10, Rankdai.getcontentnum(), Rankdai.getsearchtype(),
				Rankdai.getkeyword());

		System.out.println("Parameter keyword : " + request.getParameter("keyword"));
		System.out.println("Board keyword : " + Rankdai.getkeyword());
		System.out.println("Parameter busyo_dai_code : " + request.getParameter("busyo_dai_code"));
		System.out.println("Parameter busyo_name : " + request.getParameter("busyo_name"));

		request.setAttribute("list", listdaipage);
		request.setAttribute("page", Rankdai);

		return "rank_dai";
	}

	@RequestMapping(value = "/rankdai/detail/{busyo_dai_code}/{busyo_start}", method = RequestMethod.GET)
	private String RankdaiDetail(@PathVariable String busyo_dai_code, @PathVariable String busyo_start,
			@ModelAttribute rank_dai page, Model model) throws Exception {

		model.addAttribute("detail", RankService.RankdaiDetailService(busyo_dai_code, busyo_start));
		return "rank_dai_detail";
	}

	// 小分類入力
	@RequestMapping("/rankdai/insert")
	private String RankdaiInsertForm() {
		return "rank_dai_insert";
	}

	@RequestMapping("/rankdai/insertProc")
	private String RankdaiInsertProc(rank_dai rank, MultipartFile file) throws Exception {

		RankService.RankdaiInsertService(rank);

		return "redirect:/rankdai?pagenum=1&contentnum=10&searchtype=busyo_dai_code&keyword=";
	}

	@RequestMapping("rankdai/update/{busyo_dai_code}/{busyo_start}")
	private String RankdaiUpdateForm(@PathVariable String busyo_dai_code, @PathVariable String busyo_start, Model model)
			throws Exception {

		model.addAttribute("detail", RankService.RankdaiDetailService(busyo_dai_code, busyo_start));

		return "rank_dai_update";
	}

	@PostMapping("/rankdai/updateProc")
	@GetMapping
	private String RankdaiUpdateProc(HttpServletRequest request) throws Exception {

		rank_dai rank = new rank_dai();

		rank.setbusyo_dai_code(request.getParameter("busyo_dai_code"));
		rank.setbusyo_name(request.getParameter("busyo_name"));
		rank.setbusyo_name_small(request.getParameter("busyo_name_small"));
		rank.setbusyo_start(request.getParameter("busyo_start"));
		rank.setbusyo_end(request.getParameter("busyo_end"));

		RankService.RankdaiUpdateService(rank);
		return "redirect:/rankdai/detail/" + request.getParameter("busyo_dai_code") + "/"
				+ request.getParameter("busyo_start");
	}

	@RequestMapping("/rankdai/delete/{busyo_dai_code}/{busyo_start}")
	@GetMapping
	private String RankdaiDelete(@PathVariable String busyo_dai_code, @PathVariable String busyo_start)
			throws Exception {
		RankService.RankdaiDeleteService(busyo_dai_code, busyo_start);

		return "redirect:/rankdai?pagenum=1&contentnum=10&searchtype=busyo_dai_code&keyword=";
	}

	// 大分類END
}
