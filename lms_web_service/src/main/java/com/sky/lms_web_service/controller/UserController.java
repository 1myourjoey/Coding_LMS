package com.sky.lms_web_service.controller;



import com.sky.lms_web_service.dto.User;
import com.sky.lms_web_service.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
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

	@GetMapping("/memberList")
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

	//이메일 아이디 중복값 체크
	@GetMapping("/checkDuplicate")
	public ResponseEntity<String> checkDuplicate(@RequestParam("loginId") String loginId, @RequestParam("email") String email) {
		boolean isLoginIdExist = userService.isUserIdExist(loginId);
		boolean isEmailExist = userService.isEmailExist(email);

		if (isLoginIdExist || isEmailExist) {
			return ResponseEntity.ok("duplicate");
		} else {
			return ResponseEntity.ok("not_duplicate");
		}
	}

	@GetMapping("/memberlistadmin")
	public String listMemberuser(HttpServletRequest request, Model model,
								 @RequestParam(defaultValue = "1") int page,
								 @RequestParam(defaultValue = "10") int size) {
		HttpSession session = request.getSession();
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		if (loggedInUser == null) {
			return "redirect:/login";
		}

		// 페이징을 위한 계산
		int totalUserCount = userService.getUserCount();
		int totalPages = (int) Math.ceil((double) totalUserCount / size);

		// 페이지 번호를 벗어나는 요청을 방지하기 위해 범위 제한
		if (page < 1) {
			page = 1;
		} else if (page > totalPages) {
			page = totalPages;
		}

		// 페이지 번호와 페이지당 아이템 수를 이용하여 사용자 리스트를 가져옴
		List<User> userList1 = userService.getUserListWithPaging(page, size);

		// 모델에 추가
		model.addAttribute("userList1", userList1);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);

		return "memberListadmin";
	}


	@PostMapping("/updateUserRole")
	public String updateUserRole(@RequestParam("loginId") String loginId, @RequestParam("adminYn") String adminYn) {
		userService.updateUserRole(loginId, adminYn);
		return "redirect:/memberListadmin"; // 리다이렉트하여 변경된 사용자 목록을 다시 로드
	}


	@PostMapping("/register")
	public String registerMember(@RequestParam("loginId") String loginId, @RequestParam("userName") String userName,
								 @RequestParam("pw") String pw, @RequestParam("email") String email, Model model) {
		// Check if the loginId already exists
		if (userService.isUserIdExist(loginId)) {
			model.addAttribute("errorMessage", "이미 사용 중인 아이디입니다.");
			return "register"; // 중복 아이디가 발생하면 다시 회원가입 페이지로 이동
		}

		// Check if the email already exists
		if (userService.isEmailExist(email)) {
			model.addAttribute("errorMessage", "이미 사용 중인 이메일입니다.");
			return "register"; // 중복 이메일이 발생하면 다시 회원가입 페이지로 이동
		}

		// If neither the loginId nor the email is duplicate, proceed with registration
		User newUser = new User();
		newUser.setLoginId(loginId);
		newUser.setUserName(userName);
		newUser.setPw(pw);
		newUser.setEmail(email);

		userService.insertUser(newUser);
		return "redirect:/";
	}

	@GetMapping("/adminjoin")
	public String adminJoin() {
		return "adminjoin";
	}

	@PostMapping("/adminregister")
	public String registerAdmin(@RequestParam("loginId") String loginId, @RequestParam("userName") String userName,
								 @RequestParam("pw") String pw, @RequestParam("email") String email) {
		User newAdmin = new User();
		newAdmin.setLoginId(loginId);
		newAdmin.setUserName(userName);
		newAdmin.setPw(pw);
		newAdmin.setEmail(email);

		userService.insertAdmin(newAdmin);
		return "indexadmin";
	}

	@GetMapping("/memberList/{loginId}/passwordupdate")
	public String passwordshowUpdateForm(HttpServletRequest request, @PathVariable("loginId") String loginId, Model model) {

		return "passwordupdate";
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


	@PostMapping("/memberList/{loginId}/update")
	public String processUpdateForm(@PathVariable("loginId") String loginId, @ModelAttribute("updatedUser") User updatedUser, HttpSession session) {
		// 받아온 수정된 회원 정보에 번호를 설정
		updatedUser.setLoginId(loginId);

		// 받아온 수정된 회원 정보를 데이터베이스에 업데이트
		userService.updateUser(updatedUser);

		// 세션에 업데이트된 사용자 정보 저장
		session.setAttribute("loggedInUser", updatedUser);
		return "redirect:/memberList"; // 수정 후 목록 페이지로 리다이렉트
	}




	@GetMapping("/memberList/{loginId}/adminupdateform")
	public String showUpdateadmin(@PathVariable("loginId") String loginId, Model model) {
		User user2 = userService.getUserById(loginId);
		model.addAttribute("user2", user2);
		return "updateadmin";
	}

	@PostMapping("/memberList/{loginId}/updateadmin")
	public String processUpdateadmin(@PathVariable("loginId") String loginId, @ModelAttribute("updatedUser") User updatedUser, HttpSession session) {
		// 받아온 수정된 회원 정보에 번호를 설정
		updatedUser.setLoginId(loginId);

		// 받아온 수정된 회원 정보를 데이터베이스에 업데이트
		userService.updateUser(updatedUser);

		return "redirect:/memberlistadmin"; // 수정 후 목록 페이지로 리다이렉트
	}




	@PostMapping("/memberList/{loginId}/passwordupdate")
	public String passwordProcessUpdateForm(@PathVariable("loginId") String loginId, @RequestParam("newPassword") String newPassword, @RequestParam("confirmPassword") String confirmPassword, HttpSession session) {
		// 새로운 비밀번호와 확인용 비밀번호가 일치하는지 확인
		if (!newPassword.equals(confirmPassword)) {
			// 비밀번호가 일치하지 않으면 다시 비밀번호 변경 폼으로 리다이렉트
			return "redirect:/memberList/" + loginId + "/passwordUpdateForm?error=passwordMismatch";
		}

		// 비밀번호 변경 작업 수행
		userService.updatePassword(loginId, newPassword);

		// 변경된 비밀번호로 다시 로그인하도록 사용자에게 안내

		return "redirect:/memberList"; // 비밀번호 수정 후 목록 페이지로 리다이렉트
	}




	@GetMapping("/memberList/{loginId}/delete")
	public String deleteUser(@PathVariable("loginId") String loginId) {
		userService.deleteUser(loginId);
		return "redirect:/memberlistadmin"; // 삭제 후 회원 목록 페이지로 리다이렉트
	}



}
