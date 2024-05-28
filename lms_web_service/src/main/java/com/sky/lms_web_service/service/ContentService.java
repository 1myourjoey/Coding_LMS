package com.sky.lms_web_service.service;



import com.sky.lms_web_service.dto.Contents_Manage;
import com.sky.lms_web_service.dto.Pagination;
import com.sky.lms_web_service.dto.Section_Progress;
import com.sky.lms_web_service.mapper.ContentMapper;
import com.sky.lms_web_service.mapper.LectureMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


@Service
public class ContentService {

    private static final int listSize = 3;
    private static final int paginationSize = 3;

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

    public List<Contents_Manage> getContentsByLectureName(String lecName) {
        return contentMapper.selectContentsByLectureName(lecName);
    }


    public Integer getPreviousConNum(int lecNum, int conNum) {
        return contentMapper.getPreviousConNum(lecNum, conNum);
    }


    public Integer getNextConNum(int lecNum, int conNum) {
        return contentMapper.getNextConNum(lecNum, conNum);
    }

    public ArrayList<Pagination> getPagination(int pageNo) {
        ArrayList<Pagination> pgnList = new ArrayList<>();
        int numRecords = contentMapper.selectCount();
        int numPages = (int)Math.ceil((double)numRecords / listSize);

        int firstLink = ((pageNo - 1) / paginationSize) * paginationSize + 1;
        int lastLink = firstLink + paginationSize - 1;
        if (lastLink > numPages) {
            lastLink = numPages;
        }

        if (firstLink > 1) {
            pgnList.add(new Pagination("이전", pageNo - paginationSize, false));
        }

        for (int i = firstLink; i <= lastLink; i++) {
            pgnList.add(new Pagination("" + i, i, i == pageNo));
        }

        if (lastLink < numPages) {
            int tmpPageNo = pageNo + paginationSize;
            if (tmpPageNo > numPages) {
                tmpPageNo = numPages;
            }
            pgnList.add(new Pagination("다음", tmpPageNo, false));
        }

        return pgnList;
    }

    public ArrayList<Contents_Manage> getMsgList(int pageNo) {
        return (ArrayList<Contents_Manage>) contentMapper.selectList((pageNo - 1) * listSize, listSize);
    }
    public List<Contents_Manage> paging(int start, int listSize) {
        return contentMapper.paging((start - 1) * listSize, listSize);
    }


}
