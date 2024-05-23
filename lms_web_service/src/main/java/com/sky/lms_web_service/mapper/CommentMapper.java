package com.sky.lms_web_service.mapper;

import com.sky.lms_web_service.dto.Comment;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CommentMapper {
    List<Comment>selectParentComments(int qNum);



    int insertComment(Comment Comment);

    int updateComment(@Param("commentNum") int commentNum, @Param("commentContents") String commentContents);

    int deleteComment(int commentNum);

    List<Comment>selectReplies(int commentNum);


    int addReply(@Param("qNum") int qNum, @Param("pCommentNum") int pCommentNum, @Param("commentContents") String commentContents,@Param("userNo") int userNo);


}
