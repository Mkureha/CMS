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

import com.example.demo.domain.employee;
import com.example.demo.domain.position;
import com.example.demo.domain.rank_cyu;
import com.example.demo.domain.rank_dai;
import com.example.demo.domain.rank_syou;
import com.example.demo.domain.type;
import com.example.demo.mapper.CompanyMapper;
import com.example.demo.service.CompanyService;

@Controller
public class CompanyController {

	@Resource(name = "com.example.demo.mapper.CompanyMapper")
	CompanyMapper mapper;

	@Resource(name = "com.example.demo.service.CompanyService")
	CompanyService employeeService;

	@GetMapping("/index")
	public String home(Model model) {
		model.addAttribute("WEB-INF", "views/index");
		return "index";
	}

	@RequestMapping("/employee")
	@PostMapping
	public String list(HttpServletRequest request, @RequestParam(required = false) String searchtype,
			@RequestParam(required = false) String keyword) {
		employee employee = new employee();
		String pagenum = request.getParameter("pagenum");
		String contentnum = request.getParameter("contentnum");
		System.out.println("pagenum : " + pagenum);
		System.out.println("contentnum : " + contentnum);
		System.out.println("searchtype : " + searchtype);
		int cpagenum = Integer.parseInt(pagenum);
		int ccontentnum = Integer.parseInt(contentnum);

		employee.setsearchtype(searchtype);
		employee.setkeyword(keyword);

		employee.settotalcount(mapper.employeecount(employee.getsearchtype(), employee.getkeyword())); // 전체계수
		employee.setpagenum(cpagenum - 1); // 현재 페이지 객체 지정
		employee.setcontentnum(ccontentnum); // 한 페이지 게시글 수
		employee.setcurrentblock(cpagenum); // 현재 페이지블록 번호
		employee.setlastblock(employee.gettotalcount()); // 마지막 블록 전체 게시글 수

		employee.prevnext(cpagenum); // 현재 페이지 화살표
		employee.setstartpage(employee.getcurrentblock()); // 시작페이지 블록 번호
		employee.setendpage(employee.getlastblock(), employee.getcurrentblock()); // 마지막 페이지 블럭 현재 페이지 블록

		List<employee> listpage = new ArrayList<employee>();
		listpage = mapper.listpage(employee.getpagenum() * 10, employee.getcontentnum(), employee.getsearchtype(),
				employee.getkeyword());

		System.out.println("Parameter keyword : " + request.getParameter("keyword"));
		System.out.println("Board keyword : " + employee.getkeyword());

		request.setAttribute("list", listpage);
		request.setAttribute("page", employee);

		return "employee";
	}

	@RequestMapping(value = "/employee/detail/{busyo_dai_code}/{busyo_cyu_code}/{employee_no}", method = RequestMethod.GET)
	private String employeeDetail(@PathVariable String busyo_dai_code, @PathVariable String busyo_cyu_code,
			@PathVariable String employee_no, @ModelAttribute employee page, Model model) throws Exception {

		model.addAttribute("detail",
				employeeService.employeeDetailService(employee_no, busyo_dai_code, busyo_cyu_code));
		return "employee_detail";
	}

	// 大分類入力
	@RequestMapping("/employee/insert")
	private String employeeInsertForm(Model model) {

		return employeeInsertForm("", model);
	}

	// 大分類
	@RequestMapping("/employee/insert/{busyo_dai_code}")
	private String employeeInsertForm(@PathVariable String busyo_dai_code, Model model) {

		List<rank_dai> listcode = employeeService.listcode();
		model.addAttribute("listcode", listcode);

		if (busyo_dai_code.length() > 0) {
			List<rank_cyu> listcyucode = employeeService.listcyucode(busyo_dai_code);
			model.addAttribute("listcyucode", listcyucode);
			return "employee_rankcyu_insert";
		} else {
			model.addAttribute("listcyucode", new ArrayList<rank_cyu>());
			return "employee_rankdai_insert";
		}
	}

	// 中分類
	@RequestMapping("/employee/insert/{busyo_dai_code}/{busyo_cyu_code}")
	private String employeeInsertForm(@PathVariable String busyo_dai_code, @PathVariable String busyo_cyu_code,
			Model model) {

		List<rank_dai> listcode = employeeService.listcode();
		model.addAttribute("listcode", listcode);

		List<rank_cyu> listcyucode = employeeService.listcyucode(busyo_dai_code);
		model.addAttribute("listcyucode", listcyucode);

		if (busyo_dai_code.length() > 0 && busyo_cyu_code.length() > 0) {
			List<rank_syou> listsyoucode = employeeService.listsyoucode(busyo_dai_code, busyo_cyu_code);
			model.addAttribute("listsyoucode", listsyoucode);
			return "employee_ranksyou_insert";
		} else {
			model.addAttribute("listsyoucode", new ArrayList<rank_syou>());
			return "employee_rankcyu_insert";
		}
	}

	// 小分類
	@RequestMapping("/employee/insert/{busyo_dai_code}/{busyo_cyu_code}/{busyo_syou_code}")
	private String employeeInsertForm(@PathVariable String busyo_syou_code, @PathVariable String busyo_dai_code,
			@PathVariable String busyo_cyu_code, Model model) {

		System.out.println("Dcode : " + busyo_dai_code);
		System.out.println("Ccode : " + busyo_cyu_code);

		List<position> listposition = employeeService.listposition();
		model.addAttribute("listposition", listposition);

		List<type> listtype = employeeService.listtype();
		model.addAttribute("listtype", listtype);

		List<rank_dai> listcode = employeeService.listcode();
		model.addAttribute("listcode", listcode);

		List<rank_cyu> listcyucode = employeeService.listcyucode(busyo_dai_code);
		model.addAttribute("listcyucode", listcyucode);
		
		if (busyo_dai_code.length() > 0 && busyo_cyu_code.length() > 0 && busyo_syou_code.length() > 0) {
			List<rank_syou> listsyoucode = employeeService.listsyoucode(busyo_dai_code, busyo_cyu_code);
			model.addAttribute("listsyoucode", listsyoucode);
			return "employee_insert";
		} else {
			model.addAttribute("listcyucode", new ArrayList<rank_cyu>());
			return "employee_ranksyou_insert";
		}
	}

	@RequestMapping("/employee/insertProc")
	private String employeeInsertProc(employee employee, MultipartFile file) throws Exception {

		employeeService.employeeInsertService(employee);

		return "redirect:/employee?pagenum=1&contentnum=10&searchtype=employee_no&keyword=";
	}

	@RequestMapping("employee/update/{busyo_dai_code}/{busyo_cyu_code}/{employee_no}") // 게시글수정폼호출
	private String employeeUpdateForm(@PathVariable String busyo_dai_code, @PathVariable String busyo_cyu_code,
			@PathVariable String employee_no, Model model) throws Exception {

		System.out.println("Dcode :" + busyo_dai_code);
		System.out.println("Ccode :" + busyo_cyu_code);
		System.out.println("Eno :" + employee_no);

		employee employee = employeeService.employeeDetailService(employee_no, busyo_dai_code, busyo_cyu_code);

		System.out.println("Ename :" + employee.getemployee_name());
		System.out.println("Eno :" + employee.getemployee_no());
		System.out.println("gender :" + employee.getgender());
		System.out.println("birth :" + employee.getbirthday());
		System.out.println("postal :" + employee.getpostal_code());
		System.out.println("add1 :" + employee.getaddress_1());
		System.out.println("add2 :" + employee.getaddress_2());
		System.out.println("memo :" + employee.getemployee_memo());
		
		//職責リスト
		List<position> listposition = employeeService.listposition();
		model.addAttribute("listposition", listposition);

		//役職リスト
		List<type> listtype = employeeService.listtype();
		model.addAttribute("listtype", listtype);

		//大分類リスト
		List<rank_dai> listcode = employeeService.listcode();
		model.addAttribute("listcode", listcode);

		//中分類リスト
		List<rank_cyu> listcyucode = employeeService.listcyucode(busyo_dai_code);
		model.addAttribute("listcyucode", listcyucode);

		//小分類リスト
		List<rank_syou> listsyoucode = employeeService.listsyoucode(busyo_dai_code, busyo_cyu_code);
		model.addAttribute("listsyoucode", listsyoucode);

		model.addAttribute("detail", employee);

		return "employee_update";
	}

	@PostMapping("/employee/updateProc")
	@GetMapping
	private String employeeUpdateProc(HttpServletRequest request, Model model) throws Exception {

		employee employee = new employee();

		employee.setbusyo_dai_code(request.getParameter("busyo_dai_code"));
		employee.setbusyo_cyu_code(request.getParameter("busyo_cyu_code"));
		employee.setbusyo_syou_code(request.getParameter("busyo_syou_code"));
		employee.setemployee_no(request.getParameter("employee_no"));
		employee.setposition_code(request.getParameter("position_code"));
		employee.setemployee_name(request.getParameter("employee_name"));
		employee.settype_code(request.getParameter("type_code"));
		employee.setgender(request.getParameter("gender"));
		employee.setbirthday(request.getParameter("birthday"));
		employee.setpostal_code(request.getParameter("postal_code"));
		employee.setaddress_1(request.getParameter("address_1"));
		employee.setaddress_2(request.getParameter("address_2"));
		employee.setemployee_memo(request.getParameter("employee_memo"));

		employeeService.employeeUpdateService(employee);

		return "redirect:/employee?pagenum=1&contentnum=10&searchtype=employee_no&keyword=";
	}

	@RequestMapping("employee/delete/{busyo_dai_code}/{busyo_cyu_code}/{employee_no}")
	@GetMapping
	private String employeeDelete(@PathVariable String busyo_dai_code, @PathVariable String busyo_cyu_code,
			@PathVariable String employee_no) throws Exception {
		employeeService.employeeDeleteService(busyo_dai_code, busyo_cyu_code, employee_no);

		return "redirect:/employee?pagenum=1&contentnum=10&searchtype=employee_no&keyword=";
	}
}
