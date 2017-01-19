package jp.seminar.board.service;

import java.util.List;
import java.util.Map;

import jp.seminar.board.vo.BoardVO;
import jp.seminar.board.vo.BoardImageVO;
import jp.seminar.board.vo.ReplyVO;

public interface BoardService {
	
	List<Map<String, Object>> getUserList() throws Exception;
	
	List<Map<String, Object>> getBoardList() throws Exception;
	
	List<Map<String, Object>> getBoardDetail(int board_idx) throws Exception;
	
	int updateBoardCount(BoardVO board) throws Exception;
	
	int updateBoardDetail(BoardVO board) throws Exception;
	
	int deleteBoardDetail(int board_idx) throws Exception;
	
	int insertBoard(BoardVO board) throws Exception;
	
	int insertReply(ReplyVO reply) throws Exception;

	List<Map<String, Object>> getReply(ReplyVO reply);	
	
	int insertBoardImage(BoardImageVO image) throws Exception;
}
