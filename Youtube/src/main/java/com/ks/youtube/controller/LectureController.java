package com.ks.youtube.controller;

import com.ks.youtube.entity.lecture_info;
import com.ks.youtube.service.LectureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
    public String lectureInfo(lecture_info lectureInfo){
        lectureService.insertOrUpdateLecture(lectureInfo);

        //lectureService.insertLectureInfo(lectureInfo);
        return "redirect:/content";
    }
    @GetMapping("selectLecture")
    @ResponseBody
    public lecture_info selectLecture(@RequestParam("lecNum") String lecNum, Model model){
        return lectureService.selectLecture(lecNum);
    }
}
