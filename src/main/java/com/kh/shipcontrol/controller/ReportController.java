package com.kh.shipcontrol.controller;

import java.sql.Time;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.shipcontrol.service.ReportService;
import com.kh.shipcontrol.vo.AcdVo;

@Controller
public class ReportController {
	
	@Inject
	ReportService reportService;

	@RequestMapping(value = "/reportPage")
	public String reportPage() throws Exception {

		return "/reportpage/reportPage";
	}

	@RequestMapping(value = "/reportContent", method = RequestMethod.GET)
	public String reportContent() throws Exception {

		return "/reportpage/reportContent";
	}

	@RequestMapping(value = "/manuallyRegistReport")
	public String manuallyRegistReport() throws Exception {

		return "/reportpage/manuallyRegistReport";
	}

	@RequestMapping(value = "/registReportRun", method = RequestMethod.POST)
	public String registReportRun(AcdVo acdVo, String acd_day, String acd_hour) throws Exception {
		//위도, 경도에 대한 처리 필요
		String format = acd_day + " " + acd_hour + ":00";
		System.out.println(format);
		Timestamp timestamp = Timestamp.valueOf(format);
		acdVo.setAcd_date(timestamp);
		System.out.println("@ReportController acdVo : " + acdVo);
		
		reportService.registReport(acdVo);

		return "redirect:/";
	}
	
	@RequestMapping(value="/getAcdCode", method=RequestMethod.GET)
	@ResponseBody
	public String getAcdCode() throws Exception{
		
		
		
		
		return "data";
	}

}
