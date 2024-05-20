package com.sky.lms_web_service.controller;

import com.sky.lms_web_service.dto.Contents_Manage;
<<<<<<< Updated upstream
import com.sky.lms_web_service.dto.User;
=======
>>>>>>> Stashed changes
import com.sky.lms_web_service.service.ContentService;
import com.sky.lms_web_service.service.LectureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
<<<<<<< Updated upstream
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
=======
>>>>>>> Stashed changes

@Controller
public class ContentController {

    @Autowired
    private ContentService contentService;

    @Autowired
    private LectureService lectureService;

    @GetMapping("/")
    public String main(){
        return "main";
    }

    @GetMapping("content")
<<<<<<< Updated upstream
    public String content(Model model, HttpServletRequest request)throws Exception{

        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("loggedInUser");

        // 로그인한 사용자가 없으면 로그인 페이지로 리다이렉트
        if (loggedInUser == null) {
            return "redirect:/login";
        }

=======
    public String content(Model model){
>>>>>>> Stashed changes
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
