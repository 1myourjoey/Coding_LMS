package com.ks.lms_web_service.controller;

import com.sky.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	@Autowired
	private UserService userService;

	@GetMapping("/")
	public String index() {
		return "index";
	}

	@GetMapping("/join")
	public String join() {
		return "join";
	}

	@GetMapping("/indexadmin")
	public String adminIndex() {
		return "indexadmin";
	}

}
