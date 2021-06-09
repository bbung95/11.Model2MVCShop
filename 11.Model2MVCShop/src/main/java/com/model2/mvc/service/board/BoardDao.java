package com.model2.mvc.service.board;

import java.util.List;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Board;

public interface BoardDao {
	
	public Board getBoard(int boardNo);
	
	public void insertBoard(Board board);
	
	public List<Board> getlistBoard(Search search);
	
	public void updateBoard(Board board);
	
	public void deleteBoard(int boardNo);
	
	public int getTotalCount(Search search) throws Exception ;

}
