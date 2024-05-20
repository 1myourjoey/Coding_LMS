package com.sky.lms_web_service.service;

import com.sky.lms_web_service.dto.Comment;
import com.sky.lms_web_service.mapper.CommentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {
    @Autowired
    CommentMapper commentMapper;

    // 부모 댓글 조회
    public List<Comment> getParentComments(int qNum) {

        return commentMapper.selectParentComments(qNum);
    }

    // 대댓글 조회
    public List<Comment> getReplies(int pCommentNum) {
        return commentMapper.selectReplies(pCommentNum);
    }

    // 댓글 추가
    public int addComment(Comment comment) {
        return commentMapper.insertComment(comment);
    }

    // 댓글 수정
    public int updateComment(int commentNum, String commentContents ) {
        return commentMapper.updateComment(commentNum,commentContents);
    }

    // 댓글 삭제
    public int deleteComment(int commentNum) {
        return commentMapper.deleteComment(commentNum);
    }
}
