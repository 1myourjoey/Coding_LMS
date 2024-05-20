package com.sky.lms_web_service.mapper;


import com.sky.lms_web_service.dto.Board;
import com.sky.lms_web_service.dto.BoardFile;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.util.List;

@Mapper
public interface BoardMapper {

	void insertBoard(Board board) throws Exception;

	Board selectBoardDetail(int boardIdx) throws Exception;

	void updateHitCount(int boardIdx) throws Exception;

	void updateBoard(Board board) throws Exception;

	void deleteBoard(int boardIdx) throws Exception;

	void insertBoardFileList(List<BoardFile> list) throws Exception;

	List<BoardFile> selectBoardFileList(int boardIdx) throws Exception;

	BoardFile selectBoardFileInformation(@Param("idx") int idx, @Param("boardIdx" )int boardIdx);

	List<Board> selectBoardList();

	int getTotalCount();

	List<Board> selectBoardList(int offset, int itemsPerPage);

	void insertBoard(Board board, MultipartHttpServletRequest multipartHttpServletRequest) throws Exception;

	boolean isBoardOwner(int boardIdx, String loggedInMemberId);


}
