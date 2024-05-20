package com.sky.lms_web_service.service;


import com.sky.lms_web_service.dto.User;
import com.sky.lms_web_service.mapper.UserMapper;
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

    public List<User> getAllUser() {
        return userMapper.selectUserList();
    }

    public List<User> getUserListWithPaging(int page, int size) {
        int offset = (page - 1) * size;
        return userMapper.selectUserListWithPaging(offset, size);
    }

    @Transactional
    public void insertUser(User User) {
        // 중복 아이디 체크
        if (isUserIdExist(User.getLoginId())) {
            throw new IllegalArgumentException("이미 존재하는 아이디입니다.");
        }
        // 중복 이메일 체크
        if (isEmailExist(User.getEmail())) {
            throw new IllegalArgumentException("이미 사용 중인 이메일입니다.");
        }
        userMapper.insertUser(User);
    }

    @Transactional
    public void insertAdmin(User User) {
        // 중복 아이디 체크
        if (isUserIdExist(User.getLoginId())) {
            throw new IllegalArgumentException("이미 존재하는 아이디입니다.");
        }
        // 중복 이메일 체크
        if (isEmailExist(User.getEmail())) {
            throw new IllegalArgumentException("이미 사용 중인 이메일입니다.");
        }
        userMapper.insertAdmin(User);
    }

    @Transactional
    public void updateUser(User User) {
        // 중복 아이디 체크
        if (!User.getLoginId().equals(User.getLoginId()) && isUserIdExist(User.getLoginId())) {
            throw new IllegalArgumentException("이미 존재하는 아이디입니다.");
        }
        // 중복 이메일 체크
        if (!User.getEmail().equals(User.getEmail()) && isEmailExist(User.getEmail())) {
            throw new IllegalArgumentException("이미 사용 중인 이메일입니다.");
        }
        userMapper.updateUser(User);
    }

    @Transactional
    public void deleteUser(String loginId) {
        userMapper.deleteUser(loginId);
    }

    public User getUserById(String loginId) {
        return userMapper.getUserById(loginId);
    }

    public boolean isUserIdExist(String loginId) {
        User existingMember = userMapper.getUserById(loginId);
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
        User existingMember = userMapper.getUserByEmail(email);
        return existingMember != null;
    }
}
