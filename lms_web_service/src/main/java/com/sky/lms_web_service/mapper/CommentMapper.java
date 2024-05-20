package com.sky.lms_web_service.mapper;

import com.sky.lms_web_service.dto.Comment;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CommentMapper {
    List<Comment>selectParentComments(int qNum);

    List<Comment>selectReplies(int pCommentNum);

    int insertComment(Comment Comment);

    int updateComment(@Param("commentNum") int commentNum, @Param("commentContents") String commentContents);

    int deleteComment(int commentNum);
}
