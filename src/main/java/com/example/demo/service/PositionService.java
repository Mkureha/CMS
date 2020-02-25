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

	public position PositionDetailService(String position_code, String position_start) throws Exception {
		return positionMapper.PositionDetail(position_code, position_start);
	}

	public int PositionInsertService(position position) throws Exception {
		return positionMapper.PositionInsert(position);
	}

	public int PositionUpdateService(position position) throws Exception {
		return positionMapper.PositionUpdate(position);
	}

	public int PositionDeleteService(String position_code, String position_start) throws Exception {
		return positionMapper.PositionDelete(position_code, position_start);
	}

	public List<position> positionpage(int pagenum, int contentnum, String searchtype, String keyword) {
		return positionMapper.positionpage(pagenum, contentnum, searchtype, keyword);
	}

	public int Positioncount(String searchtype, String keyword) {
		return positionMapper.Positioncount(searchtype, keyword);
	}
}
