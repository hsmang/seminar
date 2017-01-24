package jp.seminar.board.dao;

import java.util.List;
import java.util.Map;

import jp.seminar.board.vo.BoardImageVO;
import jp.seminar.board.vo.BoardVO;
import jp.seminar.board.vo.ReplyVO;
import jp.seminar.paging.FirstRowPageSize;

public interface BoardDAO {
	
	public List<Map<String, Object>> selectList(FirstRowPageSize  firstRowpageSize);
	
	public List<Map<String, Object>> selectDeatil(int board_idx);
	
	public int insertDetail(BoardVO board);
	
	public int updateDetail(BoardVO board);
	
	public int deleteDetail(int board_idx);
	
	public List<Map<String, Object>> selectUserList();
	
	public int insertReply(ReplyVO reply);
	
	public List<Map<String, Object>> getReply(ReplyVO reply);
	
	public int updateBoardCount(BoardVO board);
	
	public int insertBoardImage(BoardImageVO image);
	
	int getTotalCount();
	
}

