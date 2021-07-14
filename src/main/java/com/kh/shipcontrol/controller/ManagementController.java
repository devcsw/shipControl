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
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		List<Map<String, Object>> list = shipService.listAllShip();
		System.out.println(list);
		model.addAttribute("list", list );
		
		return "shipcontrol/shipManagement";
	}
	
	@RequestMapping(value = "/insertShip", method = RequestMethod.POST)
	public String insertShip(ShipVo shipVo, SensorDto sensorDto, RedirectAttributes rttr) throws Exception {
		//체크된 데이터 기준
		System.out.println(shipVo);
		System.out.println(sensorDto);
		rttr.addFlashAttribute("msg", "success");
		shipService.registShip(shipVo, sensorDto);
		
		return "redirect:/shipcontrol/management";
	}
	

	
}
