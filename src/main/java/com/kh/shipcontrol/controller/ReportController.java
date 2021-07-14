package com.kh.shipcontrol.controller;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.shipcontrol.service.ReportService;
import com.kh.shipcontrol.vo.AcdCodeVo;
import com.kh.shipcontrol.vo.AcdHndVo;
import com.kh.shipcontrol.vo.AcdVo;

@Controller
public class ReportController {

	@Inject
	ReportService reportService;

	@RequestMapping(value = "/reportPage")
	public String reportPage(Model model) throws Exception {

		List<AcdVo> list = reportService.getWholeAcd();
		model.addAttribute("list", list);

		return "/reportpage/reportPage";
	}

	@RequestMapping(value = "/reportContent", method = RequestMethod.GET)
	public String reportContent(@RequestParam("acd_id") String acd_id, Model model) throws Exception {
//		System.out.println("@ReportController acd_id :" + acd_id);
		AcdVo acdVo = reportService.getAcdById(Integer.parseInt(acd_id));
		List<AcdHndVo> acdHndList = reportService.getAcdHnd(acd_id);
		model.addAttribute("acdVo", acdVo);
		model.addAttribute("acdHndList", acdHndList);

		return "/reportpage/reportContent";
	}

	@RequestMapping(value = "/manuallyRegistReport")
	public String manuallyRegistReport() throws Exception {

		return "/reportpage/manuallyRegistReport";
	}

	@RequestMapping(value = "/registReportRun", method = RequestMethod.POST)
	public String registReportRun(AcdVo acdVo, String acd_day, String acd_hour) throws Exception {
		// 위도, 경도에 대한 처리 필요
		String format = acd_day + " " + acd_hour + ":00";
		System.out.println(format);
		Timestamp timestamp = Timestamp.valueOf(format);
		acdVo.setAcd_date(timestamp);
		System.out.println("@ReportController acdVo : " + acdVo);

		reportService.registReport(acdVo);

		return "redirect:/";
	}

	@RequestMapping(value = "/getAcdCode", method = RequestMethod.GET)
	@ResponseBody
	public List<AcdCodeVo> getAcdCode(Model model) throws Exception {

		List<AcdCodeVo> list = reportService.getAcdCode();
//		System.out.println("@ReportController list : " + list);

		return list;
	}

	@RequestMapping(value = "/addAcdHnd", method = RequestMethod.POST)
	@ResponseBody
	public String addAcdHnd(AcdHndVo acdHndVo) throws Exception {
//		System.out.println("@ReportController acdHndVo :" + acdHndVo);
		reportService.addAcdHnd(acdHndVo);
		return "success";
	}

	@RequestMapping(value = "/getAcdHnd", method = RequestMethod.GET)
	@ResponseBody
	public List<AcdHndVo> getAcdHnd(String acd_id) throws Exception {
		System.out.println("@ReportController acd_id :" + acd_id);
		List<AcdHndVo> list = reportService.getAcdHnd(acd_id);
		System.out.println("@ReportController list :" + list);
		return list;
	}

}
