package com.sky.lms_web_service.controller;

import com.sky.lms_web_service.dto.Lecture_Info;
import com.sky.lms_web_service.dto.Section_Progress;
import com.sky.lms_web_service.service.LectureService;
import com.sky.lms_web_service.service.ProgressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
public class ProgressContoller {
    @Autowired
    private ProgressService progressService;


    @PostMapping("/saveVideoProgress")
    @ResponseBody
    public String saveVideoProgress(@RequestBody Section_Progress sectionProgress) {
        try {
            progressService.saveVideoProgress(sectionProgress);
            return "Progress saved successfully";
        } catch (Exception e) {
            e.printStackTrace();
            return "Error occurred while saving progress";
        }
    }

    @GetMapping("/get/{conNum}")
    @ResponseBody
    public Map<String, Object> getVideoProgress(@PathVariable String conNum) {
        return progressService.getVideoProgress(conNum);
    }

}
