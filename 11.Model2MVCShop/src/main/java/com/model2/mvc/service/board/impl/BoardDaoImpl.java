package com.model2.mvc.service.board.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.board.BoardDao;
import com.model2.mvc.service.domain.Board;

@Repository("boardDaoImpl")
public class BoardDaoImpl implements BoardDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public BoardDaoImpl() {
		System.out.println(this.getClass());
	}

	public Board getBoard(int boardNo) {
		
		return sqlSession.selectOne("BoardMapper.getBoard",boardNo);
	}

	public void insertBoard(Board board) {
		
		sqlSession.selectOne("BoardMapper.addBoard",board);
	}

	public List<Board> getlistBoard(Search search) {

		return sqlSession.selectList("BoardMapper.getBoardList",search);
	}

	public void updateBoard(Board board) {
		
		sqlSession.selectOne("BoardMapper.updateBoard",board);
	}

	public void deleteBoard(int boardNo) {
		
		sqlSession.selectOne("BoardMapper.deleteBoard",boardNo);
	}
	
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("BoardMapper.getTotalCount", search);
	}
}
