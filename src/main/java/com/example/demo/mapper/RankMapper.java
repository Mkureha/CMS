package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.example.demo.domain.rank_cyu;
import com.example.demo.domain.rank_dai;
import com.example.demo.domain.rank_syou;

@Repository("com.example.demo.mapper.RankMapper")
public interface RankMapper {
	// 小分類
	// コード数
	public int Ranksyoucount();

	// リストページング
	public List<rank_syou> listsyoupage(@Param("pagenum") int pagenum, @Param("contentnum") int contentnum);

	// リストDetail
	public rank_syou RanksyouDetail(@Param("busyo_dai_code") String busyo_dai_code,
			@Param("busyo_cyu_code") String busyo_cyu_code, @Param("busyo_syou_code") String busyo_syou_code,
			@Param("busyo_start") String busyo_start) throws Exception;

	// 入力小分類
	public int RanksyouInsert(rank_syou rank_code) throws Exception;

	// 修正小分類
	public int RanksyouUpdate(rank_syou rank_code) throws Exception;

	// 削除小分類
	public int RanksyouDelete(@Param("busyo_dai_code") String busyo_dai_code,
			@Param("busyo_cyu_code") String busyo_cyu_code, @Param("busyo_syou_code") String busyo_syou_code,
			@Param("busyo_start") String busyo_start) throws Exception;

	// 小分類END

	// 中分類
	// 入力中分類
	public int Rankcyucount();

	// リストページング
	public List<rank_cyu> listcyupage(@Param("pagenum") int pagenum, @Param("contentnum") int contentnum);

	// リストDetail
	public rank_cyu RankcyuDetail(@Param("busyo_dai_code") String busyo_dai_code, @Param("busyo_cyu_code") String busyo_cyu_code,
			@Param("busyo_start") String busyo_start) throws Exception;

	// 入力小分類
	public int RankcyuInsert(rank_cyu busyo_cyu_code) throws Exception;

	// 修正小分類
	public int RankcyuUpdate(rank_cyu busyo_cyu_code) throws Exception;

	// 削除小分類
	public int RankcyuDelete(@Param("busyo_dai_code") String busyo_dai_code,  @Param("busyo_cyu_code") String busyo_cyu_code, @Param("busyo_start") String busyo_start)
			throws Exception;

	// 中分類END

	// 大分類
	// 入力大分類
	public int Rankdaicount();

	// リストページング
	public List<rank_dai> listdaipage(@Param("pagenum") int pagenum, @Param("contentnum") int contentnum);

	// リストDetail
	public rank_dai RankdaiDetail(@Param("busyo_dai_code") String busyo_dai_code,
			@Param("busyo_start") String busyo_start) throws Exception;

	// 入力小分類
	public int RankdaiInsert(rank_dai busyo_dai_code) throws Exception;

	// 修正小分類
	public int RankdaiUpdate(rank_dai busyo_dai_code) throws Exception;

	// 削除小分類
	public int RankdaiDelete(@Param("busyo_dai_code") String busyo_dai_code, @Param("busyo_start") String busyo_start)
			throws Exception;

	// 大分類END
}
