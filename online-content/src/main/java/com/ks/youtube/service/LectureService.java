package com.ks.youtube.service;


import com.ks.youtube.entity.contents_manage;
import com.ks.youtube.entity.lecture_info;
import com.ks.youtube.mapper.LectureMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class LectureService {
    @Autowired
    private LectureMapper lectureMapper;

    public List<lecture_info> lectureList(){
        return lectureMapper.lectureList();
    }
    public void insertLectureInfo(lecture_info lectureInfo){
        lectureMapper.insertLectureInfo(lectureInfo);
    }
    public lecture_info selectLecture(String lecNum){
        return lectureMapper.selectLecture(lecNum);
    }
    public List<lecture_info> searchLecture(String lecName) {
        return lectureMapper.searchLecture(lecName);
    }



    public void insertOrUpdateLecture(lecture_info lectureInfo){
       lecture_info existingContent = lectureMapper.getContentByNum(lectureInfo.getLecNum());

        if (existingContent != null) {
            lectureMapper.updateLectureInfo(lectureInfo);
        }
        else {
            lectureMapper.insertLectureInfo(lectureInfo);
        }
    }



}
