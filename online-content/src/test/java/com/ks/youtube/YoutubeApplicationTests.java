package com.ks.youtube;


import com.ks.youtube.service.ContentService;
import com.ks.youtube.service.LectureService;
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
