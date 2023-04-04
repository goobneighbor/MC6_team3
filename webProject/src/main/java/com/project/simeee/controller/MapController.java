package com.project.simeee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.project.simeee.dto.MapDTO;
import com.project.simeee.service.MapService;

@RestController
@RequestMapping("/map")
public class MapController {
	@Autowired
	MapService service;
	
	@GetMapping("/mapshow")
	public ModelAndView mapshow() {
		ModelAndView mav = new ModelAndView();
		
		List<MapDTO> list = service.mapAllSelect();
		
		mav.setViewName("map/googlemap");
		return mav;
	}
	
}
