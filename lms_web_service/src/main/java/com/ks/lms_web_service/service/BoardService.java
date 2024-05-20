package com.ks.lms_web_service.service;

import com.sky.common.FileUtils;
import com.sky.dto.BoardDto;
import com.sky.dto.BoardFileDto;
import com.sky.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.util.List;

@Service
public class BoardService implements BoardService {

	@Autowired
	private BoardMapper boardMapper;

	@Autowired
	private FileUtils fileUtils;



	@Override
	public int getTotalCount() {
		// 데이터베이스에서 게시글의 총 개수를 조회하는 로직을 구현합니다.
		return boardMapper.getTotalCount(); // 인자 없이 메서드를 호출합니다.
	}

	@Override
	public List<BoardDto> selectBoardList(int offset, int itemsPerPage) {
		// BoardMapper를 사용하여 특정 범위의 게시글 목록을 조회합니다.
		return boardMapper.selectBoardList(offset, itemsPerPage);
	}

	@Override
	public List<BoardDto> selectBoardList() throws Exception {
		return boardMapper.selectBoardList();
	}

	@Override
	public void insertBoard(BoardDto board, MultipartHttpServletRequest multipartHttpServletRequest) throws Exception {
		boardMapper.insertBoard(board);
		List<BoardFileDto> list = fileUtils.parseFileInfo(board.getBoardIdx(), multipartHttpServletRequest);
		if (!CollectionUtils.isEmpty(list)) {
			boardMapper.insertBoardFileList(list);
		}
	}

	@Override
	public BoardDto selectBoardDetail(int boardIdx) throws Exception {
		BoardDto board = boardMapper.selectBoardDetail(boardIdx);
		List<BoardFileDto> fileList = boardMapper.selectBoardFileList(boardIdx);
		board.setFileList(fileList);

		boardMapper.updateHitCount(boardIdx);

		return board;
	}

	@Override
	public void updateBoard(BoardDto board) throws Exception {
		boardMapper.updateBoard(board);
	}

	@Override
	public void deleteBoard(int boardIdx) throws Exception {
		boardMapper.deleteBoard(boardIdx);
	}

	@Override
	public BoardFileDto selectBoardFileInformation(int idx, int boardIdx) throws Exception {
		return boardMapper.selectBoardFileInformation(idx, boardIdx);
	}

	@Override
	public boolean isBoardOwner(int boardIdx, String loggedInMemberId) {
		return false;
	}




}
