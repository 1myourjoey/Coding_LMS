package com.sky.lms_web_service.service;


import com.sky.lms_web_service.dto.SugangRegWithDetails;
import com.sky.lms_web_service.dto.Lecture_Info;
import com.sky.lms_web_service.mapper.LectureMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LectureService {
    @Autowired
    private LectureMapper lectureMapper;

    public List<Lecture_Info> lectureList(){
        return lectureMapper.lectureList();
    }
    public void insertLectureInfo(Lecture_Info lectureInfo){
        lectureMapper.insertLectureInfo(lectureInfo);
    }
    public Lecture_Info selectLecture(String lecNum){
        return lectureMapper.selectLecture(lecNum);
    }
    public List<Lecture_Info> searchLecture(String lecName) {
        return lectureMapper.searchLecture(lecName);
    }
    public List<Lecture_Info> lectureSearch(String lecName, String lecEx){
        return lectureMapper.lectureSearch(lecName,lecEx);
    }

    public void deleteLecture(String lecNum){
        lectureMapper.deleteLecture(lecNum);
    }

    public void insertOrUpdateLecture(Lecture_Info lectureInfo){
       Lecture_Info existingContent = lectureMapper.getContentByNum(lectureInfo.getLecNum());

        if (existingContent != null) {
            lectureMapper.updateLectureInfo(lectureInfo);
        }
        else {
            lectureMapper.insertLectureInfo(lectureInfo);
        }
    }

    public List<SugangRegWithDetails> getSugangRegWithDetails() {
        return lectureMapper.getSugangRegWithDetails();
    }

    public List<Lecture_Info> getAllLectures() {
        return lectureMapper.selectAllLectures();
    }

    public List<SugangRegWithDetails> getSugangRegWithDetailsByUserNo(int userNo) {
        return lectureMapper.getSugangRegWithDetailsByUserNo(userNo);
    }



}
