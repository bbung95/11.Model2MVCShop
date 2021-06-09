package com.model2.mvc.service.board;

import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Board;

public interface BoardService {
	
	public Board getBoard(int boardNo);
	
	public void addBoard(Board board);
	
	public Map<String, Object> getlistBoard(Search search) throws Exception;
	
	public void updateBoard(Board board);
	
	public void deleteBoard(int boardNo);
	
}
