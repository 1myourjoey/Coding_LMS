package com.sky.lms_web_service.controller;

import com.sky.lms_web_service.dto.Lecture_Info;
import com.sky.lms_web_service.service.LectureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class LectureController {

    @Autowired
    private LectureService lectureService;

    @GetMapping("lecture")
    public String lecture(Model model){
        model.addAttribute("lectureList",lectureService.lectureList());
        return "lecture";
    }
    @GetMapping("lectureDetail")
    public String lectureDetail(Model model){
        model.addAttribute("lectureList",lectureService.lectureList());
        return "lecture";
    }

    @PostMapping("lectureInfo")
    public String lectureInfo(Lecture_Info lectureInfo){
        lectureService.insertOrUpdateLecture(lectureInfo);

        //lectureService.insertLectureInfo(lectureInfo);
        return "redirect:/content";
    }
    @GetMapping("selectLecture")
    @ResponseBody
    public Lecture_Info selectLecture(@RequestParam("lecNum") String lecNum, Model model){
        return lectureService.selectLecture(lecNum);
    }

    @PostMapping("/modalSearch")
    @ResponseBody
    public List<Lecture_Info> searchLectures(@RequestParam String lecName) {
        return lectureService.searchLecture(lecName);
    }

    @PostMapping("/lectureSearch")
    @ResponseBody
    public List<Lecture_Info> lectureSearch(@RequestParam("lecName") String lecName,@RequestParam("lecEx") String lecEx){
        return lectureService.lectureSearch(lecName,lecEx);
    }

    @PostMapping("deleteLecture")
    public String deleteLecture(String lecNum){
        lectureService.deleteLecture(lecNum);
        return "redirect:/content";
    }







}
