package com.sky.sugangController;

import com.sky.dto.User;
import com.sky.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@GetMapping("/memberlist")
	public String listMembers(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		User loggedInUser = (User) session.getAttribute("loggedInUser");

		if (loggedInUser == null) {
			return "redirect:/login";
		}
		List<User> userList = new ArrayList<>();
		userList.add(loggedInUser);

		model.addAttribute("userList", userList);

		return "memberList";
	}



	@PostMapping("/register")
	public String registerMember(@RequestParam("loginId") String loginId, @RequestParam("userName") String userName,
								 @RequestParam("pw") String pw, @RequestParam("email") String email) {
		User newUser = new User();
		newUser.setLoginId(loginId);
		newUser.setUserName(userName);
		newUser.setPw(pw);
		newUser.setEmail(email);

		userService.insertUser(newUser);
		return "redirect:/";
	}


	 @GetMapping("/memberList/{loginId}/updateForm")
	    public String showUpdateForm(HttpServletRequest request, @PathVariable("loginId") String loginId, Model model) {
	        HttpSession session = request.getSession();
		 User loggedInUser = (User) session.getAttribute("loggedInUser");

	        if (loggedInUser == null || !loggedInUser.getLoginId().equals(loginId)) {
	            // 현재 로그인한 사용자와 수정하려는 회원의 아이디가 일치하지 않으면 권한 없음 페이지로 리다이렉트 또는 처리
	            return "redirect:/access-denied";
	        }

		 User user = userService.getUserById(loginId);
	        model.addAttribute("user", user);
	        return "updateForm";
	    }

	@PostMapping("/userList/{loginId}/update")
	public String processUpdateForm(@PathVariable("userNo") int userNo, @ModelAttribute("updatedUser") User updatedUser) {
	    // 받아온 수정된 회원 정보에 번호를 설정
	    updatedUser.setUserNo(userNo);

	    // 받아온 수정된 회원 정보를 데이터베이스에 업데이트
	    userService.updateUser(updatedUser);

	    return "redirect:/memberlist"; // 수정 후 목록 페이지로 리다이렉트
	}


	@GetMapping("/memberlist/{loginId}/delete")
	public String deleteMember(HttpServletRequest request, @PathVariable("loginId") String loginId) {
		HttpSession session = request.getSession();
		User loggedInUser = (User) session.getAttribute("loggedInUser");

		if (loggedInUser == null || !loggedInUser.getLoginId().equals(loginId)) {
			return "redirect:/access-denied";
		}

		userService.deleteUser(loginId);
		session.removeAttribute("loggedInUser");

		return "redirect:/"; // 삭제 후 목록 페이지로 리다이렉트
	}



}
