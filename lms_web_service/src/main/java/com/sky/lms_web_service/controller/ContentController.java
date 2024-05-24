package com.sky.lms_web_service.controller;

import com.sky.lms_web_service.dto.Chapter;
import com.sky.lms_web_service.dto.Contents_Manage;
import com.sky.lms_web_service.dto.User;
import com.sky.lms_web_service.service.ChapterService;
import com.sky.lms_web_service.service.ContentService;
import com.sky.lms_web_service.service.LectureService;
import com.sky.lms_web_service.service.ProgressService;
import org.checkerframework.checker.units.qual.A;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ContentController {

    @Autowired
    private ContentService contentService;
    @Autowired
    private LectureService lectureService;
    @Autowired
    private ChapterService chapterService;
    @Autowired
    private ProgressService progressService;

    @GetMapping("/")
    public String main(){
        return "main";
    }

    @GetMapping("/contents_List")
    public String ShowvContentList(Model model,String lecName){
        List<Contents_Manage> contents = contentService.getContentsByLectureName(lecName);
        model.addAttribute("contents", contents);

        //List<Chapter> chapters = chapterService.findAllChapters();
        //model.addAttribute("chapters", chapters);
        return "contents_List";
    }


    @GetMapping("content")
    public String content(Model model, HttpServletRequest request,@RequestParam(defaultValue = "1", name = "page") int pageNo){

        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("loggedInUser");

        if (loggedInUser == null) {
            return "redirect:/login";
        }
        model.addAttribute("paging",contentService.paging(pageNo,5));
        model.addAttribute("pgnList",contentService.getPagination(pageNo));
        model.addAttribute("msgList",contentService.getMsgList(pageNo));

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
//@PostMapping("selectSearch")
//@ResponseBody
//public List<contents_manage> selectSearch(@RequestParam("conName") String conName, @RequestParam("lecName") String lecName) {
//    return contentService.selectSearch(conName, lecName);
//}













}
