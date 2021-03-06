package com.example.demo.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.demo.domain.rank_cyu;
import com.example.demo.domain.rank_dai;
import com.example.demo.domain.rank_syou;
import com.example.demo.mapper.RankMapper;

@Service("com.example.demo.service.RankService")
public class RankService {

	@Resource(name = "com.example.demo.mapper.RankMapper")
	RankMapper RankMapper;

	// 小分類
	public rank_syou RanksyouDetailService(String busyo_dai_code, String busyo_cyu_code, String busyo_syou_code,
			String busyo_start) throws Exception {
		return RankMapper.RanksyouDetail(busyo_dai_code, busyo_cyu_code, busyo_syou_code, busyo_start);
	}

	public int RanksyouInsertService(rank_syou rank) throws Exception {
		return RankMapper.RanksyouInsert(rank);
	}

	public List<rank_cyu> listcyucode(String busyo_dai_code) {
		return RankMapper.listcyucode(busyo_dai_code);
	}

	public int RanksyouUpdateService(rank_syou rank) throws Exception {
		return RankMapper.RanksyouUpdate(rank);
	}

	public int RanksyouDeleteService(String busyo_dai_code, String busyo_cyu_code, String busyo_syou_code,
			String busyo_start) throws Exception {
		return RankMapper.RanksyouDelete(busyo_dai_code, busyo_cyu_code, busyo_syou_code, busyo_start);
	}

	public List<rank_syou> listsyoupage(int pagenum, int contentnum, String searchtype, String keyword) {
		return RankMapper.listsyoupage(pagenum, contentnum, searchtype, keyword);
	}

	public int Ranksyoucount(String searchtype, String keyword) {
		return RankMapper.Ranksyoucount(searchtype, keyword);
	}

	// 小分類END

	// 中分類
	public rank_cyu RankcyuDetailService(String busyo_dai_code, String busyo_cyu_code, String busyo_start)
			throws Exception {
		return RankMapper.RankcyuDetail(busyo_dai_code, busyo_cyu_code, busyo_start);
	}

	public int RankcyuInsertService(rank_cyu rank_cyu) throws Exception {
		return RankMapper.RankcyuInsert(rank_cyu);
	}
	
	public List<rank_dai> listcode() {
		return RankMapper.listcode();
	}

	public List<rank_dai> listJH(String busyo_dai_code) {
		return RankMapper.listJH(busyo_dai_code);
	}
	
	public int RankcyuUpdateService(rank_cyu rank_cyu) throws Exception {
		return RankMapper.RankcyuUpdate(rank_cyu);
	}

	public int RankcyuDeleteService(String busyo_dai_code, String busyo_cyu_code, String busyo_start) throws Exception {
		return RankMapper.RankcyuDelete(busyo_dai_code, busyo_cyu_code, busyo_start);
	}

	public List<rank_cyu> listcyupage(int pagenum, int contentnum, String searchtype, String keyword) {
		return RankMapper.listcyupage(pagenum, contentnum, searchtype, keyword);
	}

	public int Rankcyucount(String searchtype, String keyword) {
		return RankMapper.Rankcyucount(searchtype, keyword);
	}

	// 中分類END

	// 大分類
	public rank_dai RankdaiDetailService(String busyo_dai_code, String busyo_start) throws Exception {
		return RankMapper.RankdaiDetail(busyo_dai_code, busyo_start);
	}

	public int RankdaiInsertService(rank_dai rank_dai) throws Exception {
		return RankMapper.RankdaiInsert(rank_dai);
	}

	public int RankdaiUpdateService(rank_dai rank_dai) throws Exception {
		return RankMapper.RankdaiUpdate(rank_dai);
	}

	public int RankdaiDeleteService(String busyo_dai_code, String busyo_start) throws Exception {
		return RankMapper.RankdaiDelete(busyo_dai_code, busyo_start);
	}

	public List<rank_dai> listdaipage(int pagenum, int contentnum, String searchtype, String keyword) {
		return RankMapper.listdaipage(pagenum, contentnum, searchtype, keyword);
	}

	public int Rankdaicount(String searchtype, String keyword) {
		return RankMapper.Rankdaicount(searchtype, keyword);
	}

	// 大分類END
}
