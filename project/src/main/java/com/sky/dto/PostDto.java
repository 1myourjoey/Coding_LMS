package com.sky.dto;



import lombok.*;

import java.sql.Timestamp;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString

public class PostDto {
    private int postNum;

    private int userNo;

    private String postTitle;

    private String postContents;

    private Timestamp postCreated;

    private int hitCnt;



}
