package jp.seminar.main.service;

import java.util.List;
import java.util.Map;

import jp.seminar.board.vo.BoardImageVO;
import jp.seminar.board.vo.BoardVO;
import jp.seminar.board.vo.Board_UserVO;
import jp.seminar.board.vo.FileVO;
import jp.seminar.board.vo.ReplyVO;
import jp.seminar.paging.FirstRowPageSize;

public interface BoardService {
	
	public List selectList(FirstRowPageSize  firstRowpageSize);
}
