package com.kh.shipcontrol.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.shipcontrol.service.ShipService;
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

	@RequestMapping(value = "/management", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("management입니다.! The client locale is {}.", locale);
		
		List<Map<String, Object>> list = shipService.listAllShip();
		
		System.out.println(list);
		model.addAttribute("list", list );
		
		return "shipcontrol/shipManagement";
	}
	
	@RequestMapping(value = "/insertShip", method = RequestMethod.POST)
	public String insertShip(ShipVo shipVo, SensorDto sensorDto, RedirectAttributes rttr) throws Exception {
		
		
		shipService.registShip(shipVo, sensorDto);
		rttr.addFlashAttribute("msg", "insertSuccess");
		return "redirect:/shipcontrol/management";
	}
	
	@RequestMapping(value = "/updateShipForm", method = RequestMethod.GET)
	public String updateShip(ShipVo shipVo, SensorDto sensorDto, RedirectAttributes rttr) throws Exception {
			
		return "shipcontrol/updateShipForm";
	}	
	
	@RequestMapping(value = "/updateShipRun", method = RequestMethod.POST)
	public String updateShipRun(ShipVo shipVo, SensorDto sensorDto, RedirectAttributes rttr) throws Exception {
			
		
		shipService.registShip(shipVo, sensorDto);
		rttr.addFlashAttribute("msg", "updateSuccess");
		return "redirect:/shipcontrol/management";
	}
	@RequestMapping(value = "/deleteShipRun", method = RequestMethod.POST)
	public String deleteShipRun(int sh_id, RedirectAttributes rttr) throws Exception {
			
		shipService.deleteShip(sh_id);
	//	shipService.registShip(shipVo, sensorDto);
		rttr.addFlashAttribute("msg", "updateSuccess");
		return "redirect:/shipcontrol/management";
	}

	
}
