package com.kh.shipcontrol.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReportController {

	
	@RequestMapping(value="/reportPage")
	public String reportPage() throws Exception {
		
		return "/reportpage/reportPage";
	} 
	
}
