package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.example.demo.domain.position;


@Repository("com.example.demo.mapper.PositionMapper")
public interface PositionMapper {	
	    // 사원수
		public int Positioncount(@Param("searchtype") String searchtype,@Param("keyword") String keyword);

		// 사원목록페이징
		public List<position> listpage(@Param("pagenum") int pagenum, @Param("contentnum") int contentnum,
				@Param("searchtype") String searchtype, @Param("keyword") String keyword);

		// 사원상세
		public position PositionDetail(String position_code) throws Exception;

		// 사원작성
		public int PositionInsert(position position_code) throws Exception;

		// 사원수정
		public int PositionUpdate(position position_code) throws Exception;

		// 사원삭제
		public int PositionDelete(String position_code) throws Exception;
}
