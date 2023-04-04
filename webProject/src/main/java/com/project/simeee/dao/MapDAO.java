package com.project.simeee.dao;

import java.util.List;

import com.project.simeee.dto.MapDTO;

public interface MapDAO {
	
	//맵에 모든 point 출력
	public List<MapDTO> mapAllselect();
}
