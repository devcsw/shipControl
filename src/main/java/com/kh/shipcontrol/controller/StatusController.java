	package com.kh.shipcontrol.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kh.shipcontrol.service.StatusService;
import com.kh.shipcontrol.vo.StatusVo;

/**
 * Handles requests for the application home page.
 */

@RestController
@RequestMapping(value = "/status")
public class StatusController {
	@Inject
	StatusService statusService;
	
	@RequestMapping(value="/insertStatus", method=RequestMethod.POST)
	public String insertStatus(@RequestBody StatusVo statusVo) throws Exception {
		System.out.println("실행됨");
		
		statusService.insertStautus(statusVo);
		return "success";
	}
	
	
	
}
