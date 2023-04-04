package com.project.simeee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.project.simeee.dao.MapDAO;
import com.project.simeee.dto.MapDTO;

public class MapServiceImpl implements MapService {

	@Autowired
	MapDAO dao;
	
	@Override
	public List<MapDTO> mapAllSelect() {
		
		return dao.mapAllselect();
	}

}
