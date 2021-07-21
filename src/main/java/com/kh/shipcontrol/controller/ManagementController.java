	package com.kh.shipcontrol.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.shipcontrol.service.ShipService;
import com.kh.shipcontrol.service.StatusService;
import com.kh.shipcontrol.vo.SensorDto;
import com.kh.shipcontrol.vo.ShipVo;

/**
 * Handles requests for the application home page.
 */

@Controller
@RequestMapping(value = "/shipcontrol")
public class ManagementController {
	
	private static final Logger logger = LoggerFactory.getLogger(ManagementController.class);
	
	@Inject
	private ShipService shipService;
	@Inject
	private StatusService statusService;
	//선박관리 페이지
	@RequestMapping(value = "/management", method = RequestMethod.GET)
	public String home(Model model, String keyword, String searchType) {
		System.out.println(searchType);
		System.out.println(keyword);
		Map<String,String> map = new HashMap<String, String>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		
		List<Map<String, Object>> list = shipService.listAllShip(map);
		List<Map<String, Object>> notSensorList = shipService.getNotSensorList(map);
		
		System.out.println(list);
		model.addAttribute("list", list );
		model.addAttribute("notSensorList", notSensorList );
		
		return "shipcontrol/shipManagement";
	}
	
	@RequestMapping(value = "/insertShip", method = RequestMethod.POST)
	public String insertShip(ShipVo shipVo, SensorDto sensorDto, RedirectAttributes rttr) throws Exception {
		shipService.registShip(shipVo, sensorDto);
		rttr.addFlashAttribute("msg", "insertSuccess");
		return "redirect:/shipcontrol/management";
	}
	
	@RequestMapping(value = "/updateShipForm", method = RequestMethod.GET)
	public String updateShip(int sh_id, Model model) throws Exception {
		System.out.println(sh_id);
		Map<String, Object> map = shipService.selectOneShip(sh_id);
		model.addAttribute("sh_id", sh_id);
		SensorDto sensorDto = (SensorDto)map.get("SensorDto");
		ShipVo shipVo = (ShipVo)map.get("ShipVo");
		model.addAttribute("ShipVo",shipVo);
		model.addAttribute("SensorDto",sensorDto);
		model.addAttribute("sh_id",sh_id);
		return "shipcontrol/updateShipForm";
	}	
	
	//선박 수정 삭제
	@RequestMapping(value = "/updateShipRun", method = RequestMethod.POST)
	public String updateShipRun(ShipVo shipVo, SensorDto sensorDto, RedirectAttributes rttr) throws Exception {
		System.out.println(shipVo);	
		System.out.println("sensordto문제:" + sensorDto);	
		shipService.updateShip(shipVo, sensorDto);
		rttr.addFlashAttribute("msg", "updateSuccess");
		return "redirect:/shipcontrol/management";
	}
	
	@RequestMapping(value = "/deleteShipRun", method = RequestMethod.GET)
	public String deleteShipRun(int sh_id, RedirectAttributes rttr) throws Exception {
		System.out.println("deleteRun:" + sh_id);
		shipService.deleteShip(sh_id);
		rttr.addFlashAttribute("msg", "updateSuccess");
		return "redirect:/shipcontrol/management";
	}
	
	@RequestMapping(value = "/statusList", method = RequestMethod.GET)
	public String statusList(Model model, String keyword, String searchType, int sh_id) {
		System.out.println(sh_id);
		Map<String, Object> map = shipService.selectOneShip(sh_id);
		List<Map<String, Object>> list = statusService.getStatusList(sh_id);
		
		ShipVo shipVo = (ShipVo)map.get("ShipVo");
		System.out.println(shipVo);
		model.addAttribute("ShipVo", shipVo);
		model.addAttribute("list", list);
		return "shipcontrol/statusList";
	}
	
	@ResponseBody
	@RequestMapping(value = "/dupShip", method = RequestMethod.POST)
	public Map<String, String> dupShip(@RequestBody ShipVo shipVo, Model model) throws Exception {
		System.out.println("dup shipVo: " + shipVo);
		Map<String, Integer> map = shipService.dupShip(shipVo);
		String sh_id="";
		String sh_mmsi="";
		String sh_board_code="";
		String sh_call_sign="";
		
		if(map.get("sh_id") > 0) {
			sh_id = "exist";
		}
		if(map.get("sh_mmsi") > 0) {
			sh_mmsi = "exist";
		}
		if(map.get("sh_board_code") > 0) {
			sh_board_code  = "exist";
		}
		if(map.get("sh_call_sign") > 0) {
			sh_call_sign = "exist";
		}
		Map<String, String> resultMap = new HashMap<String, String>();
		resultMap.put("sh_id", sh_id);
		resultMap.put("sh_mmsi", sh_mmsi);
		resultMap.put("sh_board_code", sh_board_code);
		resultMap.put("sh_call_sign", sh_call_sign);
		return resultMap;
	}	
}
