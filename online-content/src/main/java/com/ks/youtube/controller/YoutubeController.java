package com.ks.youtube.controller;

import com.ks.youtube.entity.contents_manage;
import com.ks.youtube.entity.lecture_info;
import com.ks.youtube.service.ContentService;
import com.ks.youtube.service.LectureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class YoutubeController {

    @Autowired
    private ContentService contentService;

    @Autowired
    private LectureService lectureService;

    @GetMapping("/")
    public String main(){
        return "test";
    }

    @GetMapping("content")
    public String content(Model model){
        model.addAttribute("contentList",contentService.selectAll());
        model.addAttribute("formatTime",contentService.formatTime());
        model.addAttribute("lectureList",lectureService.lectureList());
        return "content";
    }

    @PostMapping("/insertContent")
    public String insertContent(contents_manage contentsManage){
        contentService.insertContent(contentsManage);
        return "redirect:/content";
    }

    @GetMapping("updateContent")
    public String updateContent(contents_manage contentsManage){
        contentService.insertOrUpdateContent(contentsManage);

//        contentService.updateContent(contentsManage);
        return "redirect:/content";
    }
    @GetMapping("deleteContent")
    public String deleteContent(String conNum){
        contentService.deleteContent(conNum);
        return "redirect:/content";
    }

    @GetMapping("selectContent")
    @ResponseBody
    public contents_manage selectContent(@RequestParam("conNum") String conNum,Model model){
//        model.addAttribute("selectContent", contentService.selectContent(conNum));
//        return "content";
        return contentService.selectContent(conNum);
    }
    @PostMapping("selectSearch")
    public String selectSearch(@RequestParam("conName") String conName,@RequestParam("lecName") String lecName,Model model){
        model.addAttribute("selectSearch",contentService.selectSearch(conName,lecName));
        model.addAttribute("lectureList",lectureService.lectureList());
        return "content";
    }
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
    public lecture_info selectLecture(@RequestParam("lecNum") String lecNum,Model model){
        return lectureService.selectLecture(lecNum);
    }











}
