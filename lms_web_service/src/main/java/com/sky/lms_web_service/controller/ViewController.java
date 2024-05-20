package com.sky.lms_web_service.controller;

import com.sky.lms_web_service.dto.Board;
import com.sky.lms_web_service.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ViewController {

    @Autowired
    private BoardService boardService;

    @RequestMapping("/board/openBoardView")
    public ModelAndView openBoardView(HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView();

        HttpSession session = request.getSession();
        Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");

        if (isAdmin != null && isAdmin) {
            // 관리자 뷰로 맵핑
            List<Board> list = boardService.selectBoardList();
            mv.addObject("list", list);
            mv.setViewName("adminView");
        } else {
            // 사용자 뷰로 맵핑
            List<Board> listuser = boardService.selectBoardList();
            mv.addObject("listuser", listuser);
            mv.setViewName("userView");
        }

        return mv;
    }

}
