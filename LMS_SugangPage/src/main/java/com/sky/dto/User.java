package com.sky.dto;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Setter
@Builder
public class User {

    private int userNo;
    private String loginId;
    private String userName;
    private String pw;
    private String adminYn;
    private String email;

    public int getUserNo() {
        return userNo;
    }
}
