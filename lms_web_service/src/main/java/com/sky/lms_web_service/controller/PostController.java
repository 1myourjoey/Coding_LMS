package com.sky.lms_web_service.controller;



import com.sky.lms_web_service.dto.Post;
import com.sky.lms_web_service.dto.User;
import com.sky.lms_web_service.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class PostController {
    @Autowired
    PostService postService;


    @GetMapping("/post")
    public String po(Model model, HttpSession session, @RequestParam(defaultValue = "1") int page,
                     @RequestParam(defaultValue = "10") int size) {
        // 세션에서 사용자 정보를 가져온다고 가정
        Object user = session.getAttribute("loggedInUser");

        // 세션에 사용자 정보가 없다면 로그인 페이지로 리다이렉트
        if (user == null) {
            return "redirect:/login"; // 로그인 페이지의 URL로 변경
        }

        // 한 페이지에 보여줄 포스트 수 설정
        int itemsPerPage = size;

        // 총 포스트 수 가져오기
        int totalPosts = postService.getTotalPages();

        // 총 페이지 수 계산
        int totalPages = (int) Math.ceil((double) totalPosts / itemsPerPage);

        // 현재 페이지가 1보다 작으면 1로 설정
        if (page < 1) {
            page = 1;
        }
        // 현재 페이지가 마지막 페이지를 초과하면 마지막 페이지로 설정
        else if (page > totalPages) {
            page = totalPages;
        }

        // 현재 페이지의 시작 인덱스 계산
        int offset = (page - 1) * itemsPerPage;
        offset = Math.max(0, offset); // 음수 값이 되지 않도록 보정

        // 현재 페이지의 포스트 목록 가져오기
        List<Post> plist = postService.getPaginatedPostList(offset, itemsPerPage);

        // 현재 페이지의 시작 및 끝 페이지 번호 계산
        int maxVisiblePages = 10; // 한 번에 보여줄 페이지 수
        int numPagesBeforeCurrent = 5; // 현재 페이지 앞에 보여줄 페이지 수

        int startPage = Math.max(1, page - numPagesBeforeCurrent);
        int endPage = Math.min(startPage + maxVisiblePages - 1, totalPages);

        model.addAttribute("plist", plist);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
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

