package com.example.demo.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.demo.domain.rank;
import com.example.demo.mapper.RankMapper;

@Service("com.example.demo.service.RankService")
public class RankService {
	
	@Resource(name = "com.example.demo.mapper.RankMapper")
	RankMapper RankMapper;

	public rank RankDetailService(String rank_code, String rank_start) throws Exception {
		return RankMapper.RankDetail(rank_code, rank_start);
	}

	public int RankInsertService(rank rank) throws Exception {
		return RankMapper.RankInsert(rank);
	}

	public int RankUpdateService(rank rank) throws Exception {
		return RankMapper.RankUpdate(rank);
	}

	public int RankDeleteService(String rank_code) throws Exception {
		return RankMapper.RankDelete(rank_code);
	}

	public List<rank> listpage(int pagenum, int contentnum, String searchtype, String keyword) {
		return RankMapper.listpage(pagenum, contentnum, searchtype, keyword);
	}

	public int Rankcount(String searchtype, String keyword) {
		return RankMapper.Rankcount(searchtype, keyword);
	}
}
