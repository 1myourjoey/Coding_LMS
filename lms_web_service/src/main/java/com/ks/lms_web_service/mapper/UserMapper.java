package com.ks.lms_web_service.mapper;

import com.sky.dto.UserDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserMapper {
    List<UserDto> selectUserList();
    
    int selectCount();
    
    void insertUser(UserDto user);

    void insertAdmin(UserDto user);

    void updateUser(UserDto user);

    void updateUser1(UserDto user);

    void deleteUser(String loginId);
    
    UserDto getUserById(String loginId); // 반환 형식을 MemberDto로 변경

    void passwordupdateUser(String loginId, String newPassword);

    void updateUserRole(String loginId, String adminYn);

    UserDto getUserByEmail(String email);

    List<UserDto> selectUserListWithPaging(int offset, int size);
}
