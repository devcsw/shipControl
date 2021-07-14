package com.kh.shipcontrol.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.shipcontrol.service.UserService;
import com.kh.shipcontrol.vo.UserVo;

@Controller
public class UserController {

	@Inject
	UserService userService;

	@RequestMapping(value = "/registerPage")
	public String registerPage() throws Exception {

		return "registerPage";
	}

	@RequestMapping(value = "/loginRun")
	public String loginRun(HttpSession session, UserVo userVo) throws Exception {
		System.out.println("@loginController userVo :" + userVo);
		boolean result = userService.loginRun(userVo);
		if (result == true) {
			UserVo loginVo = userService.getUserVo(userVo.getUser_id());
			session.setAttribute("loginVo", loginVo);
			System.out.println(loginVo);
		}

		return "redirect:/";
	}

	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "/registerRun", method = RequestMethod.POST)
	public String registerRun(UserVo userVo, String user_pw_confirm, RedirectAttributes rttr) throws Exception {
//		System.out.println("@registerController userVo : " + userVo);
//		System.out.println("@registerController userVo : " + user_pw_confirm);

		if (userVo.getUser_pw().equals(user_pw_confirm)) {
			userService.registerUser(userVo);
			rttr.addFlashAttribute("registermsg", "success");
			return "redirect:/";
		}
		return null;
	}

}
