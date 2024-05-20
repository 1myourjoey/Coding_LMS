package com.sky.lms_web_service.controller;


import com.sky.lms_web_service.dto.User;
import com.sky.lms_web_service.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @GetMapping("/login")
    public String loginForm() {
        return "/userlogin"; // 로그인 폼 페이지로 이동
    }

    @PostMapping("/setlogin")
    @ResponseBody
    public String login(HttpServletRequest request, @RequestParam String loginId, @RequestParam String pw) {
        User user = userService.getUserById(loginId);

        if (user != null && user.getPw() != null && user.getPw().equals(pw)) {
            HttpSession session = request.getSession();
            session.setAttribute("loggedInUser", user);
            session.setAttribute("userNo", user.getUserNo());

            // 로그인 성공 시 관리자 여부 확인하여 반환
            if ("Y".equals(user.getAdminYn())) {
                return "admin"; // 관리자인 경우 "admin" 반환
            } else {
                return "user"; // 사용자인 경우 "user" 반환
            }
        } else {
            return "fail"; // 로그인 실패 시 "fail" 반환
        }
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        // 세션에서 "loggedInUser" 및 "isAdmin" 정보 삭제
        HttpSession session = request.getSession();
        session.removeAttribute("loggedInUser");
        session.removeAttribute("isAdmin");

        // 세션 만료
        session.invalidate();
        return "redirect:/"; // 로그아웃 후 로그인 페이지로 리다이렉트
    }

    @GetMapping("/getsessioninfo")
    @ResponseBody
    public String getSessionInfo(HttpSession session) {
        // 세션에서 로그인된 사용자의 정보(User)와 관리자 권한 여부를 가져와서 반환
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");

        if (loggedInUser != null) {
            if (isAdmin != null && isAdmin) {
                return "로그인된 사용자: " + loggedInUser.getUserName() + " (관리자)";
            } else {
                return "로그인된 사용자: " + loggedInUser.getUserName();
            }
        } else {
            return "로그인된 사용자가 없습니다.";
        }
    }
}
