package com.sky.lms_web_service.controller;

import com.sky.lms_web_service.service.RegisterMailService;
import com.sky.lms_web_service.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class MainController {

	@Autowired
	private UserService userService;

	@Autowired
    RegisterMailService registerMailService;

	@Autowired
	private HttpSession session;

	@GetMapping("/join")
	public String join() {
		return "join";
	}

	@GetMapping("/indexadmin")
	public String adminIndex() {
		return "indexadmin";
	}

	// 이메일 인증 코드를 생성하고 반환하는 엔드포인트
	@PostMapping("/generateEmailCode")
	@ResponseBody
	String generateEmailCode(@RequestParam("email") String email) throws Exception {
		String code = registerMailService.sendSimpleMessage(email);
		System.out.println("인증코드: " + code);
		return code;
	}

	// 이메일 인증 코드를 확인하는 엔드포인트
	@PostMapping("/verifyEmailCode")
	@ResponseBody
	String verifyEmailCode(@RequestParam("code") String code) {
		String sessionCode = (String) session.getAttribute("emailCode");
		if (sessionCode != null && sessionCode.equals(code)) {
			return "verified";
		} else {
			return "invalid";
		}
	}

}