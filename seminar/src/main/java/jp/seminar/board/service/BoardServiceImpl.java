package jp.seminar.board.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import jp.seminar.board.dao.BasicSeminarDAOImpl;
import jp.seminar.board.vo.BoardVO;
import jp.seminar.board.vo.BoardImageVO;
import jp.seminar.board.vo.ReplyVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Resource(name="boardDao")
	private BasicSeminarDAOImpl boardDAO;
	
	@Override
	public List<Map<String, Object>> getUserList() throws Exception {
		return boardDAO.selectUserList();
	}
	
	@Override
	public List<Map<String, Object>> getBoardList() throws Exception{
		return boardDAO.selectList();
	}

	@Override
	public List<Map<String, Object>> getBoardDetail(int board_idx) throws Exception {
		return boardDAO.selectDeatil(board_idx);
	}

	@Override
	public int insertBoard(BoardVO board) throws Exception {
		return boardDAO.insertDetail(board);
	}

	@Override
	public int updateBoardDetail(BoardVO board) throws Exception {
		return boardDAO.updateDetail(board);
	}

	@Override
	public int deleteBoardDetail(int board_idx) throws Exception {
		return boardDAO.deleteDetail(board_idx);
	}

	@Override
	public int insertReply(ReplyVO reply) throws Exception {
		return boardDAO.insertReply(reply);
	}

	@Override
	public List<Map<String, Object>> getReply(ReplyVO reply) {
		return boardDAO.getReply(reply);
	}

	@Override
	public int updateBoardCount(BoardVO board) throws Exception {
		return boardDAO.updateBoardCount(board);
	}

	@Override
	public int insertBoardImage(BoardImageVO image) throws Exception {
		return boardDAO.insertBoardImage(image);
	}
	
}
