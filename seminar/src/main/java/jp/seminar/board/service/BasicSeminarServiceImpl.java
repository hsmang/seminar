package jp.seminar.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import jp.seminar.board.dao.BasicSeminarDAOImpl;
import jp.seminar.board.vo.BoardVO;
import jp.seminar.board.vo.BoardImageVO;
import jp.seminar.board.vo.ReplyVO;
import jp.seminar.paging.FirstRowPageSize;

@Service("boardService")
public class BasicSeminarServiceImpl implements BoardService {
	
	@Resource(name="boardDao")
	private BasicSeminarDAOImpl boardDAO;
	
	@Override
	public List<Map<String, Object>> getUserList() throws Exception {
		return boardDAO.selectUserList();
	}
	
	@Override
	public List<Map<String, Object>> getBoardList(FirstRowPageSize  firstRowpageSize) throws Exception{
		List<Map<String, Object>> boardList = boardDAO.selectList(firstRowpageSize);
		List<Map<String, Object>> userList = boardDAO.selectUserList();
		
		for(int i=0; i<boardList.size(); i++){
			for(int j=0; j<userList.size(); j++){
				Map<String, Object> map = new HashMap();
				
				if( boardList.get(i).get("user_idx") == userList.get(j).get("user_idx")){
					map.put("user_name", userList.get(j).get("user_name"));
					map.put("board_idx", boardList.get(i).get("board_idx"));
					map.put("board_subject", boardList.get(i).get("board_subject"));
					map.put("board_reg_date", boardList.get(i).get("board_reg_date"));
					map.put("board_update_date", boardList.get(i).get("board_update_date"));
					map.put("board_count", boardList.get(i).get("board_count"));
					boardList.set(i, map);
				}
			}
		}
		return boardList;
	}

	@Override
	public List<Map<String, Object>> getBoardDetail(int board_idx) throws Exception {
		List<Map<String, Object>> detail = boardDAO.selectDeatil(board_idx);
		List<Map<String, Object>> userList = boardDAO.selectUserList();
		
		Map<String, Object> map = new HashMap();
		for(int i=0; i<userList.size(); i++){
			if(detail.get(0).get("user_idx") == userList.get(i).get("user_idx")){
				map.put("user_name", userList.get(i).get("user_name"));
				map.put("board_idx", detail.get(0).get("board_idx"));
				map.put("board_subject", detail.get(0).get("board_subject"));
				map.put("board_reg_date", detail.get(0).get("board_reg_date"));
				map.put("board_update_date", detail.get(0).get("board_update_date"));
				map.put("board_count", detail.get(0).get("board_count"));
				map.put("board_content", detail.get(0).get("board_content"));
				detail.set(0, map);
			}
		}
		return detail;
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

	@Override
	public int getTotalCount() {
		return boardDAO.getTotalCount();
	}
	
}
