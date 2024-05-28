package com.sky.lms_web_service.controller;

import com.sky.lms_web_service.dto.Chapter;
import com.sky.lms_web_service.dto.Contents_Manage;
import com.sky.lms_web_service.dto.Section_Progress;
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
    public String ShowContentList(HttpServletRequest request, Model model, String lecName, String conNum) {

        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("loggedInUser");

        if (loggedInUser == null) {
            return "redirect:/login";
        }

        int userNo = (int) request.getSession().getAttribute("userNo");

        List<Contents_Manage> contents = contentService.getContentsByLectureName(lecName);
        Map<String, List<Chapter>> contentChapters = new HashMap<>();

        for (Contents_Manage content : contents) {
            List<Chapter> chapters = chapterService.findAllChapters(content.getConNum());
            contentChapters.put(content.getConNum(), chapters);

            // 총 길이와 시청한 시간을 이용해 진행률 계산
            String maxSStr = content.getConPlayTime(); // 총 길이 (초 단위)
            String learningTimeStr = progressService.getPreviousLearningTime(userNo, content.getConNum()); // 사용자의 시청 시간 (초 단위)

            if (maxSStr != null && learningTimeStr != null) {
                try {
                    double maxS = Double.parseDouble(maxSStr);
                    double learningTime = Double.parseDouble(learningTimeStr);
                    System.out.println("maxSStr: " + maxSStr);
                    System.out.println("learningTimeStr: " + learningTimeStr);

                    double progress = (learningTime / maxS) * 100;
                    content.setProgress(Double.parseDouble(String.format("%.1f", progress))); // 진행률을 콘텐츠 객체에 설정
                } catch (NumberFormatException e) {
                    content.setProgress(0); // 변환 실패 시 진행률을 0으로 설정
                }
            } else {
                content.setProgress(0); // maxSStr 또는 learningTimeStr이 null일 경우 진행률을 0으로 설정
            }
        }
        model.addAttribute("contents", contents);
        model.addAttribute("contentChapters", contentChapters);
        return "contents_List";
    }


    @GetMapping("/learning")
    public String Showvlearning(Model model, String conNum, HttpServletRequest request,int index, String lecName) {
        List<Chapter> chapters = chapterService.selectChapterByConNum(conNum);
        List<Contents_Manage> content = contentService.getContentsByLectureName(lecName);
        int contentsLength = content.size();
        int userNo = (int) request.getSession().getAttribute("userNo");


        model.addAttribute("userNo", userNo);
        model.addAttribute("contents", contentService.selectContent(conNum));
        model.addAttribute("chapters", chapters);
        model.addAttribute("index", index);
        model.addAttribute("contentsLength", contentsLength);
        model.addAttribute("content", content);
        return "learning";
    }
    @PostMapping("/save-progress")
    public ResponseEntity<String> saveProgress(@RequestParam String learningTime,
                                               @RequestParam String conNum,
                                               @RequestParam String lecNum,
                                               @RequestParam int userNo,
                                               @RequestParam String maxS) {
        Section_Progress progress = new Section_Progress();
        progress.setLearningTime(learningTime);
        progress.setConNum(conNum);
        progress.setMaxS(maxS);
        progress.setLecNum(lecNum);
        progress.setUserNo(userNo);

        // 진행률을 데이터베이스에 저장하는 로직 호출
        progressService.saveVideoProgress(progress);

        return ResponseEntity.ok("Progress saved successfully");
    }
    @GetMapping("/get-previous-learning-time")
    @ResponseBody
    public String getPreviousLearningTime(@RequestParam int userNo,
                                          @RequestParam String conNum) {
        String previousLearningTime = progressService.getPreviousLearningTime(userNo,conNum);
        return "{\"learningTime\": \"" + previousLearningTime + "\"}";
    }



    @GetMapping("content")
    public String content(Model model, HttpServletRequest request,@RequestParam(defaultValue = "1", name = "page") int pageNo){

        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("loggedInUser");

        if (loggedInUser == null) {
            return "redirect:/login";
        }
        model.addAttribute("paging",contentService.paging(pageNo,10));
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
