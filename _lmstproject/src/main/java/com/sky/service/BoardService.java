package com.sky.service;

import com.sky.dto.BoardDto;
import com.sky.dto.BoardFileDto;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.util.List;

public interface BoardService {

	int getTotalCount();

	List<BoardDto> selectBoardList(int offset, int itemsPerPage);

	List<BoardDto> selectBoardList() throws Exception;

	void insertBoard(BoardDto board, MultipartHttpServletRequest multipartHttpServletRequest) throws Exception;

	BoardDto selectBoardDetail(int boardIdx) throws Exception;

	void updateBoard(BoardDto board) throws Exception;

	void deleteBoard(int boardIdx) throws Exception;

	BoardFileDto selectBoardFileInformation(int idx, int boardIdx) throws Exception;

	boolean isBoardOwner(int boardIdx, String loggedInMemberId);


}
