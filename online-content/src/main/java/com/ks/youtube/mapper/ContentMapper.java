package com.ks.youtube.mapper;




import com.ks.youtube.entity.contents_manage;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


@Mapper
public interface ContentMapper {
    int selectCount();
    List<contents_manage> selectList();
    List<contents_manage> formatTime();
    contents_manage getContentByNum(String conNum);
    void insertContent(contents_manage contentsManage);
    void updateContent(contents_manage contentsManage);
    void deleteContent(String conNum);
    contents_manage selectContent(String conNum);
    List<contents_manage> selectSearch(@Param("conName") String conName, @Param("lecName") String lecName);
}
