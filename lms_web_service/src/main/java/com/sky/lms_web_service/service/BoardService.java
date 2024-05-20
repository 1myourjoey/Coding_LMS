package com.sky.lms_web_service.service;


import com.sky.lms_web_service.common.FileUtils;
import com.sky.lms_web_service.dto.Board;
import com.sky.lms_web_service.dto.BoardFile;
import com.sky.lms_web_service.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.util.List;

@Service
public class BoardService {

	@Autowired
	private BoardMapper boardMapper;

	@Autowired
	private FileUtils fileUtils;

	public int getTotalCount() {
		// 데이터베이스에서 게시글의 총 개수를 조회하는 로직을 구현합니다.
		return boardMapper.getTotalCount(); // 인자 없이 메서드를 호출합니다.
	}

	public List<Board> selectBoardList(int offset, int itemsPerPage) {
		// BoardMapper를 사용하여 특정 범위의 게시글 목록을 조회합니다.
		return boardMapper.selectBoardList(offset, itemsPerPage);
	}

	public List<Board> selectBoardList() throws Exception {
		return boardMapper.selectBoardList();
	}


	public void insertBoard(Board board, MultipartHttpServletRequest multipartHttpServletRequest) throws Exception {
		boardMapper.insertBoard(board);
		List<BoardFile> list = fileUtils.parseFileInfo(board.getBoardIdx(), multipartHttpServletRequest);
		if (!CollectionUtils.isEmpty(list)) {
			boardMapper.insertBoardFileList(list);
		}
	}

	public Board selectBoardDetail(int boardIdx) throws Exception {
		Board board = boardMapper.selectBoardDetail(boardIdx);
		List<BoardFile> fileList = boardMapper.selectBoardFileList(boardIdx);
		board.setFileList(fileList);

		boardMapper.updateHitCount(boardIdx);

		return board;
	}

	public void updateBoard(Board board) throws Exception {
		boardMapper.updateBoard(board);
	}
	public void deleteBoard(int boardIdx) throws Exception {
		boardMapper.deleteBoard(boardIdx);
	}
	public BoardFile selectBoardFileInformation(int idx, int boardIdx) throws Exception {
		return boardMapper.selectBoardFileInformation(idx, boardIdx);
	}

	public boolean isBoardOwner(int boardIdx, String loggedInMemberId) {
		return false;
	}




}
