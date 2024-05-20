package com.sky.lms_web_service;


import com.sky.lms_web_service.service.ContentService;
import com.sky.lms_web_service.service.LectureService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class YoutubeApplicationTests {

    @Autowired
    private ContentService contentService;

    @Autowired
    private LectureService lectureService;


    @Test
    void contextLoads() {
        lectureService.lectureList();
    }


}
