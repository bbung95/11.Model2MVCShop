package com.model2.mvc.service.board.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.board.BoardDao;
import com.model2.mvc.service.board.BoardService;
import com.model2.mvc.service.domain.Board;

@Service("boardServiceImpl")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	@Qualifier("boardDaoImpl")
	private BoardDao boardDao;
	
	public BoardServiceImpl() {
		
		System.out.println(this.getClass());
	}

	public Board getBoard(int boardNo) {
		
		return boardDao.getBoard(boardNo);
	}

	public void addBoard(Board board) {
		
		boardDao.insertBoard(board);
	}

	public Map<String, Object> getlistBoard(Search search) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", boardDao.getlistBoard(search));
		map.put("totalCount", boardDao.getTotalCount(search));
		
		return map;
	}

	public void updateBoard(Board board) {
		
		boardDao.updateBoard(board);
	}

	public void deleteBoard(int boardNo) {
		
		boardDao.deleteBoard(boardNo);
	}

}
