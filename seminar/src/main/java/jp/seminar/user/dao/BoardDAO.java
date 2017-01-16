package jp.seminar.user.dao;

import java.util.List;
import java.util.Map;

import jp.seminar.board.BoardVO;
import jp.seminar.board.ReplyVO;

public interface BoardDAO {
	
	public List<Map<String, Object>> selectList();
	
	public List<Map<String, Object>> selectDeatil(int board_idx);
	
	public int insertDetail(BoardVO board);
	
	public int updateDetail(BoardVO board);
	
	public int deleteDetail(int board_idx);
	
	public List<Map<String, Object>> selectUserList();
	
	public int insertReply(ReplyVO reply);
	
	public List<Map<String, Object>> getReply(ReplyVO reply);
}
