package com.sky.dto;

import lombok.*;

import java.sql.Timestamp;
import java.util.List;

@Setter
@Getter
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class CommentDTO {
    private int commentNum;

    private int qNum;

    private Integer pCommentNum; // Integer 타입으로 null을 허용

    private int userNo;

    private String commentContents;

    private Timestamp commentCreated;


    private List<CommentDTO> repliesList;




}
