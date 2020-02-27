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

	// INSERT POPUP
	@RequestMapping("/ranksyou/child")
	private String Insertpopup(Model model) {

		List<rank_dai> listcode = RankService.listcode();
		model.addAttribute("listcode", listcode);

		return "child";
	}

	@RequestMapping("/ranksyou/child/{busyo_dai_code}")
	private String Insertpopup_dai(@PathVariable String busyo_dai_code, Model model) {

		List<rank_dai> listcode = RankService.listcode();
		model.addAttribute("listcode", listcode);

		if (busyo_dai_code.length() > 0) {
			List<rank_cyu> listcyucode = RankService.listcyucode(busyo_dai_code);
			model.addAttribute("listcyucode", listcyucode);
			return "child_dai";
		} else {
			model.addAttribute("listcyucode", new ArrayList<rank_cyu>());
			return "child";
		}
	}

	@RequestMapping("/ranksyou/child/{busyo_dai_code}/{busyo_cyu_code}")
	private String Insertpopup_input(@PathVariable String busyo_dai_code, @PathVariable String busyo_cyu_code,Model model) {

		List<rank_dai> listcode = RankService.listcode();
		model.addAttribute("listcode", listcode);

		List<rank_cyu> listcyucode = RankService.listcyucode(busyo_dai_code);
		model.addAttribute("listcyucode", listcyucode);
		
			return "child_input";
	}
	
	// INSERT POPUP END

	// 小分類リスト出力
	@RequestMapping("/ranksyou")
	@PostMapping
	public String listsyoupage(HttpServletRequest request, @RequestParam(required = false) String searchtype,
			@RequestParam(required = false) String keyword) {
		rank_syou Rank = new rank_syou();
		String pagenum = request.getParameter("pagenum");
		String contentnum = request.getParameter("contentnum");
		System.out.println("pagenum : " + pagenum);
		System.out.println("contentnum : " + contentnum);
		int cpagenum = Integer.parseInt(pagenum);
		int ccontentnum = Integer.parseInt(contentnum);

		Rank.setsearchtype(searchtype);
		Rank.setkeyword(keyword);

		Rank.settotalcount(mapper.Ranksyoucount(Rank.getsearchtype(), Rank.getkeyword())); // 전체계수
		Rank.setpagenum(cpagenum - 1); // 현재 페이지 객체 지정
		Rank.setcontentnum(ccontentnum); // 한 페이지 게시글 수
		Rank.setcurrentblock(cpagenum); // 현재 페이지블록 번호
		Rank.setlastblock(Rank.gettotalcount()); // 마지막 블록 전체 게시글 수

		Rank.prevnext(cpagenum); // 현재 페이지 화살표
		Rank.setstartpage(Rank.getcurrentblock()); // 시작페이지 블록 번호
		Rank.setendpage(Rank.getlastblock(), Rank.getcurrentblock()); // 마지막 페이지 블럭 현재 페이지 블록

		List<rank_syou> listsyoupage = new ArrayList<rank_syou>();
		listsyoupage = mapper.listsyoupage(Rank.getpagenum() * 10, Rank.getcontentnum(), Rank.getsearchtype(),
				Rank.getkeyword());

		System.out.println("Parameter busyo_dai_code : " + request.getParameter("busyo_dai_code"));
		System.out.println("Parameter busyo_name : " + request.getParameter("busyo_name"));

		request.setAttribute("list", listsyoupage);
		request.setAttribute("page", Rank);

		return "rank";
	}

	@RequestMapping(value = "/ranksyou/detail/{busyo_dai_code}/{busyo_cyu_code}/{busyo_syou_code}/{busyo_start}", method = RequestMethod.GET)
	private String RanksyouDetail(@PathVariable String busyo_dai_code, @PathVariable String busyo_cyu_code,
			@PathVariable String busyo_syou_code, @PathVariable String busyo_start, @ModelAttribute rank_syou page,
			Model model) throws Exception {

		model.addAttribute("detail",
				RankService.RanksyouDetailService(busyo_dai_code, busyo_cyu_code, busyo_syou_code, busyo_start));
		return "rank_detail";
	}

	// 小分類入力
	@RequestMapping("/ranksyou/insert")
	private String RanksyouInsertForm(Model model) {

		return "rank_syou_insert";
	}

	@RequestMapping("/ranksyou/insertProc")
	private String RanksyouInsertProc(rank_syou rank, MultipartFile file, Model model) throws Exception {

		RankService.RanksyouInsertService(rank);

		return "redirect:/ranksyou?pagenum=1&contentnum=10&searchtype=busyo_dai_code&keyword=";
	}

	@RequestMapping("ranksyou/update/{busyo_dai_code}/{busyo_cyu_code}/{busyo_syou_code}/{busyo_start}")
	private String RanksyouUpdateForm(@PathVariable String busyo_dai_code, @PathVariable String busyo_cyu_code,
			@PathVariable String busyo_syou_code, @PathVariable String busyo_start, Model model) throws Exception {

		System.out.println("Dcode :" + busyo_dai_code);
		System.out.println("Ccode :" + busyo_cyu_code);
		System.out.println("Scode :" + busyo_syou_code);
		System.out.println("start :" + busyo_start);

		rank_syou rank = RankService.RanksyouDetailService(busyo_dai_code, busyo_cyu_code, busyo_syou_code,
				busyo_start);

		List<rank_dai> listcode = RankService.listcode();
		model.addAttribute("listcode", listcode);

		List<rank_cyu> listcyucode = RankService.listcyucode(busyo_dai_code);
		model.addAttribute("listcyucode", listcyucode);

		model.addAttribute("detail", rank);

		return "rank_update";
	}

	@PostMapping("/ranksyou/updateProc")
	@GetMapping
	private String RanksyouUpdateProc(HttpServletRequest request, Model model) throws Exception {

		rank_syou rank = new rank_syou();

		rank.setbusyo_dai_code(request.getParameter("busyo_dai_code"));
		rank.setbusyo_cyu_code(request.getParameter("busyo_cyu_code"));
		rank.setbusyo_syou_code(request.getParameter("busyo_syou_code"));
		rank.setbusyo_name(request.getParameter("busyo_name"));
		rank.setbusyo_name_small(request.getParameter("busyo_name_small"));
		rank.setbusyo_start(request.getParameter("busyo_start"));
		rank.setbusyo_end(request.getParameter("busyo_end"));

		RankService.RanksyouUpdateService(rank);

		return "redirect:/ranksyou?pagenum=1&contentnum=10&searchtype=busyo_dai_code&keyword=";
	}

	@RequestMapping("/ranksyou/delete/{busyo_dai_code}/{busyo_cyu_code}/{busyo_syou_code}/{busyo_start}")
	@GetMapping
	private String RanksyouDelete(@PathVariable String busyo_dai_code, @PathVariable String busyo_cyu_code,
			@PathVariable String busyo_syou_code, @PathVariable String busyo_start) throws Exception {
		RankService.RanksyouDeleteService(busyo_dai_code, busyo_cyu_code, busyo_syou_code, busyo_start);

		return "redirect:/ranksyou?pagenum=1&contentnum=10&searchtype=busyo_dai_code&keyword=";
	}

	// 小分類END

	// 中分類
	// 中分類リスト出力
	@RequestMapping("/rankcyu")
	@PostMapping
	public String listcyupage(HttpServletRequest request, @RequestParam(required = false) String searchtype,
			@RequestParam(required = false) String keyword, Model model) {
		rank_cyu rank_cyu = new rank_cyu();
		String pagenum = request.getParameter("pagenum");
		String contentnum = request.getParameter("contentnum");
		System.out.println("pagenum : " + pagenum);
		System.out.println("contentnum : " + contentnum);
		int cpagenum = Integer.parseInt(pagenum);
		int ccontentnum = Integer.parseInt(contentnum);

		rank_cyu.setsearchtype(searchtype);
		rank_cyu.setkeyword(keyword);

		rank_cyu.settotalcount(mapper.Rankcyucount(rank_cyu.getsearchtype(), rank_cyu.getkeyword())); // 전체계수
		rank_cyu.setpagenum(cpagenum - 1); // 현재 페이지 객체 지정
		rank_cyu.setcontentnum(ccontentnum); // 한 페이지 게시글 수
		rank_cyu.setcurrentblock(cpagenum); // 현재 페이지블록 번호
		rank_cyu.setlastblock(rank_cyu.gettotalcount()); // 마지막 블록 전체 게시글 수

		rank_cyu.prevnext(cpagenum); // 현재 페이지 화살표
		rank_cyu.setstartpage(rank_cyu.getcurrentblock()); // 시작페이지 블록 번호
		rank_cyu.setendpage(rank_cyu.getlastblock(), rank_cyu.getcurrentblock()); // 마지막 페이지 블럭 현재 페이지 블록

		List<rank_cyu> listcyupage = new ArrayList<rank_cyu>();
		listcyupage = mapper.listcyupage(rank_cyu.getpagenum() * 10, rank_cyu.getcontentnum(), rank_cyu.getsearchtype(),
				rank_cyu.getkeyword());

		List<rank_dai> listcode = RankService.listcode();
		model.addAttribute("listcode", listcode);

		System.out.println("Parameter busyo_cyu_code : " + request.getParameter("busyo_cyu_code"));
		System.out.println("Parameter busyo_name : " + request.getParameter("busyo_name"));

		request.setAttribute("list", listcyupage);
		request.setAttribute("page", rank_cyu);

		return "rank_cyu";
	}

	@RequestMapping(value = "/rankcyu/detail/{busyo_dai_code}/{busyo_cyu_code}/{busyo_start}", method = RequestMethod.GET)
	private String RankcyuDetail(@PathVariable String busyo_dai_code, @PathVariable String busyo_cyu_code,
			@PathVariable String busyo_start, @ModelAttribute rank_cyu page, Model model) throws Exception {

		model.addAttribute("detail", RankService.RankcyuDetailService(busyo_dai_code, busyo_cyu_code, busyo_start));
		return "rank_cyu_detail";
	}

	// 中分類入力
	@RequestMapping("/rankcyu/insert")
	private String RankcyuInsertForm(HttpServletRequest request, Model model) {

		List<rank_dai> listcode = RankService.listcode();
		model.addAttribute("listcode", listcode);

		return "rank_cyu_insert";
	}

	@RequestMapping("/rankcyu/insertProc")
	private String RankcyuInsertProc(rank_cyu rank_cyu, MultipartFile file, Model model) throws Exception {

		RankService.RankcyuInsertService(rank_cyu);

		return "redirect:/rankcyu?pagenum=1&contentnum=10&searchtype=busyo_dai_code&keyword=";
	}

	@RequestMapping("rankcyu/update/{busyo_dai_code}/{busyo_cyu_code}/{busyo_start}")
	private String RankcyuUpdateForm(@PathVariable String busyo_dai_code, @PathVariable String busyo_cyu_code,
			@PathVariable String busyo_start, Model model) throws Exception {

		System.out.println("Dcode :" + busyo_dai_code);
		System.out.println("Ccode :" + busyo_cyu_code);
		System.out.println("start :" + busyo_start);

		rank_cyu rank = RankService.RankcyuDetailService(busyo_dai_code, busyo_cyu_code, busyo_start);

		model.addAttribute("detail", rank);

		return "rank_cyu_update";
	}

	@PostMapping("/rankcyu/updateProc")
	@GetMapping
	private String RankcyuUpdateProc(HttpServletRequest request, Model model) throws Exception {

		rank_cyu rank_cyu = new rank_cyu();

		rank_cyu.setbusyo_dai_code(request.getParameter("busyo_dai_code"));
		rank_cyu.setbusyo_cyu_code(request.getParameter("busyo_cyu_code"));
		rank_cyu.setbusyo_name(request.getParameter("busyo_name"));
		rank_cyu.setbusyo_name_small(request.getParameter("busyo_name_small"));
		rank_cyu.setbusyo_start(request.getParameter("busyo_start"));
		rank_cyu.setbusyo_end(request.getParameter("busyo_end"));

		RankService.RankcyuUpdateService(rank_cyu);

		return "redirect:/rankcyu?pagenum=1&contentnum=10&searchtype=busyo_dai_code&keyword=";
	}

	@RequestMapping("/rankcyu/delete/{busyo_dai_code}/{busyo_cyu_code}/{busyo_start}")
	@GetMapping
	private String RankcyuDelete(@PathVariable String busyo_dai_code, @PathVariable String busyo_cyu_code,
			@PathVariable String busyo_start) throws Exception {
		RankService.RankcyuDeleteService(busyo_dai_code, busyo_cyu_code, busyo_start);

		return "redirect:/rankcyu?pagenum=1&contentnum=10&searchtype=busyo_dai_code&keyword=";
	}

	// 中分類END

	// 大分類
	// 大分類リスト出力
	@RequestMapping("/rankdai")
	@PostMapping
	public String listdaipage(HttpServletRequest request, @RequestParam(required = false) String searchtype,
			@RequestParam(required = false) String keyword) {
		rank_dai rank_dai = new rank_dai();
		String pagenum = request.getParameter("pagenum");
		String contentnum = request.getParameter("contentnum");
		System.out.println("pagenum : " + pagenum);
		System.out.println("contentnum : " + contentnum);
		int cpagenum = Integer.parseInt(pagenum);
		int ccontentnum = Integer.parseInt(contentnum);

		rank_dai.setsearchtype(searchtype);
		rank_dai.setkeyword(keyword);

		rank_dai.settotalcount(mapper.Rankdaicount(rank_dai.getsearchtype(), rank_dai.getkeyword())); // 전체계수
		rank_dai.setpagenum(cpagenum - 1); // 현재 페이지 객체 지정
		rank_dai.setcontentnum(ccontentnum); // 한 페이지 게시글 수
		rank_dai.setcurrentblock(cpagenum); // 현재 페이지블록 번호
		rank_dai.setlastblock(rank_dai.gettotalcount()); // 마지막 블록 전체 게시글 수

		rank_dai.prevnext(cpagenum); // 현재 페이지 화살표
		rank_dai.setstartpage(rank_dai.getcurrentblock()); // 시작페이지 블록 번호
		rank_dai.setendpage(rank_dai.getlastblock(), rank_dai.getcurrentblock()); // 마지막 페이지 블럭 현재 페이지 블록

		List<rank_dai> listdaipage = new ArrayList<rank_dai>();
		listdaipage = mapper.listdaipage(rank_dai.getpagenum() * 10, rank_dai.getcontentnum(), rank_dai.getsearchtype(),
				rank_dai.getkeyword());

		System.out.println("Parameter busyo_dai_code : " + request.getParameter("busyo_dai_code"));
		System.out.println("Parameter busyo_name : " + request.getParameter("busyo_name"));

		request.setAttribute("list", listdaipage);
		request.setAttribute("page", rank_dai);

		return "rank_dai";
	}

	@RequestMapping(value = "/rankdai/detail/{busyo_dai_code}/{busyo_start}", method = RequestMethod.GET)
	private String RankdaiDetail(@PathVariable String busyo_dai_code, @PathVariable String busyo_start,
			@ModelAttribute rank_dai page, Model model) throws Exception {

		model.addAttribute("detail", RankService.RankdaiDetailService(busyo_dai_code, busyo_start));
		return "rank_dai_detail";
	}

	// コードチェック（大）
	@RequestMapping("/rankdai/insert?code={busyo_dai_code}")
	private String RankdaiJH(HttpServletRequest request, Model model) {

		String dbcode = request.getParameter("busyo_dai_code");

		List<rank_dai> listJH = RankService.listJH(dbcode);
		model.addAttribute("listJH", listJH);

		return "rank_dai_insert";
	}

	// 大分類入力
	@RequestMapping("/rankdai/insert")
	private String RankdaiInsertForm(HttpServletRequest request, Model model) {

		return "rank_dai_insert";
	}

	@RequestMapping("/rankdai/insertProc")
	private String RankdaiInsertProc(rank_dai rank_dai, MultipartFile file) throws Exception {

		RankService.RankdaiInsertService(rank_dai);

		return "redirect:/rankdai?pagenum=1&contentnum=10&searchtype=busyo_dai_code&keyword=";
	}

	@RequestMapping("rankdai/update/{busyo_dai_code}/{busyo_start}")
	private String RankdaiUpdateForm(@PathVariable String busyo_dai_code, @PathVariable String busyo_start, Model model)
			throws Exception {

		System.out.println("code :" + busyo_dai_code);
		System.out.println("start :" + busyo_start);

		rank_dai rank = RankService.RankdaiDetailService(busyo_dai_code, busyo_start);

		System.out.println("code :" + rank.busyo_dai_code);
		System.out.println("name :" + rank.busyo_name);
		System.out.println("Sname :" + rank.busyo_name_small);
		System.out.println("start :" + rank.busyo_start);
		System.out.println("end :" + rank.busyo_end);
		System.out.println("date :" + rank.sysdate);

		model.addAttribute("detail", rank);

		return "rank_dai_update";
	}

	@PostMapping("/rankdai/updateProc")
	@GetMapping
	private String RankdaiUpdateProc(HttpServletRequest request) throws Exception {

		rank_dai rank_dai = new rank_dai();

		rank_dai.setbusyo_dai_code(request.getParameter("busyo_dai_code"));
		rank_dai.setbusyo_name(request.getParameter("busyo_name"));
		rank_dai.setbusyo_name_small(request.getParameter("busyo_name_small"));
		rank_dai.setbusyo_start(request.getParameter("busyo_start"));
		rank_dai.setbusyo_end(request.getParameter("busyo_end"));

		RankService.RankdaiUpdateService(rank_dai);
		return "redirect:/rankdai?pagenum=1&contentnum=10&searchtype=busyo_dai_code&keyword=";
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
