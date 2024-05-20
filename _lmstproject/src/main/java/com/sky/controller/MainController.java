<<<<<<<< HEAD:lms_web_service/src/main/java/com/sky/lms_web_service/controller/MainController.java
package com.sky.lms_web_service.controller;
========
package com.sky.controller;
>>>>>>>> main:_lmstproject/src/main/java/com/sky/controller/MainController.java


import com.sky.lms_web_service.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@Autowired
	private UserService userService;

	@GetMapping("/join")
	public String join() {
		return "join";
	}

	@GetMapping("/indexadmin")
	public String adminIndex() {
		return "indexadmin";
	}

}
