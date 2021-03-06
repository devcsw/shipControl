package com.kh.shipcontrol.controller;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.shipcontrol.service.ReportService;
import com.kh.shipcontrol.service.ShipService;
import com.kh.shipcontrol.vo.AcdCodeVo;
import com.kh.shipcontrol.vo.AcdHndVo;
import com.kh.shipcontrol.vo.AcdVo;
import com.kh.shipcontrol.vo.PaginationDTO;
import com.kh.shipcontrol.vo.ShipStatusVo;
import com.kh.shipcontrol.vo.ShipVo;

@Controller
public class ReportController {

	@Inject
	ReportService reportService;

	@Inject
	ShipService shipService;

	@RequestMapping(value = "/reportPage", method = RequestMethod.GET)
	public String reportPage(Model model, String currentPage) throws Exception {

		if (currentPage == null) {
			currentPage = "1";
		}

		int count = reportService.getReportCount();
		int wholePage = (count / 10) + 1;
		PaginationDTO dto = new PaginationDTO(Integer.parseInt(currentPage), wholePage);

//		System.out.println("@ReportController dto:" + dto);
//		System.out.println("@ReportController currentPage:" + currentPage);

		List<AcdVo> list = reportService.getWholeAcd(dto);

		model.addAttribute("list", list);
		model.addAttribute("dto", dto);

		return "/reportpage/reportPage";
	}

	@RequestMapping(value = "/reportContent", method = RequestMethod.GET)
	public String reportContent(@RequestParam("acd_id") String acd_id,
			@RequestParam("acd_hnd_page") String acd_hnd_page, Model model) throws Exception {
//		System.out.println("@ReportController acd_id :" + acd_id);
		AcdVo acdVo = reportService.getAcdById(Integer.parseInt(acd_id));
		List<AcdHndVo> acdHndList = reportService.getAcdHnd(acd_id);
//		System.out.println("@ReportController acdHndLIst: " + acdHndList);
		model.addAttribute("acd_hnd_page", acd_hnd_page);
//		System.out.println("@ReportController acd_hnd_page: " + acd_hnd_page);
		model.addAttribute("acdVo", acdVo);
		model.addAttribute("acdHndList", acdHndList);

		Timestamp date = acdHndList.get(Integer.parseInt(acd_hnd_page) - 1).getAcd_hnd_date();
		System.out.println(date);
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.SECOND, 600);
		Timestamp addedDate = new Timestamp(cal.getTime().getTime());
		System.out.println(addedDate);
		String firstDate = date.toString();
		String lastDate = addedDate.toString();
		String subbedFirstDate = firstDate.substring(0, firstDate.length() - 2);
		String subbedLastDate = lastDate.substring(0, lastDate.length() - 2);
		System.out.println(subbedFirstDate);
		System.out.println(subbedLastDate);
		Map<String, String> mapDate = new HashMap<>();
		mapDate.put("subbedFirstDate", subbedFirstDate);
		mapDate.put("subbedLastDate", subbedLastDate);
		
		List<ShipStatusVo> list = reportService.getShipLatLng(mapDate);
		System.out.println(list);
		model.addAttribute("list",list);

		return "/reportpage/reportContent";
	}

	@RequestMapping(value = "/manuallyRegistReport", method = RequestMethod.GET)
	public String manuallyRegistReport(@RequestParam(value = "sh_id", required = false, defaultValue = "0") int sh_id,
			@RequestParam(value = "sh_status_latitude", required = false, defaultValue = "35.7522119867634") String sh_status_latitude,
			@RequestParam(value = "sh_status_longitude", required = false, defaultValue = "129.7760734657909") String sh_status_longitude,
			Model model) throws Exception {

		System.out.println(sh_id);
		System.out.println(sh_status_latitude);
		System.out.println(sh_status_longitude);

		ShipStatusVo shipStatusVo = new ShipStatusVo();
		shipStatusVo.setSh_id(sh_id);
		shipStatusVo.setSh_status_latitude(sh_status_latitude);
		shipStatusVo.setSh_status_longitude(sh_status_longitude);
		model.addAttribute("shipStatusVo", shipStatusVo);

		return "/reportpage/manuallyRegistReport";
	}

	@RequestMapping(value = "/registReportRun", method = RequestMethod.POST)
	public String registReportRun(AcdVo acdVo, String acd_day, String acd_hour) throws Exception {
		// ??????, ????????? ?????? ?????? ??????
		
		if (acd_hour.length() < 6) {
			acd_hour = acd_hour + ":00";
		}
//		System.out.println(acd_hour);
		String format = acd_day + " " + acd_hour;
		
//		System.out.println(format);
		Timestamp timestamp = Timestamp.valueOf(format);
//		System.out.println(timestamp);
		acdVo.setAcd_date(timestamp);
//		System.out.println("format: " + format);
//		System.out.println("timestamp: " + timestamp);
//		System.out.println("@ReportController acdVo : " + acdVo);

		reportService.registReport(acdVo);
		int acd_id = reportService.getAcdIdSeq();
		AcdHndVo acdHndVo = new AcdHndVo();
		acdHndVo.setAcd_id(acd_id - 1);
		acdHndVo.setAcd_hnd_content("??????????????????");
		acdHndVo.setAcd_hnd_take("????????????");
		reportService.addAcdHnd(acdHndVo);

		return "redirect:/reportPage";
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
//		System.out.println("@ReportController acd_id :" + acd_id);
		List<AcdHndVo> list = reportService.getAcdHnd(acd_id);
//		System.out.println("@ReportController list :" + list);
		return list;
	}

	@RequestMapping(value = "/getAcdListBySerachType", method = RequestMethod.GET)
	public String getAcdListBySerachType(String searchType, String searchWord, Model model, String currentPage)
			throws Exception {
//		System.out.println("@ReportController searchType :" + searchType);
//		System.out.println("@ReportController searchWord :" + searchWord); 
		// ????????????
		Map<String, Object> map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("searchWord", searchWord);

		int count = reportService.getAcdCountBySearchType(map);
		int wholePage = (count / 10) + 1;

		if (currentPage == null) {
			currentPage = "1";
		}

		PaginationDTO dto = new PaginationDTO(Integer.parseInt(currentPage), wholePage);

		List<AcdVo> list = reportService.getAcdListBySerachType(map);
		model.addAttribute("list", list);
		model.addAttribute("map", map);
		model.addAttribute("dto", dto);

		return "/reportpage/reportPage";
	}

	@RequestMapping(value = "/getShipInfo", method = RequestMethod.GET)
	@ResponseBody
	public ShipVo getShipInfo(String sh_id) throws Exception {

		ShipVo shipVo = shipService.getShipInfoById(Integer.parseInt(sh_id));

		return shipVo;
	}

	@RequestMapping(value = "/getShipCodeAndName", method = RequestMethod.GET)
	@ResponseBody
	public List<ShipVo> getShipCodeAndName() throws Exception {

		List<ShipVo> list = shipService.getShipList();
//		System.out.println("@ReportController shipVoList :" + list);
		return list;
	}

	@RequestMapping(value = "/reportUpdatePage", method = RequestMethod.GET)
	public String reportUpdatePage(Model model, String acd_id) throws Exception {
		AcdVo acdVo = reportService.getAcdById(Integer.parseInt(acd_id));
		model.addAttribute("acdVo", acdVo);
//		System.out.println("@reportController acdVo : " + acdVo);

		return "/reportpage/reportUpdatePage";
	}

	@RequestMapping(value = "/updateReportRun", method = RequestMethod.POST)
	public String updateReportRun(AcdVo acdVo) throws Exception {
//		System.out.println("@reportController acdVo : " + acdVo);

		reportService.updateReportRun(acdVo);
		return "redirect:/reportUpdatePage?acd_id=" + acdVo.getAcd_id();
	}

	@RequestMapping(value = "/getAcdVoById", method = RequestMethod.GET)
	@ResponseBody
	public AcdHndVo getAcdVoById(String acd_hnd_id) throws Exception {
//		System.out.println("@reportController acd_hnd_id :" + acd_hnd_id);
		AcdHndVo acdHndVo = reportService.getAcdVoById(acd_hnd_id);
//		System.out.println("@reportController acdHndVo :" + acdHndVo);
		return acdHndVo;
	}

	@RequestMapping(value = "/updateAcdHndById", method = RequestMethod.POST)
	public String updateAcdHndById(AcdHndVo acdHndVo, String acd_id) throws Exception {
		reportService.updateAcdHndById(acdHndVo);

		return "redirect:/reportContent?acd_id=" + acd_id + "&acd_hnd_page=1";
	}

	@RequestMapping(value = "/deleteReport", method = RequestMethod.GET)
	public String deleteReport(String acd_id) throws Exception {
		System.out.println(acd_id);
		reportService.deleteReport(acd_id);

		return "redirect:/reportPage";
	}

}
