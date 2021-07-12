package com.kh.shipcontrol.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReportController {

	@RequestMapping(value = "/reportPage")
	public String reportPage() throws Exception {

		return "/reportpage/reportPage";
	}

	@RequestMapping(value = "/reportContent", method=RequestMethod.GET)
	public String reportContent() throws Exception {

		return "/reportpage/reportContent";
	}
	
	@RequestMapping(value="/manuallyRegistReport")
	public String manuallyRegistReport() throws Exception{
		
		return"/reportpage/manuallyRegistReport";
	}

}
