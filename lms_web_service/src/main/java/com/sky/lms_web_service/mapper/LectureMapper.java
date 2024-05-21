package com.sky.lms_web_service.mapper;


import com.sky.lms_web_service.dto.SugangRegWithDetails;
import com.sky.lms_web_service.dto.Contents_Manage;
import com.sky.lms_web_service.dto.Lecture_Info;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface LectureMapper {
    List<Lecture_Info> lectureList();
    void insertLectureInfo(Lecture_Info lectureInfo);
    void updateLectureInfo(Lecture_Info lectureInfo);
    Lecture_Info selectLecture(String lecNum);
    Lecture_Info getContentByNum(String lecNum);
    List<Lecture_Info> searchLecture(@Param("lecName") String lecName);
    List<Lecture_Info> lectureSearch(@Param("lecName") String lecName,@Param("lecEx") String lecEx);

    void deleteLecture(String lecNum);

    List<Contents_Manage> getContentsByLecNum(String lecNum);
    List<SugangRegWithDetails> getSugangRegWithDetails();

    List<SugangRegWithDetails> getSugangRegWithDetailsByUserNo(int userNo);

    List<Lecture_Info> selectAllLectures();

}
