package jp.seminar.board.service;

import java.util.List;
import java.util.Map;

import jp.seminar.board.vo.BoardImageVO;
import jp.seminar.board.vo.BoardVO;
import jp.seminar.board.vo.Board_UserVO;
import jp.seminar.board.vo.FileVO;
import jp.seminar.board.vo.ReplyVO;
import jp.seminar.paging.FirstRowPageSize;

public interface BoardService {
	
	List<Board_UserVO> getUserList() throws Exception;
	
	List<BoardVO> getBoardList(FirstRowPageSize  firstRowpageSize) throws Exception;
	
	BoardVO getBoardDetail(int board_idx) throws Exception;
	
	int updateBoardCount(int board_idx) throws Exception;
	
	int updateBoardDetail(BoardVO board) throws Exception;
	
	int deleteBoardDetail(int board_idx) throws Exception;
	
	int insertBoard(BoardVO board) throws Exception;
	
	int insertReply(ReplyVO reply) throws Exception;

	int insertBoardImage(BoardImageVO image) throws Exception;
	
	int getTotalCount();

	Board_UserVO getCertainUser(int user_idx);

	List<ReplyVO> getReply(ReplyVO reply);

	int insertFile(FileVO fileinfo);
	int insertFile(FileVO fileinfo, String board_idx);

	List<FileVO> getFileList(int board_idx);

	int deleteFileinfo(FileVO fileinfo);

	List<BoardVO> getBoardSearchList(FirstRowPageSize  firstRowpageSize);

	int getSearchCount(String search_type, String search_value);
	
}
