package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.example.demo.domain.employee;
import com.example.demo.domain.position;
import com.example.demo.domain.rank_cyu;
import com.example.demo.domain.rank_dai;
import com.example.demo.domain.rank_syou;
import com.example.demo.domain.type;

@Repository("com.example.demo.mapper.CompanyMapper")
public interface CompanyMapper {

	// Scode
	public List<rank_syou> listsyoucode(@Param("busyo_dai_code") String busyo_dai_code,
			@Param("busyo_cyu_code") String busyo_cyu_code);

	// Ccode
	public List<rank_cyu> listcyucode(@Param("busyo_dai_code") String busyo_dai_code);

	// Dcode
	public List<rank_dai> listcode();

	// PScode
	public List<position> listposition();

	// TPcode
	public List<type> listtype();

	// 사원수
	public int employeecount(@Param("searchtype") String searchtype, @Param("keyword") String keyword);

	// 사원목록페이징
	public List<employee> listpage(@Param("pagenum") int pagenum, @Param("contentnum") int contentnum,
			@Param("searchtype") String searchtype, @Param("keyword") String keyword);

	// 사원상세
	public employee employeeDetail(@Param("employee_no") String employee_no, @Param("busyo_dai_code") String busyo_dai_code,
			@Param("busyo_cyu_code") String busyo_cyu_code) throws Exception;

	// 사원작성
	public int employeeInsert(employee employee_no) throws Exception;

	// 사원수정
	public int employeeUpdate(employee employee_no) throws Exception;

	// 사원삭제
	public int employeeDelete(@Param("busyo_dai_code") String busyo_dai_code,
			@Param("busyo_cyu_code") String busyo_cyu_code, @Param("employee_no") String employee_no) throws Exception;
}
