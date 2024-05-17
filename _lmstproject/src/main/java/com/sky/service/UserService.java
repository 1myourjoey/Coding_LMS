package com.sky.service;

import com.sky.dto.UserDto;
import com.sky.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    public int getUserCount() {
        return userMapper.selectCount();
    }

    public List<UserDto> getAllUser() {
        return userMapper.selectUserList();
    }

    public List<UserDto> getUserListWithPaging(int page, int size) {
        int offset = (page - 1) * size;
        return userMapper.selectUserListWithPaging(offset, size);
    }

    @Transactional
    public void insertUser(UserDto userDto) {
        // 중복 아이디 체크
        if (isUserIdExist(userDto.getLoginId())) {
            throw new IllegalArgumentException("이미 존재하는 아이디입니다.");
        }
        // 중복 이메일 체크
        if (isEmailExist(userDto.getEmail())) {
            throw new IllegalArgumentException("이미 사용 중인 이메일입니다.");
        }
        userMapper.insertUser(userDto);
    }

    @Transactional
    public void insertAdmin(UserDto userDto) {
        // 중복 아이디 체크
        if (isUserIdExist(userDto.getLoginId())) {
            throw new IllegalArgumentException("이미 존재하는 아이디입니다.");
        }
        // 중복 이메일 체크
        if (isEmailExist(userDto.getEmail())) {
            throw new IllegalArgumentException("이미 사용 중인 이메일입니다.");
        }
        userMapper.insertAdmin(userDto);
    }

    @Transactional
    public void updateUser(UserDto userDto) {
        // 중복 아이디 체크
        if (!userDto.getLoginId().equals(userDto.getLoginId()) && isUserIdExist(userDto.getLoginId())) {
            throw new IllegalArgumentException("이미 존재하는 아이디입니다.");
        }
        // 중복 이메일 체크
        if (!userDto.getEmail().equals(userDto.getEmail()) && isEmailExist(userDto.getEmail())) {
            throw new IllegalArgumentException("이미 사용 중인 이메일입니다.");
        }
        userMapper.updateUser(userDto);
    }

    @Transactional
    public void deleteUser(String loginId) {
        userMapper.deleteUser(loginId);
    }

    public UserDto getUserById(String loginId) {
        return userMapper.getUserById(loginId);
    }

    public boolean isUserIdExist(String loginId) {
        UserDto existingMember = userMapper.getUserById(loginId);
        return existingMember != null;
    }

    @Transactional
    public void updatePassword(String loginId, String newPassword) {
        userMapper.passwordupdateUser(loginId, newPassword);
    }

    @Transactional
    public void updateUserRole(String loginId, String adminYn) {
        userMapper.updateUserRole(loginId, adminYn);
    }

    public boolean isEmailExist(String email) {
        UserDto existingMember = userMapper.getUserByEmail(email);
        return existingMember != null;
    }
}
