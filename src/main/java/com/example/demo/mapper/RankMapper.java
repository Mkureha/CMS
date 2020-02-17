package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.example.demo.domain.rank_syou;

@Repository("com.example.demo.mapper.RankMapper")
public interface RankMapper {
	// 사원수
	public int Rankcount(@Param("searchtype") String searchtype, @Param("keyword") String keyword);

	// 사원목록페이징
	public List<rank_syou> listpage(@Param("pagenum") int pagenum, @Param("contentnum") int contentnum,
			@Param("searchtype") String searchtype, @Param("keyword") String keyword);

	// 사원상세
	public rank_syou RankDetail(@Param("rank_code") String rank_code, @Param("busyo_start") String busyo_start)
			throws Exception;

	// 사원작성
	public int RankInsert(rank_syou rank_code) throws Exception;

	// 사원수정
	public int RankUpdate(rank_syou rank_code) throws Exception;

	// 사원삭제
	public int RankDelete(@Param("rank_code") String rank_code, @Param("busyo_start") String busyo_start)
			throws Exception;
}
