package com.sky.lms_web_service.dto;


import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Setter
@Builder
public class User {
	private Integer userNo;
	private String loginId;
	private String userName;
	private String pw;
	private String adminYn;
	private String email;


}
