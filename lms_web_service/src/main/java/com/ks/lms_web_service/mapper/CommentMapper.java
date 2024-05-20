package com.ks.lms_web_service.mapper;

import com.sky.dto.CommentDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CommentMapper {
    List<CommentDTO>selectParentComments(int qNum);

    List<CommentDTO>selectReplies(int pCommentNum);

    int insertComment(CommentDTO commentDTO);

    int updateComment(@Param("commentNum") int commentNum, @Param("commentContents") String commentContents);

    int deleteComment(int commentNum);
}
