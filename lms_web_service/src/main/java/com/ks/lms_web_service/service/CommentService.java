package com.ks.lms_web_service.service;

import com.sky.dto.CommentDTO;
import com.sky.mapper.CommentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {
    @Autowired
    CommentMapper commentMapper;

    // 부모 댓글 조회
    public List<CommentDTO> getParentComments(int qNum) {

        return commentMapper.selectParentComments(qNum);
    }

    // 대댓글 조회
    public List<CommentDTO> getReplies(int pCommentNum) {
        return commentMapper.selectReplies(pCommentNum);
    }

    // 댓글 추가
    public int addComment(CommentDTO commentDTO) {
        return commentMapper.insertComment(commentDTO);
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
