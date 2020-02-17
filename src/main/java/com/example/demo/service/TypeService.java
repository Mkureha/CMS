package com.example.demo.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.demo.domain.type;
import com.example.demo.mapper.TypeMapper;

@Service("com.example.demo.service.TypeService")
public class TypeService {
	
	@Resource(name = "com.example.demo.mapper.TypeMapper")
	TypeMapper typeMapper;

	public type typeDetailService(String type_code, String type_start) throws Exception {
		return typeMapper.TypeDetail(type_code, type_start);
	}

	public int typeInsertService(type type) throws Exception {
		return typeMapper.TypeInsert(type);
	}

	public int typeUpdateService(type type) throws Exception {
		return typeMapper.TypeUpdate(type);
	}

	public int typeDeleteService(String type_code, String type_start) throws Exception {
		return typeMapper.TypeDelete(type_code, type_start);
	}

	public List<type> listpage(int pagenum, int contentnum, String searchtype, String keyword) {
		return typeMapper.listpage(pagenum, contentnum, searchtype, keyword);
	}

	public int typecount(String searchtype, String keyword) {
		return typeMapper.Typecount(searchtype, keyword);
	}
}
