package com.example.demo.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.demo.domain.employee;
import com.example.demo.mapper.CompanyMapper;

@Service("com.example.demo.service.CompanyService")
public class CompanyService {
	
	@Resource(name = "com.example.demo.mapper.CompanyMapper")
	CompanyMapper companyMapper;

	public employee employeeDetailService(String employee_no) throws Exception {
		return companyMapper.employeeDetail(employee_no);
	}

	public int employeeInsertService(employee employee) throws Exception {
		return companyMapper.employeeInsert(employee);
	}

	public int employeeUpdateService(employee employee) throws Exception {
		return companyMapper.employeeUpdate(employee);
	}

	public int employeeDeleteService(String employee_no) throws Exception {
		return companyMapper.employeeDelete(employee_no);
	}

	public List<employee> listpage(int pagenum, int contentnum, String searchtype, String keyword) {
		return companyMapper.listpage(pagenum, contentnum, searchtype, keyword);
	}

	public int employeecount(String searchtype, String keyword) {
		return companyMapper.employeecount(searchtype, keyword);
	}
}
