package com.example.demo.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.demo.domain.rank_syou;
import com.example.demo.mapper.RankMapper;

@Service("com.example.demo.service.RankService")
public class RankService {

	@Resource(name = "com.example.demo.mapper.RankMapper")
	RankMapper RankMapper;

	public rank_syou RankDetailService(String rank_code, String busyo_start) throws Exception {
		return RankMapper.RankDetail(rank_code, busyo_start);
	}

	public int RankInsertService(rank_syou rank) throws Exception {
		return RankMapper.RankInsert(rank);
	}

	public int RankUpdateService(rank_syou rank) throws Exception {
		return RankMapper.RankUpdate(rank);
	}

	public int RankDeleteService(String rank_code, String busyo_start) throws Exception {
		return RankMapper.RankDelete(rank_code, busyo_start);
	}

	public List<rank_syou> listpage(int pagenum, int contentnum, String searchtype, String keyword) {
		return RankMapper.listpage(pagenum, contentnum, searchtype, keyword);
	}

	public int Rankcount(String searchtype, String keyword) {
		return RankMapper.Rankcount(searchtype, keyword);
	}
}
