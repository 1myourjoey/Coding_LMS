<<<<<<<< HEAD:lms_web_service/src/main/java/com/sky/lms_web_service/controller/PostController.java
package com.sky.lms_web_service.controller;



import com.sky.lms_web_service.dto.Post;
import com.sky.lms_web_service.dto.User;
import com.sky.lms_web_service.service.PostService;
========
package com.sky.controller;


import com.sky.dto.PostDto;
import com.sky.dto.UserDto;
import com.sky.service.PostService;
import org.apache.catalina.User;
>>>>>>>> main:project/src/main/java/com/sky/controller/PostController.java
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class PostController {
    @Autowired
    PostService postService;


    @GetMapping("/post")
    public String po(Model model, HttpSession session) {
        // 세션에서 사용자 정보를 가져온다고 가정
        Object user = session.getAttribute("loggedInUser");

        // 세션에 사용자 정보가 없다면 로그인 페이지로 리다이렉트
        if (user == null) {
            return "redirect:/login"; // 로그인 페이지의 URL로 변경
        }

        // 세션에 사용자 정보가 있을 경우에만 포스트 페이지로 이동
        List<Post> plist = postService.postilsts();
        model.addAttribute("plist", plist);
        return "post";
    }


    //상세내용
    @GetMapping("/postlist")
    public String showPost(@RequestParam("postNum") int postNum, Model model) {
        List<Post> post = postService.getPostByNum(postNum);
        postService.uphit(postNum);
        model.addAttribute("post", post);
        return "postlist";
    }


    //삭제
    @GetMapping("/deletePost")
    public String deletePost(@RequestParam("postNum") int postNum) {
        postService.deletePost(postNum);
        return "redirect:/post";
    }

    //등록하는 페이지
    @GetMapping("/postinsert")
    public String inpo() {
        return "postinsert";
    }



    @PostMapping("/insert")
    public String insertPost(Post Post, HttpSession session) {

        User User = (User) session.getAttribute("loggedInUser");

        int userNo = User.getUserNo();

        Post.setUserNo(userNo);

        postService.insertPost(Post);

        return "redirect:/post";
    }


//    수정
    @PostMapping("/updatePost")
    public String updatePost(@RequestParam("postNum") int postNum, @ModelAttribute("Post") Post post) {
        // 업데이트할 게시물의 postNum을 설정
        post.setPostNum(postNum);

        // 게시물 업데이트
        postService.updatePost(post);

        return "redirect:/post";
    }
}

