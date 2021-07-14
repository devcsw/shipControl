package com.kh.shipcontrol.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


//소켓통신 테스트 페이지
@Controller
public class SocketController {
	private static final Logger logger = LoggerFactory.getLogger(ManagementController.class);
	
	@RequestMapping(value = "/client_test", method = RequestMethod.GET)
	public String chat(Locale locale, Model model) {
		logger.info("Welcome chat! The client locale is {}.", locale);
		
		return "client_test";
	}
	
}
