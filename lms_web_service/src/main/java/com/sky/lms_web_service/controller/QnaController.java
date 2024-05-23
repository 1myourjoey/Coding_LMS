package com.sky.lms_web_service.controller;


import com.sky.lms_web_service.dto.Comment;
import com.sky.lms_web_service.dto.Post;
import com.sky.lms_web_service.dto.Qna;
import com.sky.lms_web_service.dto.User;
import com.sky.lms_web_service.service.CommentService;
import com.sky.lms_web_service.service.QnaService;
import org.checkerframework.checker.units.qual.C;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class QnaController {

	@Autowired
	private QnaService qnaService;
	@Autowired
	private CommentService commentService;


	@RequestMapping("/qna/openQnaList.do")
	public String openQnaList(HttpServletRequest request, Model model,
														@RequestParam(defaultValue = "1") int page,
														@RequestParam(defaultValue = "10") int size) throws Exception {

		// 세션에서 로그인한 사용자 정보 가져오기
		HttpSession session = request.getSession();
		Object loggedInUser = session.getAttribute("loggedInUser");

		// 로그인한 사용자가 없으면 로그인 페이지로 리다이렉트
		if (loggedInUser == null) {
			return "redirect:/login";
		}

		int itemsPerPage = size;

		// 총 포스트 수 가져오기
		int total = qnaService.getTotal();

		// 총 페이지 수 계산
		int totalPages = (int) Math.ceil((double) total / itemsPerPage);

		// 현재 페이지가 1보다 작으면 1로 설정
		if (page < 1) {
			page = 1;
		}
		// 현재 페이지가 마지막 페이지를 초과하면 마지막 페이지로 설정
		else if (page > totalPages) {
			page = totalPages;
		}

		// 현재 페이지의 시작 인덱스 계산
		int offset = (page - 1) * itemsPerPage;
		offset = Math.max(0, offset); // 음수 값이 되지 않도록 보정

		// 현재 페이지의 포스트 목록 가져오기
		List<Qna> list = qnaService.getPaginatedPost(offset, itemsPerPage);

		// 현재 페이지의 시작 및 끝 페이지 번호 계산
		int maxVisiblePages = 10; // 한 번에 보여줄 페이지 수
		int numPagesBeforeCurrent = 5; // 현재 페이지 앞에 보여줄 페이지 수

		int startPage = Math.max(1, page - numPagesBeforeCurrent);
		int endPage = Math.min(startPage + maxVisiblePages - 1, totalPages);

		model.addAttribute("list", list);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages); // 여기서 totalPages를 total로 변경
		model.addAttribute("start", startPage);
		model.addAttribute("end", endPage);

		return "qnaList";
	}


	@GetMapping("/qnalistuser")
	public ModelAndView listQna(HttpServletRequest request, Model model) throws Exception {
		ModelAndView mv = new ModelAndView("qnaListuser");

		// 회원 목록을 가져와 모델에 추가
		List<Qna> listuser = qnaService.selectQnaList();
		mv.addObject("listuser", listuser);

		return mv;
	}

	@RequestMapping("/qna/openQnaWrite.do")
	public String openQnaWrite() throws Exception {


		return "qnaWrite";
	}



	@GetMapping("/QnaDetailuser")
	public ModelAndView openQnaDetailuser(@RequestParam int qNum, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("boardDetailuser");

		List<Qna>qna1 = qnaService.selectQnaDetail(qNum);
		mv.addObject("qna1", qna1);

		return mv;
	}



	@RequestMapping("/qna/insertQna.do")
	public String insertQna(@ModelAttribute("Qna")Qna qna, HttpSession session) throws Exception {

		User User = (User) session.getAttribute("loggedInUser");


			int userNo = User.getUserNo();

			qna.setUserNo(userNo);

			qnaService.insertQna(qna);

			return "redirect:openQnaList.do";


	}


	@RequestMapping("/qna/openQnaDetail.do")
	public ModelAndView openQnaDetail(@RequestParam int qNum, HttpServletRequest request, HttpSession session, Model model,
																		@ModelAttribute("Comment") Comment comment) throws Exception {
		// 세션에서 로그인된 사용자 정보를 확인합니다.
		User loggedInUser = (User) session.getAttribute("loggedInUser");

		// 로그인된 사용자 정보가 없으면 로그인 페이지로 리디렉션합니다.
		if (loggedInUser == null) {
			return new ModelAndView("redirect:/login"); // 로그인 페이지의 URL로 변경
		}

		Integer userNo = (Integer) session.getAttribute("userNo");
		// 게시글
		List<Qna> qnalist1 = qnaService.selectQnaDetail(qNum);
		model.addAttribute("qnalist1", qnalist1);

		// 댓글
		List<Comment> comlist = commentService.getParentComments(qNum);
		model.addAttribute("comlist", comlist);

	//대댓글
		Map<Integer, List<Comment>> replyMap = new HashMap<>();
		for (Comment comment1 : comlist) {
			List<Comment> replies = commentService.getReplies(comment1.getCommentNum());
			replyMap.put(comment1.getCommentNum(), replies);
		}
		model.addAttribute("replyMap", replyMap);

		return new ModelAndView("qnaDetail");
	}



//대댓글 달기
@PostMapping("/submitReply")
public  String subRe(@ModelAttribute("Comment") Comment comment,@RequestParam int qNum,@RequestParam("pCommentNum") int pCommentNum,
										 @RequestParam("commentContents") String commentContents,HttpSession session){
	Integer userNo = (Integer) session.getAttribute("userNo");
	comment.setUserNo(userNo);
	//이름 받아오기  아직 미구현
	User loggedInUser = (User) session.getAttribute("loggedInUser");
	String userName = loggedInUser.getUserName();


		 commentService.addReply(comment,qNum,pCommentNum,commentContents);
	return "redirect:/qna/openQnaDetail.do?qNum=" + qNum;
}




	@RequestMapping("/qna/updateQna.do")
	public String updateQna(@RequestParam("qNum") int qNum, @ModelAttribute("Qna")Qna qna) throws Exception {
		qna.setqNum(qNum);

		qnaService.updateQna(qna);

		return "redirect:/qna/openQnaList.do";
	}

	@RequestMapping("/qna/deleteQna.do")
	public String deleteQna(@RequestParam ("qNum") int qNum) throws Exception {

		qnaService.deleteQna(qNum);
		return "redirect:/qna/openQnaList.do";
	}


//댓글 달기
@PostMapping("/qna/addReply.do")
public String addre(@RequestParam("qNum") int qNum,@ModelAttribute("Comment")Comment comment,HttpSession session){
	Integer userNo = (Integer) session.getAttribute("userNo");
//	 이름 받아오기
	User loggedInUser = (User) session.getAttribute("loggedInUser");
	String userName = loggedInUser.getUserName();

	comment.setQNum(qNum);
	comment.setUserNo(userNo);
	commentService.addComment(comment);

	return "redirect:/qna/openQnaDetail.do?qNum=" + qNum;

}


	@GetMapping("/deleteReply")
	public String delrep(@RequestParam("commentNum") int commentNum, @RequestParam("qNum") int qNum) {
		commentService.deleteComment(commentNum);
		return "redirect:/qna/openQnaDetail.do?qNum=" + qNum;
	}

	@PostMapping("/updateReply")
	public String updaterep(@RequestParam("commentNum") int commentNum,@RequestParam("qNum") int qNum
			,String commentContents){
		commentService.updateComment(commentNum,commentContents);
		return "redirect:/qna/openQnaDetail.do?qNum=" + qNum;
	}

}
