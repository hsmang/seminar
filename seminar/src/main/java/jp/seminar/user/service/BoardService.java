package jp.seminar.user.service;

import java.util.List;
import java.util.Map;

import jp.seminar.board.BoardVO;
import jp.seminar.board.ReplyVO;

public interface BoardService {
	
	List<Map<String, Object>> getUserList() throws Exception;
	
	List<Map<String, Object>> getBoardList() throws Exception;
	
	List<Map<String, Object>> getBoardDetail(int board_idx) throws Exception;
	
	int updateBoardDetail(BoardVO board) throws Exception;
	
	int deleteBoardDetail(int board_idx) throws Exception;
	
	int insertBoard(BoardVO board) throws Exception;
	
	int insertReply(ReplyVO reply) throws Exception;

	List<Map<String, Object>> getReply(ReplyVO reply);	
}
