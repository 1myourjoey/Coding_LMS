package com.sky.lms_web_service.mapper;




import com.sky.lms_web_service.dto.Contents_Manage;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;


@Mapper
public interface ContentMapper {
    int selectCount();
    List<Contents_Manage> selectList();
    List<Contents_Manage> formatTime();
    Contents_Manage getContentByNum(String conNum);
    void insertContent(Contents_Manage contentsManage);
    void updateContent(Contents_Manage contentsManage);
    void deleteContent(String conNum);
    Contents_Manage selectContent(String conNum);
    List<Contents_Manage> selectSearch(@Param("conName") String conName, @Param("lecName") String lecName);
    List<Contents_Manage> findAllVideos();
    List<Contents_Manage> selectContentsByLectureName(String lecName);


    List<Contents_Manage> selectList(int start, int listSize);
    List<Contents_Manage> paging(int start, int listSize);
    Integer getNextConNum(@Param("lecNum") int lecNum, @Param("conNum") int conNum);
    Integer getPreviousConNum(@Param("lecNum") int lecNum, @Param("conNum") int conNum);






}
