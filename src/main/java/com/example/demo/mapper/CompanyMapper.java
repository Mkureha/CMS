package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.example.demo.domain.employee;


@Repository("com.example.demo.mapper.CompanyMapper")
public interface CompanyMapper {	
	    // 사원수
		public int employeecount(@Param("searchtype") String searchtype,@Param("keyword") String keyword);

		// 사원목록페이징
		public List<employee> listpage(@Param("pagenum") int pagenum, @Param("contentnum") int contentnum,
				@Param("searchtype") String searchtype, @Param("keyword") String keyword);

		// 사원상세
		public employee employeeDetail(String employee_no) throws Exception;

		// 사원작성
		public int employeeInsert(employee employee_no) throws Exception;

		// 사원수정
		public int employeeUpdate(employee employee_no) throws Exception;

		// 사원삭제
		public int employeeDelete(String employee_no) throws Exception;
}
