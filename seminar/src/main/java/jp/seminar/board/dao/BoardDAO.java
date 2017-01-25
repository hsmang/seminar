package jp.seminar.board.dao;

import java.util.List;
import java.util.Map;

import jp.seminar.board.vo.BoardImageVO;
import jp.seminar.board.vo.BoardVO;
import jp.seminar.board.vo.Board_UserVO;
import jp.seminar.board.vo.ReplyVO;
import jp.seminar.paging.FirstRowPageSize;

public interface BoardDAO {
	
	public List<BoardVO> selectList(FirstRowPageSize  firstRowpageSize);
	
	public BoardVO selectDeatil(int board_idx);
	
	public int insertDetail(BoardVO board);
	
	public int updateDetail(BoardVO board);
	
	public int deleteDetail(int board_idx);
	
	public List<Board_UserVO> selectUserList();
	
	public int insertReply(ReplyVO reply);
	
	public List<ReplyVO> getReply(ReplyVO reply);
	
	public int updateBoardCount(BoardVO board);
	
	public int insertBoardImage(BoardImageVO image);
	
	int getTotalCount();
	
	Board_UserVO getCertainUser(int user_idx);

	
}

