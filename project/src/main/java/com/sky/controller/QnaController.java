package com.sky.controller;

import com.sky.dto.CommentDTO;
import com.sky.dto.QnaDto;
import com.sky.service.CommentService;
import com.sky.service.QnaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class QnaController {

	@Autowired
	private QnaService qnaService;
	@Autowired
	private CommentService commentService;
	@RequestMapping("/qna/openQnaList.do")
	public ModelAndView openQnaList(HttpServletRequest request,Model model) throws Exception {
		ModelAndView mv = new ModelAndView("qnaList");

		// 세션에서 로그인한 사용자 정보 가져오기
		HttpSession session = request.getSession();
		Object loggedInUser = session.getAttribute("loggedInUser");

		// 로그인한 사용자가 없으면 로그인 페이지로 리다이렉트
		if (loggedInUser == null) {
			mv.setViewName("redirect:/login");
			return mv;
		}

		List<QnaDto> list = qnaService.selectQnaList();
		model.addAttribute("list", list);

		return mv;
	}


	@GetMapping("/qnalistuser")
	public ModelAndView listQna(HttpServletRequest request, Model model) throws Exception {
		ModelAndView mv = new ModelAndView("qnaListuser");

		// 회원 목록을 가져와 모델에 추가
		List<QnaDto> listuser = qnaService.selectQnaList();
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

		List<QnaDto>qna1 = qnaService.selectQnaDetail(qNum);
		mv.addObject("qna1", qna1);

		return mv;
	}



	@RequestMapping("/qna/insertQna.do")
	public String insertQna(@ModelAttribute("QnaDto")QnaDto qnaDto, HttpServletRequest request, HttpSession session) throws Exception {

		UserDto userDto = (UserDto) session.getAttribute("loggedInUser");


			int userNo = userDto.getUserNo();

			qnaDto.setUserNo(userNo);

			qnaService.insertQna(qnaDto);

			return "redirect:openQnaList.do";


	}



	//댓글 대댓글 보기
	@RequestMapping("/qna/openQnaDetail.do")
	public ModelAndView openQnaDetail(@RequestParam int qNum, HttpServletRequest request, HttpSession session, Model model,
																		@ModelAttribute("CommentDTO") CommentDTO commentDTO) throws Exception {
		// 세션에서 로그인된 사용자 정보를 확인합니다.
		Object loggedInUser = session.getAttribute("loggedInUser");

		// 로그인된 사용자 정보가 없으면 로그인 페이지로 리디렉션합니다.
		if (loggedInUser == null) {
			return new ModelAndView("redirect:/login"); // 로그인 페이지의 URL로 변경
		}

		ModelAndView mv = new ModelAndView("qnaDetail");


		List<QnaDto> qnalist1 = qnaService.selectQnaDetail(qNum);
		model.addAttribute("qnalist1", qnalist1);


		List<CommentDTO> comlist = commentService.getParentComments(qNum);
		model.addAttribute("comlist", comlist);

		return mv;
	}



	@RequestMapping("/qna/updateQna.do")
	public String updateQna(@RequestParam("qNum") int qNum, @ModelAttribute("QnaDto")QnaDto qnaDto, HttpServletRequest request) throws Exception {
		qnaDto.setqNum(qNum);

		qnaService.updateQna(qnaDto);

		return "redirect:/qna/openQnaList.do";
	}

	@RequestMapping("/qna/deleteQna.do")
	public String deleteQna(@RequestParam ("qNum") int qNum, HttpSession session) throws Exception {
		qnaService.deleteQna(qNum);
		return "redirect:/qna/openQnaList.do";
	}

//대댓글 달기
@PostMapping("/submitReply")
public  String submitReply(CommentDTO commentDTO) {
	commentService.addComment(commentDTO);
	return "redirect:/qna/openQnaDetail.do";
}
//댓글 달기
@PostMapping("/qna/addReply.do")
	public String addre(@RequestParam("qNum") int qNum,@ModelAttribute("CommentDto")CommentDTO commentDTO,HttpSession session){
	UserDto userDto = (UserDto) session.getAttribute("loggedInUser");

	int userNo = userDto.getUserNo();
	commentDTO.setUserNo(userNo);
	commentDTO.setQNum(qNum);
	commentService.addComment(commentDTO);

	return "redirect:/qna/openQnaDetail.do?qNum=" + qNum;

//		return "/qna/openQnaDetail.do";
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
