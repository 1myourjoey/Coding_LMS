package com.sky.lms_web_service.mapper;

import com.sky.lms_web_service.dto.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserMapper {
    List<User> selectUserList();
    
    int selectCount();
    
    void insertUser(User user);

    void insertAdmin(User user);

    void updateUser(User user);

    void updateUser1(User user);

    void deleteUser(String loginId);

    User getUserById(String loginId); // 반환 형식을 MemberDto로 변경

    void passwordupdateUser(String loginId, String newPassword);

    void updateUserRole(String loginId, String adminYn);

    User getUserByEmail(String email);

    List<User> selectUserListWithPaging(int offset, int size);
}
