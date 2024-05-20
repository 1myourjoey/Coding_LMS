package com.sky.lms_web_service.controller;

import com.sky.lms_web_service.dto.Board;
import com.sky.lms_web_service.dto.BoardFile;
import com.sky.lms_web_service.dto.User;
import com.sky.lms_web_service.service.BoardService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.net.URLEncoder;
import java.util.List;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;


	@RequestMapping("/board/openBoardList.do")
	public ModelAndView openBoardList(HttpServletRequest request, HttpSession httpSession,
									  @RequestParam(value = "page", defaultValue = "1") int page) throws Exception {

		ModelAndView mv = new ModelAndView("boardList");
		HttpSession session = request.getSession();
		User loggedInUser = (User) session.getAttribute("loggedInUser");

		if (loggedInUser == null) {
			mv.setViewName("redirect:/userlogin");
			return mv;
		}

		int itemsPerPage = 10;

		int totalCount = boardService.getTotalCount();
		int totalPages = (int) Math.ceil((double) totalCount / itemsPerPage);

		// 페이지가 1보다 작은 경우 1로 설정
		if (page < 1) {
			page = 1;
		}
		// 페이지가 마지막 페이지를 초과하는 경우 마지막 페이지로 설정
		else if (page > totalPages) {
			page = totalPages;
		}

		int offset = (page - 1) * itemsPerPage;
		offset = Math.max(0, offset); // 페이지가 1보다 작을 때 시작 위치를 0으로 설정

		List<Board> boardList = boardService.selectBoardList(offset, itemsPerPage);

		int maxVisiblePages = 10; // 한 번에 보여줄 페이지 수
		int numPagesBeforeCurrent = 5; // 현재 페이지 앞에 보여줄 페이지 수

		int startPage = Math.max(1, page - numPagesBeforeCurrent);
		int endPage = Math.min(startPage + maxVisiblePages - 1, totalPages);

		mv.addObject("list", boardList);
		mv.addObject("currentPage", page);
		mv.addObject("totalPages", totalPages);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);

		return mv;
	}


	@GetMapping("/boardlistuser")
	public String listMembers(Model model, HttpSession session, @RequestParam(value = "page", defaultValue = "1") int page) throws Exception {
		// 세션에서 사용자 정보를 가져온다고 가정
		Object user = session.getAttribute("loggedInUser");

		// 세션에 사용자 정보가 없다면 로그인 페이지로 리다이렉트
		if (user == null) {
			return "redirect:/login"; // 로그인 페이지의 URL로 변경
		}

		int itemsPerPage = 10;

		int totalCount = boardService.getTotalCount();
		int totalPages = (int) Math.ceil((double) totalCount / itemsPerPage);

		// 페이지가 1보다 작은 경우 1로 설정
		if (page < 1) {
			page = 1;
		}
		// 페이지가 마지막 페이지를 초과하는 경우 마지막 페이지로 설정
		else if (page > totalPages) {
			page = totalPages;
		}

		int offset = (page - 1) * itemsPerPage;
		offset = Math.max(0, offset); // 페이지가 1보다 작을 때 시작 위치를 0으로 설정

		List<Board> boardList = boardService.selectBoardList(offset, itemsPerPage);

		int maxVisiblePages = 10; // 한 번에 보여줄 페이지 수
		int numPagesBeforeCurrent = 5; // 현재 페이지 앞에 보여줄 페이지 수

		int startPage = Math.max(1, page - numPagesBeforeCurrent);
		int endPage = Math.min(startPage + maxVisiblePages - 1, totalPages);


		model.addAttribute("list", boardList);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);

		return "boardListuser";
	}





	@RequestMapping("/board/openBoardWrite.do")
	public String openBoardWrite(HttpServletRequest request) throws Exception {


		return "boardWrite";
	}



	@GetMapping("/BoardDetailuser")
	public ModelAndView openBoardDetailuser(@RequestParam int boardIdx, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("boardDetailuser");

		Board board1 = boardService.selectBoardDetail(boardIdx);
		mv.addObject("board1", board1);

		return mv;
	}



	@RequestMapping("/board/insertBoard.do")
	public String insertBoard(Board board, MultipartHttpServletRequest multipartHttpServletRequest, HttpServletRequest request) throws Exception {
		// 세션에서 로그인한 사용자 정보 가져오기
		HttpSession session = request.getSession();
		User loggedInUser = (User) session.getAttribute("loggedInUser");

		// 로그인한 사용자가 없으면 로그인 페이지로 리다이렉트
		if (loggedInUser == null) {
			return "redirect:/login";
		}

		board.setUserNo(loggedInUser.getUserNo()); // 사용자 번호 설정
		boardService.insertBoard(board, multipartHttpServletRequest);
		return "redirect:/board/openBoardList.do";
	}


	@RequestMapping("/board/openBoardDetail.do")
	public ModelAndView openBoardDetail(@RequestParam int boardIdx, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("boardDetail");

		// 세션에서 로그인한 사용자 정보 가져오기
		HttpSession session = request.getSession();
		Object loggedInUser = session.getAttribute("loggedInUser");

		// 로그인한 사용자가 없으면 로그인 페이지로 리다이렉트
		if (loggedInUser == null) {
			mv.setViewName("redirect:/login");
			return mv;
		}


		Board board = boardService.selectBoardDetail(boardIdx);
		mv.addObject("board", board);

		return mv;
	}





	@RequestMapping("/board/updateBoard.do")
	public String updateBoard(Board board, HttpServletRequest request) throws Exception {

		boardService.updateBoard(board);
		return "redirect:/board/openBoardList.do";
	}

	@RequestMapping("/board/deleteBoard.do")
	public String deleteBoard(int boardIdx, HttpSession session) throws Exception {

		boardService.deleteBoard(boardIdx);
		return "redirect:/board/openBoardList.do";
	}


	@RequestMapping("/board/downloadBoardFile.do")
	public void downloadBoardFile(@RequestParam int idx, @RequestParam int boardIdx, HttpServletResponse response, HttpServletRequest request) throws Exception {


		BoardFile boardFile = boardService.selectBoardFileInformation(idx, boardIdx);
		if (!ObjectUtils.isEmpty(boardFile)) {
			String fileName = boardFile.getOriginalFileName();

			byte[] files = FileUtils.readFileToByteArray(new File(boardFile.getStoredFilePath()));

			response.setContentType("application/octet-stream");
			response.setContentLength(files.length);
			response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(fileName, "UTF-8") + "\";");
			response.setHeader("Content-Transfer-Encoding", "binary");

			response.getOutputStream().write(files);
			response.getOutputStream().flush();
			response.getOutputStream().close();
		}
	}
}
