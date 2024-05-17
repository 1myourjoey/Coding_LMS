package com.sky.mapper;

import java.util.List;


import com.sky.dto.CommentDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface CommentMapper {
    List<CommentDTO>selectParentComments(int qNum);

    List<CommentDTO>selectReplies(int pCommentNum);

    int insertComment(CommentDTO commentDTO);

    int updateComment(@Param("commentNum") int commentNum, @Param("commentContents") String commentContents);

    int deleteComment(int commentNum);
}
