package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.example.demo.domain.position;

@Repository("com.example.demo.mapper.PositionMapper")
public interface PositionMapper {
	// 사원수
	public int Positioncount(@Param("searchtype") String searchtype, @Param("keyword") String keyword);

	// 사원목록페이징
	public List<position> positionpage(@Param("pagenum") int pagenum, @Param("contentnum") int contentnum,
			@Param("searchtype") String searchtype, @Param("keyword") String keyword);

	// 사원상세
	public position PositionDetail(@Param("position_code") String position_code,
			@Param("position_start") String position_start) throws Exception;

	// 사원작성
	public int PositionInsert(position position) throws Exception;

	// 사원수정
	public int PositionUpdate(position position) throws Exception;

	// 사원삭제
	public int PositionDelete(@Param("position_code") String position_code,
			@Param("position_start") String position_start) throws Exception;
}
