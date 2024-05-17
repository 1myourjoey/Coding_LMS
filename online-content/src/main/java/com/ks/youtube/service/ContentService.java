package com.ks.youtube.service;



import com.ks.youtube.entity.contents_manage;
import com.ks.youtube.mapper.ContentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class ContentService {

    @Autowired
    private ContentMapper contentMapper;

    public int selectCount(){
        return contentMapper.selectCount();
    }
    public List<contents_manage> formatTime(){
        return contentMapper.formatTime();
    }
    public List<contents_manage> selectAll(){
        return contentMapper.selectList();
    }
    public void insertContent(contents_manage contentsManage){
        contentMapper.insertContent(contentsManage);
    }
    public void updateContent(contents_manage contentsManage){
        contentMapper.updateContent(contentsManage);
    }
    public void deleteContent(String conNum){
        contentMapper.deleteContent(conNum);
    }

    @Transactional
    public void insertOrUpdateContent(contents_manage contentsManage) {
        // 콘텐츠 관리번호로 데이터 조회
        contents_manage existingContent = contentMapper.getContentByNum(contentsManage.getConNum());

        if (existingContent != null) {
            // 데이터가 있으면 update 수행
            contentMapper.updateContent(contentsManage);
        } else {
            // 데이터가 없으면 insert 수행
            contentMapper.insertContent(contentsManage);
        }
    }

    public contents_manage selectContent(String conNum){
        return contentMapper.selectContent(conNum);
    }
    public List<contents_manage> selectSearch(String conName, String lecName) {
        return contentMapper.selectSearch(conName, lecName);
    }



}
