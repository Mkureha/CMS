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
	public rank_syou RankDetailService(String busyo_dai_code, String busyo_cyu_code, String busyo_syou_code,
			String busyo_start) throws Exception {
		return RankMapper.RankDetail(busyo_dai_code, busyo_cyu_code, busyo_syou_code, busyo_start);
	}

	public int RankInsertService(rank_syou rank) throws Exception {
		return RankMapper.RankInsert(rank);
	}

	public int RankUpdateService(rank_syou rank) throws Exception {
		return RankMapper.RankUpdate(rank);
	}

	public int RankDeleteService(String busyo_dai_code, String busyo_cyu_code, String busyo_syou_code,
			String busyo_start) throws Exception {
		return RankMapper.RankDelete(busyo_dai_code, busyo_cyu_code, busyo_syou_code, busyo_start);
	}

	public List<rank_syou> listpage(int pagenum, int contentnum, String searchtype, String keyword) {
		return RankMapper.listpage(pagenum, contentnum, searchtype, keyword);
	}

	public int Rankcount(String searchtype, String keyword) {
		return RankMapper.Rankcount(searchtype, keyword);
	}

	// 小分類END

	// 中分類
	public int RankInsertcyuService(rank_cyu rank) throws Exception {
		return RankMapper.RankInsertcyu(rank);
	}

	// 中分類END

	// 大分類
	public rank_dai RankdaiDetailService(String busyo_dai_code, String busyo_start) throws Exception {
		return RankMapper.RankdaiDetail(busyo_dai_code, busyo_start);
	}

	public int RankdaiInsertService(rank_dai rank) throws Exception {
		return RankMapper.RankdaiInsert(rank);
	}

	public int RankdaiUpdateService(rank_dai rank) throws Exception {
		return RankMapper.RankdaiUpdate(rank);
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
