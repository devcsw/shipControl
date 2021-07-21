package com.kh.shipcontrol;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
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

import com.kh.shipcontrol.service.ShipService;
import com.kh.shipcontrol.vo.ShipVo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Inject
	private ShipService shipService;
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "home";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/getOneShip", method = RequestMethod.POST)
	public ShipVo getShip(@RequestBody ShipVo shipVo) throws Exception {
		int sh_id = shipVo.getSh_id();
		System.out.println("getOneShip_sh_id :" + sh_id);
		return shipService.getShipInfoById(sh_id);
	}	
}
