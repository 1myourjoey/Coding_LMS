package com.sky.lms_web_service.controller;

import com.sky.lms_web_service.dto.Chapter;
import com.sky.lms_web_service.dto.Contents_Manage;
import com.sky.lms_web_service.service.ChapterService;
import com.sky.lms_web_service.service.ContentService;
import com.sky.lms_web_service.service.LectureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class ContentController {

    @Autowired
    private ContentService contentService;

    @Autowired
    private LectureService lectureService;

    @Autowired
    private ChapterService chapterService;

    @GetMapping("/")
    public String main(){
        return "main";
    }

    @GetMapping("/contents_List")
    public String Showview(Model model, String lecName){
        List<Contents_Manage> contents = contentService.getContentsByLectureName(lecName);
        model.addAttribute("contents", contents);

        List<Chapter> chapters = chapterService.findAllChapters();
        model.addAttribute("chapters", chapters);
        return "contents_List";
    }


    @GetMapping("content")
    public String content(Model model){
        model.addAttribute("contentList",contentService.selectAll());
        model.addAttribute("formatTime",contentService.formatTime());
        model.addAttribute("lectureList",lectureService.lectureList());
        return "content";
    }

    @PostMapping("/insertContent")
    public String insertContent(Contents_Manage contentsManage){
        contentService.insertContent(contentsManage);
        return "redirect:/content";
    }

    @PostMapping("updateContent")
    public String updateContent(Contents_Manage contentsManage){
        contentService.insertOrUpdateContent(contentsManage);

//        contentService.updateContent(contentsManage);
        return "redirect:/content";
    }
    @PostMapping("deleteContent")
    public String deleteContent(String conNum){
        contentService.deleteContent(conNum);
        return "redirect:/content";
    }

    @GetMapping("selectContent")
    @ResponseBody
    public Contents_Manage selectContent(@RequestParam("conNum") String conNum, Model model){
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


}
