package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.example.demo.domain.type;


@Repository("com.example.demo.mapper.TypeMapper")
public interface TypeMapper {	
	    // 사원수
		public int Typecount(@Param("searchtype") String searchtype,@Param("keyword") String keyword);

		// 사원목록페이징
		public List<type> listpage(@Param("pagenum") int pagenum, @Param("contentnum") int contentnum,
				@Param("searchtype") String searchtype, @Param("keyword") String keyword);

		// 사원상세
		public type TypeDetail(String type_code) throws Exception;

		// 사원작성
		public int TypeInsert(type type_code) throws Exception;

		// 사원수정
		public int TypeUpdate(type type_code) throws Exception;

		// 사원삭제
		public int TypeDelete(String type_code) throws Exception;
}
