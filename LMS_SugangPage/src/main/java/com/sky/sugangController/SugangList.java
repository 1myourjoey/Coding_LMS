package com.sky.sugangController;

import com.sky.dto.Contents_Manage;
import com.sky.dto.Lecture_Info;
import com.sky.dto.SugangRegWithDetails;
import java.util.Date;
import com.sky.dto.SugangRegister;
import com.sky.service.ContentsManageService;
import com.sky.service.LectureService;
import com.sky.service.SugangRegisterService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class SugangList {
    private final LectureService lectureService;
    private final ContentsManageService contentsManageService;



    @GetMapping("/sugangList")
    public String sugangList(Model model, HttpServletRequest request) {
        // Get userNo from the session
        int userNo = (int) request.getSession().getAttribute("userNo");

        // Get the list of lectures the user is registered for
        List<SugangRegWithDetails> lectures = lectureService.getSugangRegWithDetailsByUserNo(userNo);

        model.addAttribute("lectures", lectures);
        return "sugangList"; // sugangList.jsp 파일을 뷰로 사용
    }

    @GetMapping("/sugangReg")
    public String sugangReg(Model model) {
        List<Lecture_Info> lectures = lectureService.getAllLectures();
        model.addAttribute("lectures", lectures);
        return "sugangReg";
    }
    @GetMapping("/lecture/{lecNum}") // 수강신청에서 과목 선택시 과목 내부 페이지 보여줌
    public String lectureDetails(@PathVariable String lecNum, Model model) {
        List<Contents_Manage> contents = contentsManageService.getContentsByLecNum(lecNum);
        model.addAttribute("contents", contents);
        return "lectureDetails"; // lectureDetails.jsp 파일을 뷰로 사용
    }




}
