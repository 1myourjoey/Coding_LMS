<<<<<<<< HEAD:lms_web_service/src/main/java/com/sky/lms_web_service/mapper/CommentMapper.java
package com.sky.lms_web_service.mapper;
========
package com.sky.mapper;

import java.util.List;

>>>>>>>> main:project/src/main/java/com/sky/mapper/CommentMapper.java

import com.sky.lms_web_service.dto.Comment;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface CommentMapper {
    List<Comment>selectParentComments(int qNum);

    List<Comment>selectReplies(int pCommentNum);

    int insertComment(Comment Comment);

    int updateComment(@Param("commentNum") int commentNum, @Param("commentContents") String commentContents);

    int deleteComment(int commentNum);
}
