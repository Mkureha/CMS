package com.example.demo.controller.copy;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
import com.example.demo.mapper.CompanyMapper;
import com.example.demo.service.CompanyService;

public class CompanyController {

	@Resource(name = "com.example.demo.mapper.CompanyMapper")
	CompanyMapper mapper;
	
	@Resource(name = "com.example.demo.service.CompanyService")
	CompanyService employeeService;

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

		return "employeelist";
	}

	@RequestMapping(value = "/employee/detail/{employee_no}", method=RequestMethod.GET)
	private String tosyoDetail(@PathVariable String employee_no, @ModelAttribute employee page, Model model)
			throws Exception {

		model.addAttribute("detail", employeeService.employeeDetailService(employee_no));
		return "detail";
	}

	@RequestMapping("/employee/insert") // 도서등록폼호출
	private String tosyoInsertForm() {
		return "insert";
	}

	@RequestMapping("/insertProc")
	private String tosyoInsertProc(employee employee, MultipartFile file) throws Exception {
		
		employeeService.employeeInsertService(employee);

		return "redirect:/employee?pagenum=1&contentnum=10&searchtype=tosyo_num&keyword=";
	}

	@RequestMapping("employee/update/{employee_no}") // 게시글수정폼호출
	private String employeeUpdateForm(@PathVariable String employee_no, Model model) throws Exception {

		model.addAttribute("detail", employeeService.employeeDetailService(employee_no));

		return "update";
	}

	@PostMapping("/updateProc")
	@GetMapping
	private String tosyoUpdateProc(HttpServletRequest request) throws Exception {

		employee employee = new employee();

		employee.setemployee_no(request.getParameter("employee_no"));
		employee.setemployee_name(request.getParameter("employee_name"));
		employee.setgender(request.getParameter("gender"));
		employee.setbirthday(request.getParameter("birthday"));
		employee.setpostal_code(request.getParameter("postal_code"));
		employee.setaddress_1(request.getParameter("address_1"));
		employee.setaddress_2(request.getParameter("address_2"));
		employee.setemployee_memo(request.getParameter("employee_memo"));

		employeeService.employeeUpdateService(employee);
		return "redirect:employee/detail/" + request.getParameter("employee_no");
	}

	@RequestMapping("employee/delete/{employee_no}")
	@GetMapping
	private String employeeDelete(@PathVariable String employee_no) throws Exception {
		employeeService.employeeDeleteService(employee_no);

		return "redirect:employee?pagenum=1&contentnum=10&searchtype=tosyo_num&keyword=";
	}
}
