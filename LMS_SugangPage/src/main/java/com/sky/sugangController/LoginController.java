package com.sky.sugangController;


import com.sky.dto.User;
import com.sky.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

    @Autowired
    private HttpSession httpSession;

    @GetMapping("/login")
    public String loginForm() {
        return "/userlogin"; // 로그인 폼 페이지로 이동
    }
    
//    @GetMapping("/index")
//    public String indexPage() {
//        return "index"; // index.html 파일로 이동
//    }
    @GetMapping("/index")
    public String indexPage(Model model, HttpServletRequest request) {
        Integer userNo = (Integer) request.getSession().getAttribute("userNo");
        if (userNo != null) {
            User loggedInUser = userService.getUserByUserNo(userNo);
            model.addAttribute("loggedInUser", loggedInUser);
        }
        return "index"; // index.html 파일로 이동
    }

    @PostMapping("/setlogin")
    @ResponseBody
    public String login(HttpServletRequest request, @RequestParam String loginId, @RequestParam String pw) {
        User user = userService.getUserById(loginId);

        if (user != null && user.getPw().equals(pw)) {
            HttpSession session = request.getSession();
            session.setAttribute("userNo", user.getUserNo()); // userNo를 세션에 저장
            return "success"; // 로그인 성공 시 "success" 반환
        } else {
            return "fail"; // 로그인 실패 시 "fail" 반환
        }
    }





    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        // 세션에서 "loggedInUser" 정보 삭제
        HttpSession session = request.getSession();
        session.removeAttribute("loggedInUser");

        // 세션 만료
        session.invalidate();

        return "redirect:/"; // 로그아웃 후 로그인 페이지로 리다이렉트
    }


    @GetMapping("/getsessioninfo")
    @ResponseBody
    public String getSessionInfo(HttpSession session) {
        // 세션에서 로그인된 사용자의 정보(UserDto)를 가져와서 반환
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null) {
            return "로그인된 사용자: " + loggedInUser.getUserName();
        } else {
            return "로그인된 사용자가 없습니다.";
        }
    }

}
