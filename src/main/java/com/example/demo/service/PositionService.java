package com.example.demo.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.demo.domain.position;
import com.example.demo.mapper.PositionMapper;

@Service("com.example.demo.service.PositionService")
public class PositionService {
	
	@Resource(name = "com.example.demo.mapper.PositionMapper")
	PositionMapper positionMapper;

	public position positionDetailService(String position_no) throws Exception {
		return positionMapper.PositionDetail(position_no);
	}

	public int positionInsertService(position position) throws Exception {
		return positionMapper.PositionInsert(position);
	}

	public int positionUpdateService(position position) throws Exception {
		return positionMapper.PositionUpdate(position);
	}

	public int positionDeleteService(String position_no) throws Exception {
		return positionMapper.PositionDelete(position_no);
	}

	public List<position> listpage(int pagenum, int contentnum, String searchtype, String keyword) {
		return positionMapper.listpage(pagenum, contentnum, searchtype, keyword);
	}

	public int positioncount(String searchtype, String keyword) {
		return positionMapper.Positioncount(searchtype, keyword);
	}
}
