package com.ks.lms_web_service.service;



import com.ks.lms_web_service.dto.Contents_Manage;
import com.ks.lms_web_service.mapper.ContentMapper;
import com.ks.lms_web_service.mapper.LectureMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class ContentService {

    @Autowired
    private ContentMapper contentMapper;

    @Autowired
    private LectureMapper lectureMapper;

    public int selectCount(){
        return contentMapper.selectCount();
    }
    public List<Contents_Manage> formatTime(){
        return contentMapper.formatTime();
    }
    public List<Contents_Manage> selectAll(){
        return contentMapper.selectList();
    }
    public void insertContent(Contents_Manage contentsManage){
        contentMapper.insertContent(contentsManage);
    }
    public void updateContent(Contents_Manage contentsManage){
        contentMapper.updateContent(contentsManage);
    }
    public void deleteContent(String conNum){
        contentMapper.deleteContent(conNum);
    }


    public void insertOrUpdateContent(Contents_Manage contentsManage) {
        // 콘텐츠 관리번호로 데이터 조회
        Contents_Manage existingContent = contentMapper.getContentByNum(contentsManage.getConNum());

        if (existingContent != null) {
            // 데이터가 있으면 update 수행
            contentMapper.updateContent(contentsManage);
        } else {
            // 데이터가 없으면 insert 수행
            contentMapper.insertContent(contentsManage);
        }
    }

    public Contents_Manage selectContent(String conNum){
        return contentMapper.selectContent(conNum);
    }
    public List<Contents_Manage> selectSearch(String conName, String lecName) {
        return contentMapper.selectSearch(conName, lecName);
    }

    public List<Contents_Manage> getContentsByLecNum(String lecNum) {
        return lectureMapper.getContentsByLecNum(lecNum);
    }

}
